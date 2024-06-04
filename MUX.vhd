library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
    generic (
        N_BIT : integer := 32   	-- number of bits per input
    );
    port (
        MUX_X  : in  std_logic_vector(N_BIT * 8 - 1 downto 0); 
        MUX_S  : in  std_logic_vector(2 downto 0);
        MUX_Y  : out std_logic_vector(N_BIT - 1 downto 0)
    );
end MUX;

architecture MUX of MUX is
	 
    component MUX2 is
        generic ( N: integer := N_BIT );
        port (
				X1 : in  std_logic_vector(N - 1 downto 0);
            X0 : in  std_logic_vector(N - 1 downto 0);
            S  : in  std_logic;
            Y  : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    -- Internal signals
    signal SIG_MUX2_INS 	: std_logic_vector (N_BIT * 7 * 2 downto 0);
    signal SIG_SELECTOR 	: std_logic_vector (6 downto 0);

begin

	 SIG_MUX2_INS (8 * N_BIT - 1 downto 0) <= MUX_X;

    -- Outer mux2
    outer_mux2 : MUX2
        generic map (N => N_BIT)
        port map (
            X1 => SIG_MUX2_INS(N_BIT * 14 - 1 downto N_BIT * 13),
				X0 => SIG_MUX2_INS(N_BIT * 13 - 1 downto N_BIT * 12),
            S  => SIG_SELECTOR(6),
            Y  => MUX_Y
        );
    
    -- Generate inner MUX2 instances
    gen_mux2: for I in 1 to 6 generate
        inner_mux2: MUX2
            generic map (N => N_BIT)
            port map (
					 X1 => SIG_MUX2_INS(N_BIT * I * 2 - 1 downto N_BIT * (I * 2 - 1)),
					 X0 => SIG_MUX2_INS(N_BIT * (I * 2 - 1) - 1 downto N_BIT * (I * 2 - 2)),
                S  => SIG_SELECTOR(I - 1),
					 Y  => SIG_MUX2_INS(N_BIT * (8 + I) - 1 downto  N_BIT * (7 + I))
            );
    end generate gen_mux2;

    -- Assign selector signals
	 SIG_SELECTOR(6) <= MUX_S(2);  
	 SIG_SELECTOR(5 downto 4) <= (others => MUX_S(1));
	 SIG_SELECTOR(3 downto 0) <= (others => MUX_S(0));

end MUX;
