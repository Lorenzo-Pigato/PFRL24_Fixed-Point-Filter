library ieee;
use ieee.std_logic_1164.all;
  
entity FILTER_STEP_RESPONSE is
end FILTER_STEP_RESPONSE;
 
architecture TEST of FILTER_STEP_RESPONSE is 
 
    component FILTER
    port(
         X 		 : in  std_logic_vector(31 downto 0);
         K 		 : in  std_logic_vector(2 downto 0);
         INIT 	 : in  std_logic;
         OUTPUT : out  std_logic_vector(31 downto 0);
         VALID  : out  std_logic;
         RESET  : in  std_logic;
         CLK 	 : in  std_logic
        );
    end component;
    

   --Inputs
   signal X 	 : std_logic_vector(31 downto 0) := (others => '0');
   signal K 	 : std_logic_vector(2 downto 0) := (others => '0');
   signal INIT  : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CLK 	 : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(31 downto 0);
   signal VALID  : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 15 ns;
 
begin
   
	uut: FILTER PORT MAP (
          X 		=> X,
          K 		=> K,
          INIT 	=> INIT,
          OUTPUT 	=> OUTPUT,
          VALID 	=> VALID,
          RESET 	=> RESET,
          CLK 		=> CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 500 ns.
		RESET <= '1';
      wait for 500 ns;	
		RESET <= '0';
		
		wait for 30 ns;
		K    	<= "001";
		X	  	<= x"00AD0000";	-- 173.00, 16 bits integer and 16 mantissa
		INIT 	<= '1';
		
      wait for 70 ns;
		INIT 	<= '0';
		
		wait;
		
   end process;

END;
