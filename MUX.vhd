library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
    generic (
        N_BIT : integer := 32;   -- size of a single operand
        S_BIT : integer := 3   	-- selector size -> operands = 2^S_BIT
    );
    port (
        MUX_X  : in  std_logic_vector((2 ** S_BIT) * N_BIT - 1 downto 0); 
        MUX_S  : in  std_logic_vector(S_BIT - 1 downto 0);
        MUX_Y  : out std_logic_vector(N_BIT - 1 downto 0)
    );
end MUX;

architecture MUX of MUX is
	 
    component MUX2 is
        generic ( N: integer := N_BIT );
        port (
            X0 : in  std_logic_vector(N - 1 downto 0);
            X1 : in  std_logic_vector(N - 1 downto 0);
            S  : in  std_logic;
            Y  : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    -- Internal signals
    signal SIG_MUX2_INS : std_logic_vector (((2 ** S_BIT) - 1) * N_BIT * 2 - 1 downto 0);   -- 2^S_BIT * 2 * N_BIT - 1
    signal SIG_SELECTOR : std_logic_vector((2 ** S_BIT) - 2 downto 0);  -- #Selectors equals #Mux

begin

	 SIG_MUX2_INS ((((2 ** S_BIT) - 1) * N_BIT * 2) - 1 downto (((2 ** S_BIT) - 1) * N_BIT * 2) - (N_BIT * (2 ** S_BIT))) <= MUX_X;

    -- Outer mux2
    top_mux2 : MUX2
        generic map (N => N_BIT)
        port map (
            X0 => SIG_MUX2_INS(N_BIT - 1 downto 0),
            X1 => SIG_MUX2_INS(2 * N_BIT - 1 downto N_BIT),
            S  => MUX_S(0),
            Y  => MUX_Y
        );
    
    -- Generate inner MUX2 instances
    gen_mux2: for I in 1 to (2 ** S_BIT) - 2 generate
        inner_mux2: MUX2
            generic map (N => N_BIT)
            port map (
					 X0 => SIG_MUX2_INS((I * N_BIT + N_BIT * 2) - 1 downto (I * N_BIT + N_BIT)),
					 X1 => SIG_MUX2_INS((I * N_BIT + N_BIT * 3) - 1 downto (I * N_BIT + N_BIT * 2)),
                S  => SIG_SELECTOR(I),
					 Y  => SIG_MUX2_INS(((I - 1) * N_BIT + N_BIT) - 1 downto ((I - 1) * N_BIT))
            );
    end generate gen_mux2;

    -- Assign selector signals
    process(MUX_S)
    begin
        for I in 1 to S_BIT - 1 loop
            for K in 0 to 2 ** I - 1 loop
                SIG_SELECTOR(K + 2 ** (I - 1)) <= MUX_S(I);
            end loop;
        end loop;
    end process;

end MUX;
