library ieee;
use ieee.std_logic_1164.all;

entity FA is
	port(
		A		:	in std_logic;
		B		:	in std_logic;
		C_IN	:	in std_logic;
		SUM	:	out std_logic;
		C_OUT	:	out std_logic
	);
end FA;

architecture FA of FA is
	begin
		SUM <= A xor B xor C_IN;
		C_OUT <= (A and B) or (B and C_IN) or (A and C_IN);

end FA;

