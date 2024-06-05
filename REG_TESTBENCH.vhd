library ieee;
use ieee.std_logic_1164.all;
  
entity REG_TESTBENCH is
end REG_TESTBENCH;
 
architecture TEST of REG_TESTBENCH is 
 
    component REG
	 generic (N : integer := 3);
    port(
         CLK 	: in  std_logic;
         D 		: in  std_logic_vector(N - 1 downto 0);
         Q 		: out std_logic_vector(N - 1 downto 0);
         RESET : in  std_logic
        );
    end component;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal D : std_logic_vector(2 downto 0) := (others => '0');
   signal RESET : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
begin
 
   uut: REG PORT MAP (
          CLK => CLK,
          D => D,
          Q => Q,
          RESET => RESET
        );
		  
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
	
      wait for 100 ns;	

      wait for 5 ns;
		D <= "000";
		
		wait for 15 ns;
		D <= "001";
		
		wait for 20 ns;
		D <= "010";
		
		wait for 20 ns;
		D <= "011";
		
		wait for 20 ns;
		D <= "100";
		
		wait for 15 ns;
		RESET <= '1';
		D <= "100";
		
		wait for 30 ns;
		RESET <= '1';
		D <= "111";
		
		wait for 15 ns;
		RESET <= '0';
		
		wait for 10 ns;
		D <= "101";

      wait;
   end process;

END;
