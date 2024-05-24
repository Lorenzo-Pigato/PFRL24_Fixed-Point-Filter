library ieee;
use ieee.std_logic_1164.all;
 
entity MUX2_TESTBENCH is
end MUX2_TESTBENCH;
 
architecture TEST of MUX2_TESTBENCH is 
 
    component MUX2 is
		generic( N: integer := 5 );
		port(
				X0 : in  std_logic_vector(N - 1 downto 0);
				X1 : in  std_logic_vector(N - 1 downto 0);
				S : in  std_logic;
				Y : out  std_logic_vector(N - 1 downto 0)
			  );
    end component;

   --Inputs
   signal X0 : std_logic_vector(4 downto 0);
   signal X1 : std_logic_vector(4 downto 0);
   signal S : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(4 downto 0);
 
begin
 
   uut: MUX2 port map (
          X0 => X0,
          X1 => X1,
          S => S,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		X0 <= "00000";
		X1 <= "00001";
		
		S <= '0';
		
		wait for 100 ns;	
		S <= '1';
		
		wait for 100 ns;	
		S <= '0';

      wait;
   end process;

end;
