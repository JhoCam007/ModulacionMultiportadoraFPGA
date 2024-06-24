library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity redondeo is
    PORT (
        clock : IN STD_LOGIC;
        binario_tvalid : IN STD_LOGIC;
        deci : IN STD_LOGIC;
        binario : IN std_logic_vector(13 downto 0);
        redondeo : OUT std_logic_vector(13 downto 0)
    );
end redondeo;

architecture Behavioral of redondeo is
attribute dont_touch : string;

signal num_sum : std_logic_vector(13 downto 0) := (others => '0');
attribute dont_touch of num_sum : signal is "yes";

signal redondeo_temp : std_logic_vector(13 downto 0) := (others => '0');
attribute dont_touch of redondeo_temp : signal is "yes";

begin
    num_sum <= (12 downto 0 => '0') & deci;
    control : process(clock, binario_tvalid)
        begin 
            if binario_tvalid = '1' then
                if rising_edge(clock) then
                    redondeo_temp <= binario + num_sum;
                 end if;
            end if;
    end process;
  -- Asignacion de seniales temporales a salidas
  redondeo <= redondeo_temp;
end Behavioral;