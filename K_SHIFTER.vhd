library ieee;
use ieee.std_logic_1164.all;

entity K_SHIFTER is
    port (
        SH_AMNT  : in  std_logic_vector(2 downto 0); 
        INPUT	  : in  std_logic_vector(31 downto 0);
		  OUTPUT	  : out std_logic_vector(31 downto 0)
    );

end K_SHIFTER;

architecture K_SHIFTER of K_SHIFTER is

	component MUX is
      generic ( N_BIT: integer := 32 );
      port (
			MUX_X  : in  std_logic_vector(32 * 8 - 1 downto 0); 
			MUX_S  : in  std_logic_vector(2 downto 0);
			MUX_Y  : out std_logic_vector(32 - 1 downto 0)
		);
    end component;
	 
	 component SHR is
		generic(N : integer := 32);
		port(
			SHR_IN  : in  std_logic_vector (N - 1 downto 0);
			SHR_OUT : out std_logic_vector (N - 1 downto 0)
		);
	 end component;
	 
	 -- Internal signals
    signal SIG_VECT 	: std_logic_vector (32 * 8 - 1 downto 0);
	 
begin

	SIG_VECT (31 downto 0) <= INPUT;  -- Not shifted input is connected to S -> 000

    -- MUX8
    mux8 : MUX
        generic map (N_BIT => 32)
        port map (
            MUX_X  => SIG_VECT,
				MUX_S  => SH_AMNT,
				MUX_Y  => OUTPUT
        );
    
    -- Generate Shit Right istances
    gen_shr: for I in 1 to 7 generate
    shr32: SHR
            generic map (N => 32)
            port map (
					 SHR_IN	=> SIG_VECT(32 * I - 1 downto 32 * (I - 1)),
					 SHR_OUT	=> SIG_VECT(32 * (I + 1) - 1 downto 32 * I)
            );
    end generate gen_shr;


end k_shifter;

