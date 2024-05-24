library ieee;
use ieee.std_logic_1164.all;

entity CLOCK_GATE is
	port(
				EN				:	in std_logic;
				CLK_IN		:	in std_logic;
				CLK_OUT		:	out std_logic;
				NOT_CLK_OUT	:	out std_logic
			);
end CLOCK_GATE;

architecture CLOCK_GATE of CLOCK_GATE is
begin
	CLK_OUT <= CLK_IN and EN;
	NOT_CLK_OUT <= (not CLK_IN) and EN;
end CLOCK_GATE;

