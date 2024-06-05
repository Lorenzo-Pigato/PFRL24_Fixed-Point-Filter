
library ieee;
use ieee.std_logic_1164.all;

entity D_FLIP_FLOP is
	port( 
	CLK :  in   std_logic;
	D 	 :  in   std_logic;
	Q	 :  out  std_logic;
	RESET: in   std_logic
);
end D_FLIP_FLOP;

architecture D_FLIP_FLOP of D_FLIP_FLOP is
begin
	FF: process( CLK, RESET )
		begin
			if( RESET = '1' ) then
			Q <= '0';
		else 
			if( CLK'event and CLK = '1' ) then
				Q <= D;
		end if;
	end if;
end process;
end D_FLIP_FLOP;

