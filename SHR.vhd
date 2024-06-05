library ieee;
use ieee.std_logic_1164.all;

entity SHR is
    generic(
        N : integer := 32
    );
    port(
        SHR_IN  : in  std_logic_vector (N - 1 downto 0);
        SHR_OUT : out std_logic_vector (N - 1 downto 0)
    );
	 
	 signal SIG_MSB : std_logic;
	 
end SHR;

architecture SHR of SHR is
begin
	 SIG_MSB <= SHR_IN(N - 1);
    SHR_OUT <= SIG_MSB & SHR_IN(N - 1 downto 1);
end SHR;
