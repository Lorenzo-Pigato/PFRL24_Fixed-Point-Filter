library ieee;
use ieee.std_logic_1164.all;
  
entity C2_TESTBENCH is
end C2_TESTBENCH;
 
architecture TEST of C2_TESTBENCH is 
 
    component C2
		generic (N : integer := 5);
		port(
			A 		 : in   std_logic_vector(4 downto 0);
			C2_OUT : out  std_logic_vector(4 downto 0)
      );
    end component;
    

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal C2_OUT : std_logic_vector(4 downto 0);
 
begin
   uut: C2
		generic map (N => 5)
		port map (
          A => A,
          C2_OUT => C2_OUT
      );
		  
   stim_proc: process
   begin		
      wait for 100 ns;	
		A <= "00000";
		
		wait for 10 ns;	
		A <= "00001";
		
		wait for 10 ns;	
		A <= "00010";
		
		wait for 10 ns;
		A <= "00011";
		
		wait for 10 ns;
		A <= "11111";
		
		wait for 10 ns;
		A <= "11110";
		
		wait for 10 ns;
		A <= "11100";

      wait;
   end process;

END;
