library ieee;
use ieee.std_logic_1164.all;

entity C2 is
	generic( N : integer := 32 );
    
    port(
        A 	: in  std_logic_vector (N - 1 downto 0);
        B 	: in  std_logic_vector (N - 1 downto 0);
        SUM : out std_logic_vector (N downto 0)
    );
end C2;

architecture C2 of C2 is

	signal SIG_P  : std_logic_vector (N - 1 downto 0); -- propagation
   signal SIG_G  : std_logic_vector (N - 1 downto 0); -- generation 
   signal SIG_C  : std_logic_vector (N - 1 downto 0); -- carry i
	signal SIG_CN : std_logic_vector (N - 1 downto 0); -- carry i+1

   component FA is
     port(
        C_IN   : in std_logic;
        A      : in std_logic; 
        B    	 : in std_logic; 
        C_OUT  : out std_logic;
        SUM    : out std_logic
     );
   end component;
	
	component HA is
		port(
			A		 :	in std_logic;
			B		 :	in std_logic;
			SUM	 :	out std_logic;
			C_OUT	 :	out std_logic
		);
	 end component;
		
	begin
	
		propagation_calc : HA 
			port map(
				A      => A(0), 
				B	    => B(0),                     
				SUM    => SIG_P(0)
         );
		
		gen_propagation : for I in 1 to N - 1 generate
			SIG_P(I) <= A(I);
      end generate gen_carry_save;
		
		SIG_G(0) <= A(0) and B(0);
		gen_generation : for I in 1 to N - 1 generate
			SIG_G(I) <= '0';
      end generate gen_carry_save;

end CLA;

