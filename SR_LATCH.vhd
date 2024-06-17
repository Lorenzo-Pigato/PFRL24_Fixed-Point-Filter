library ieee;
use ieee.std_logic_1164.all;

entity SR_LATCH is
	port( S: in std_logic;
		R: in std_logic;
		Q: out std_logic
	);
	
end SR_LATCH;

architecture SR_LATCH of SR_LATCH is
	begin
		latch: process(S, R)
		begin
		   if	  ( S = '0' and R = '0' ) then null;
		   elsif( S = '0' and R = '1' ) then Q <= '0';
			elsif( S = '1' and R = '0' ) then Q <= '1';
			elsif( S = '1' and R = '1' ) then Q <= '1';
			end if;
	end process;
end SR_LATCH;