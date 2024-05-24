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
end SHR;

architecture RTL of SHR is
begin
    SHR_OUT <= '0' & SHR_IN(N - 1 downto 1);
end RTL;
