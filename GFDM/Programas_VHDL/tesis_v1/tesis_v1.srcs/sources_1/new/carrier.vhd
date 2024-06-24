library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity carrier is
    PORT(
        n       : IN  std_logic_vector(1 DOWNTO 0);
        r       : OUT std_logic_vector(15 DOWNTO 0)
    );
end carrier;

architecture Behavioral of carrier is

begin
    with n select 
        r <=
			"0011110000000000" when "00",
			"0000000000000000" when "01",
			"1011110000000000" when "10",
			"0000000000000000" when "11",
			"0000000000000000" when  others;

end Behavioral;
