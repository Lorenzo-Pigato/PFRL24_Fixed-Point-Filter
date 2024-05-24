library ieee;
use ieee.std_logic_1164.all;

entity MUX2 is
	
	generic(N : integer := 32);
	
	port(
			X0		:	in  std_logic_vector (N - 1 downto 0);
			X1		:	in  std_logic_vector (N - 1 downto 0);
			S	 	:	in  std_logic;
			Y		:  out std_logic_vector (N - 1 downto 0)
	);
	
end MUX2;

architecture MUX2 of MUX2 is
	begin
	with S select 
		Y <= X0 when '0',
			  X1 when '1';

end MUX2;


