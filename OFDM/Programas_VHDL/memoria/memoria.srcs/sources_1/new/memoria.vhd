library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria is
    Port (
        sel : in std_logic_vector(9 downto 0);
        dato : out std_logic_vector(35 downto 0)
        );
end memoria;

architecture Behavioral of memoria is

begin
  with sel select
     dato <= "000000000000000000000000000000000000" when "0000000000", --[0]
             "000000000000000000000000000001101000" when "0000000001", --[1] --[H] --x[68]
             "000000000000000000000000000001001010" when "0000000010", --[2] --[J] --x[4a]
             "000000000000000000000000000000111111" when "0000000011", --[3] --[?] --x[3f]
             "000000000000000000000000000000000000" when others;
end Behavioral;