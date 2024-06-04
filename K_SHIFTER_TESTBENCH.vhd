library ieee;
use ieee.std_logic_1164.all;
 
entity K_SHIFTER_TESTBENCH is
end K_SHIFTER_TESTBENCH;
 
architecture TEST of K_SHIFTER_TESTBENCH is 
 
    component K_SHIFTER
    port(
         SH_AMNT 	: in  std_logic_vector(2 downto 0);
         INPUT		: in	std_logic_vector(31 downto 0);
         OUTPUT	: out std_logic_vector(31 downto 0)
        );
    end component;
    

   --inputs
   signal SIG_SH_AMNT : std_logic_vector(2 downto 0) := (others => '0');
   signal SIG_INPUT   : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal SIG_OUTPUT : std_logic_vector(31 downto 0);
 
begin
 
	-- instantiate the unit under test (uut)
   uut: K_SHIFTER port map (
          SH_AMNT => SIG_SH_AMNT,
          INPUT 	=> SIG_INPUT,
          OUTPUT 	=> SIG_OUTPUT
        );

   -- stimulus process
   stim_proc: process
   begin		
      
      wait for 100 ns;	
		SIG_INPUT 	<= "00000000000000000000000010000000";
		SIG_SH_AMNT  <= "000";
		
		
      wait for 10 ns;	
		SIG_SH_AMNT  <= "001";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "010";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "011";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "100";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "101";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "110";
		
		wait for 10 ns;	
		SIG_SH_AMNT  <= "111";
		
      wait;
   end process;

end;
