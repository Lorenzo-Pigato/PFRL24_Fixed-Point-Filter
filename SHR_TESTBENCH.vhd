library ieee;
use ieee.std_logic_1164.all;
 
entity SHR_TESTBENCH is
end SHR_TESTBENCH;
 
architecture TEST of SHR_TESTBENCH is 
 
    component SHR
    port(
         SHR_IN 	: in  std_logic_vector(31 downto 0);
         SHR_OUT 	: out std_logic_vector(31 downto 0)
        );
    end component;
    

   signal SHR_IN  : std_logic_vector(31 downto 0) := (others => '0');
   signal SHR_OUT : std_logic_vector(31 downto 0);
   
begin
 
   test_unit: SHR 
		port map (
				SHR_IN  => SHR_IN,
				SHR_OUT => SHR_OUT
		);
 
   test_process: process
   begin		

      wait for 400 ns;	
		SHR_IN <= "00000000000000000000000000000001";

      wait for 100 ns;
		SHR_IN <= "01000000000000000000000000000111";
		
		wait for 100 ns;
		SHR_IN <= "10000000000000000000000000000000";
		
		
		wait for 100 ns;
		SHR_IN <= "10000000001100000011000000000011";

      wait;
   end process;

end;
