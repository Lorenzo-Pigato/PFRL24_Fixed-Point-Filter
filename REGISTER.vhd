library ieee;
use ieee.std_logic_1164.all;

entity REG is
	generic( N : integer := 32 );
	port(
		CLK 	: in  std_logic;
      D 		: in  std_logic_vector (N - 1 downto 0);
		Q		: out std_logic_vector (N - 1 downto 0);
      RESET : in  std_logic;
   );
	
end REG;

architecture REG of REG is

	component D_FLIP_FLOP is
		port( 
			CLK :  in   std_logic;
			D 	 :  in   std_logic;
			Q	 :  out  std_logic;
			RESET: in   std_logic
	);
	end component;

begin

	gen_flipflop: for I in N - 1 downto 0 generate
		d_ff: D_FLIP_FLOP
			port map(
				CLK 	=> CLK,
            D   	=> D (I),
				Q   	=> C (I),
				RESET => RESET
			);

end REG;

