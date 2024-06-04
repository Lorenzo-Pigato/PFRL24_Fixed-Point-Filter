library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
	port(
		A		:	in std_logic;
		B		:	in std_logic;
		SUM	:	out std_logic;
		C_OUT	:	out std_logic
	);
end HA;

architecture HA of HA is
	begin
		SUM <= A xor B;
		C_OUT <= (A and B);

end HA;