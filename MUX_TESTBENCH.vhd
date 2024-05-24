library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX_TESTBENCH is
end MUX_TESTBENCH;

architecture TEST of MUX_TESTBENCH is

    -- Component Declaration for the Unit Under Test (UUT)
    component MUX
        generic (
            N_BIT : integer := 3;
            S_BIT : integer := 2
        );
        port (
            MUX_X  : in  std_logic_vector((2 ** S_BIT) * N_BIT - 1 downto 0);
            MUX_S  : in  std_logic_vector(S_BIT - 1 downto 0);
            MUX_Y  : out std_logic_vector(N_BIT - 1 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal MUX_X  : std_logic_vector((2 ** 2) * 3 - 1 downto 0);
    signal MUX_S  : std_logic_vector(2 - 1 downto 0);
    signal MUX_Y  : std_logic_vector(3 - 1 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: MUX
        generic map (
            N_BIT => 3,
            S_BIT => 2
        )
        port map (
            MUX_X => MUX_X,
            MUX_S => MUX_S,
            MUX_Y => MUX_Y
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        MUX_X <= "000001010011";  -- Concatenation of 4 operands (3 bits each): "000", "001", "010", "011"
        MUX_S <= "00";
        wait for 10 ns;
        
        MUX_S <= "01";
        wait for 10 ns;
        
        MUX_S <= "10";
        wait for 10 ns;
        
        MUX_S <= "11";
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process;

end;
