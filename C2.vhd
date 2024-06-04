library ieee;
use ieee.std_logic_1164.all;

entity C2 is
	generic( N : integer := 32 );
    
    port(
        A 		: in  std_logic_vector (N - 1 downto 0);
        C2_OUT : out std_logic_vector (N - 1 downto 0)
    );
end C2;

architecture C2 of C2 is

	signal SIG_NA : std_logic_vector (N - 1 downto 0); -- not A[]
	signal SIG_1  : std_logic_vector (N - 1 downto 0); -- contains 1
	signal SIG_P  : std_logic_vector (N - 1 downto 0); -- propagation
   signal SIG_G  : std_logic_vector (N - 1 downto 0); -- generation 
   signal SIG_C  : std_logic_vector (N - 1 downto 0); -- carry C[i+1]
	
	signal not_connected : std_logic;

   component FA is
     port(
        C_IN   : in std_logic;
        A      : in std_logic; 
        B    	 : in std_logic; 
        C_OUT  : out std_logic;
        SUM    : out std_logic
     );
   end component;
		
	begin
		
		SIG_NA <= not A;
		
		SIG_1(0) <= '1';												
		SIG_1(N - 1 downto 1) <= (others => '0');	
		
		
		SIG_P(N - 1 downto 1) <= SIG_NA(N - 1 downto 1); 			-- i != 0 -> P[i] = X[i] or 0 -> P[i] = not A[i]
		SIG_P(0) <= '1';														-- P[0] = X[0] or 1 = (not A[0]) or 1 -> 1

		
		SIG_G(0) <= SIG_NA(0);												-- G[0] = X[0] and 1 -> G[0] = not A[0]
		SIG_G(N - 1 downto 1) <= (others => '0');						-- G[i] = X[i] and 0 -> G[i] = 0
		
		
		SIG_C(0) <= '0';														-- First carry is always 0;
		SIG_C(1) <= SIG_G(0) or (SIG_P(0) and SIG_C(0));
		
		gen_cla_logic : for I in 1 to N - 2 generate
			SIG_C(I + 1) <= SIG_G(I) or (SIG_P(I) and SIG_C(I));
		end generate gen_cla_logic;
		
		
		gen_carry_lookahead : for I in 0 to N - 1 generate
            cla : FA 
                  port map(
                        A      => SIG_NA(I),
                        B      => SIG_1(I),
                        C_IN   => SIG_C(I),
                        C_OUT  => not_connected,
                        SUM    => C2_OUT(I)
                  );
      end generate gen_carry_lookahead;


end C2;

