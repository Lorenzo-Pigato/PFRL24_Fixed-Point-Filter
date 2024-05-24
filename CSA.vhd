library ieee;
use ieee.std_logic_1164.all;

entity CSA is

    generic( N : integer := 32 );
    
    port(
        A : in  std_logic_vector (N - 1 downto 0);
        B : in  std_logic_vector (N - 1 downto 0);
        C : in  std_logic_vector (N - 1 downto 0);
        Z : out std_logic_vector (N + 1 downto 0)
    );
end CSA;

architecture CSA of CSA is

    signal CS     : std_logic_vector (N - 1 downto 0); --carry save
    signal T      : std_logic_vector (N - 1 downto 0); --temp results 
    signal C_IN   : std_logic_vector (N - 1 downto 0); --second layer carry input

    component FA is
        port(
            CIN   : in std_logic;
            X     : in std_logic; 
            Y     : in std_logic; 
            COUT  : out std_logic;
            S     : out std_logic
        );
    end component;
    
    begin
      gen_carry_save : for I in 0 to N - 1 generate
            carry_save : FA 
                  port map(
                        X     => A (I),
                        Y     => B (I),
                        CIN   => C (I),
                        COUT  => CS(I),
                        S     => T (I)
                  );
      end generate gen_carry_save;
    
      gen_full_adder : for I in 0 to N - 2 generate
            full_adder : FA
                  port map(
                        X     => CS(I),
                        Y     => T(I + 1),
                        CIN   => C_IN(I),
                        COUT  => C_IN(I + 1),
                        S     => Z(I + 1)
                  );
      end generate gen_full_adder;
      
      last_full_adder : FA 
            port map(
                  X     => CS(N - 1), 
                  Y     => '0',	 			-- one of last full adder's operand must be set to '0' and 
                  CIN   => C_IN(N - 1),                     
                  S     => Z(N),          
                  COUT  => Z(N + 1)       -- carry output is CSA's MSB
            );
      
      C_IN(0) <= '0';
      Z(0)    <= T(0);

end CSA;