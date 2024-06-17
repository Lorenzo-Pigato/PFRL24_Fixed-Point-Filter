library ieee;
use ieee.std_logic_1164.all;
  
entity FILTER_TESTBENCH is
end FILTER_TESTBENCH;
 
architecture TEST of FILTER_TESTBENCH is 
 
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
   constant CLK_period : time := 40 ns;
 
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
      -- hold reset state for 100 ns.
		RESET <= '1';
      wait for 100 ns;	
		RESET <= '0';
		
		wait for 27 ns;
		K    	<= "111";
		X	  	<= x"1E1F0000";	-- 7711.00, 16 bits integer and 16 mantissa
		INIT 	<= '1';
		
      wait for 100 ns;
		INIT 	<= '0';
		
		wait for CLK_period*10;
		X		<= x"0D050000";	-- 3333.00
		
		wait for CLK_period*10;
		K		<= "001";
		
		wait for 50 ns;
		INIT	<= '1';
		
		wait for 20 ns;
		INIT	<= '0';
		
		wait for CLK_period*15;
		X		<= x"FF4D0000";	-- -179.00

		
		wait;
		
   end process;

END;
