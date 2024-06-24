library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bits16_bits32 is
    PORT(
        input16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clock1 : in std_logic;
        output32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );

end bits16_bits32;

architecture Behavioral of bits16_bits32 is

signal output_32 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
attribute dont_touch : string;
attribute dont_touch of output_32 : signal is "true";

begin
    process(input16,clock1)
    begin
    if rising_edge(clock1) then
    if input16 = "0000000000000000" or input16 = "1000000000000000" or input16 = "UUUUUUUUUUUUUUUU" then 
        output_32 <= "00000000000000000000000000000000";
    else
        output_32(31) <= input16(15);
        output_32(22 downto 13) <= input16(9 downto 0);
        output_32(30 downto 23) <= std_logic_vector(unsigned(input16(14 downto 10))+"01110000");
        
    end if;
    end if;
    end process;
    
    output32 <= output_32;
end Behavioral;
