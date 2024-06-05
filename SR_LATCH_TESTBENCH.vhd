library ieee;
use ieee.std_logic_1164.all;
 
entity SR_LATCH_TESTBENCH is
end SR_LATCH_TESTBENCH;
 
architecture TESET of SR_LATCH_TESTBENCH is 
 
    component SR_LATCH
    port(
         S : in  std_logic;
         R : in  std_logic;
         Q : out  std_logic
        );
    end component;
    

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
BEGIN
 
   uut: SR_LATCH port map (
          S => S,
          R => R,
          Q => Q
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		S <= '0';
		R <= '1';
		
		wait for 10 ns;
		S <= '0';
		R <= '0';
		
		wait for 10 ns;
		S <= '1';
		R <= '1';
		
		wait for 10 ns;
		S <= '1';
		R <= '0';
		
		wait for 10 ns;
		S <= '0';
		R <= '1';
		
		wait for 10 ns;
		S <= '1';
		R <= '0';
		
		wait for 10 ns;
		S <= '0';
		R <= '0';
		
		wait for 10 ns;
		S <= '1';
		R <= '1';
		
		wait for 10 ns;
		S <= '0';
		R <= '0';
		
      wait;
   end process;

END;
