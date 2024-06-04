
library ieee;
use ieee.std_logic_1164.all;
 
entity D_FLIP_FLOP_TESTBENCH is
end D_FLIP_FLOP_TESTBENCH;
 
architecture D_FLIP_FLOP_TESTBENCH of D_FLIP_FLOP_TESTBENCH is 
 
    -- component declaration for the unit under test (uut)
 
    component D_FLIP_FLOP
		port( 
			CLK :  in   std_logic;
			D 	 :  in   std_logic;
			Q	 :  out  std_logic;
			RESET: in   std_logic
	   );
    end component;
    

   --inputs
   signal CLK 	 : std_logic := '0';
   signal D 	 : std_logic := '0';
   signal RESET : std_logic := '0';

 	--outputs
   signal Q     : std_logic;

   -- clock period definitions
   constant clk_period : time := 10 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: D_FLIP_FLOP port map (
          CLK => CLK,
          D   => D,
          Q   => Q,
          RESET => RESET
        );

   -- clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- stimulus process
   stim_proc: process
   begin		
      
      wait for 100 ns;	
		D <= '0';
		
      wait for 20 ns;
		D <= '1';
		
		wait for 30 ns;
		D <= '1';
		
		wait for 30 ns;
		D <= '0';
		
		wait for 30 ns;
		D <= '1';
		
		wait for 30 ns;
		RESET <= '1';
		
		wait for 30 ns;
		RESET <= '1';
		D <= '1';
		
		wait for 30 ns;
		RESET <= '0';
		

      wait;
   end process;

end;
