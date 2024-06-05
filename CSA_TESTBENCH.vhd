library ieee;
use ieee.std_logic_1164.all;
  
entity CSA_TESTBENCH is
end CSA_TESTBENCH;
 
architecture TEST of CSA_TESTBENCH is 
  
    component CSA
	 generic (N : integer := 32);
    port(
         A : in  std_logic_vector(31 downto 0);
         B : in  std_logic_vector(31 downto 0);
         C : in  std_logic_vector(31 downto 0);
         SUM : out  std_logic_vector(33 downto 0)
        );
    end component;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal C : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(33 downto 0);
 
BEGIN
 
   uut: CSA PORT MAP (
          A => A,
          B => B,
          C => C,
          SUM => SUM
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= "00000000000100101000000000000001";
		B <= "00000001000101101000000000000001";
		C <= "00000000001101000000000000000001";

      wait;
   end process;

END;
