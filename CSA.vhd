library ieee;
use ieee.std_logic_1164.all;

entity CSA is

    generic( N : integer := 32 );
    
    port(
        A 	: in  std_logic_vector (N - 1 downto 0);
        B 	: in  std_logic_vector (N - 1 downto 0);
        C 	: in  std_logic_vector (N - 1 downto 0);
        SUM : out std_logic_vector (N + 1 downto 0)
    );
end CSA;

architecture CSA of CSA is

    signal CS     : std_logic_vector (N - 1 downto 0); --carry save
    signal T      : std_logic_vector (N - 1 downto 0); --temp results 
    signal C_IN   : std_logic_vector (N - 1 downto 0); --second layer carry input

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
      gen_carry_save : for I in 0 to N - 1 generate
            carry_save : FA 
                  port map(
                        A      => A (I),
                        B      => B (I),
                        C_IN   => C (I),
                        C_OUT  => CS(I),
                        SUM    => T (I)
                  );
      end generate gen_carry_save;
    
      gen_full_adder : for I in 0 to N - 2 generate
            full_adder : FA
                  port map(
                        A      => CS(I),
                        B      => T(I + 1),
                        C_IN   => C_IN(I),
                        C_OUT  => C_IN(I + 1),
                        SUM    => SUM(I + 1)
                  );
      end generate gen_full_adder;
      
      half_adder : HA 
            port map(
                  A      => CS(N - 1), 
                  B	    => C_IN(N - 1),                     
                  SUM    => SUM(N),          
                  C_OUT  => SUM(N + 1)       -- carry output is CSA's MSB
            );
      
      C_IN(0) <= '0';
      SUM(0)    <= T(0);

end CSA;