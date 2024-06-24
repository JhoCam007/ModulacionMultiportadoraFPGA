library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity conv_bin is
  PORT (
    clock : IN STD_LOGIC;
    
    ieee_tvalid : IN STD_LOGIC;
    ieee_tdata  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    binario     : OUT std_logic_vector(13 downto 0);
    t_valid_bin : OUT STD_LOGIC;
    deci        : OUT STD_LOGIC
  );
end conv_bin;

architecture Behavioral of conv_bin is

attribute dont_touch : string;

signal deci_temp : std_logic := '0';
attribute dont_touch of deci_temp : signal is "yes";

signal binario_temp : std_logic_vector(13 downto 0) := (others => '0');
attribute dont_touch of binario_temp : signal is "yes";

signal t_valid_bin_temp : STD_LOGIC := '0';
attribute dont_touch of t_valid_bin_temp : signal is "yes";

signal signo_aux : std_logic := '0';
attribute dont_touch of signo_aux : signal is "yes";
signal expo_aux : std_logic_vector(7 downto 0) := (others => '0');
attribute dont_touch of expo_aux : signal is "yes";
signal mant_aux : std_logic_vector(22 downto 0) := (others => '0');
attribute dont_touch of mant_aux : signal is "yes";

begin

signo_aux <= ieee_tdata(31);
expo_aux <= ieee_tdata(30 downto 23);
--mant_aux <= ieee_tdata(22 downto 0);
mant_aux <= '1' & ieee_tdata(22 downto 1);

control : process(clock, ieee_tvalid, signo_aux)
    begin
        if ieee_tvalid = '1' then
            if rising_edge(clock) then
                
                t_valid_bin_temp <= '1';
                
                if signo_aux = '0' then
                    if (expo_aux = "01111110") then --[126]
                        binario_temp <= "00000000000001"; --[1]
                        deci_temp <= '0';
                    elsif (expo_aux = "01111111") then --[127]
                        binario_temp <= (12 downto 0 => '0') & mant_aux(22);
                        deci_temp <= mant_aux(21);
                    elsif (expo_aux = "10000000") then --[128]
                        binario_temp <= (11 downto 0 => '0') & mant_aux(22 downto 21);
                        deci_temp <= mant_aux(20);
                    elsif (expo_aux = "10000001") then --[129]
                        binario_temp <= (10 downto 0 => '0') & mant_aux(22 downto 20);
                        deci_temp <= mant_aux(19);
                    elsif (expo_aux = "10000010") then --[130]
                        binario_temp <= (9 downto 0 => '0') & mant_aux(22 downto 19);
                        deci_temp <= mant_aux(18);
                    elsif (expo_aux = "10000011") then --[131]
                        binario_temp <= (8 downto 0 => '0') & mant_aux(22 downto 18);
                        deci_temp <= mant_aux(17);
                    elsif (expo_aux = "10000100") then --[132]
                        binario_temp <= (7 downto 0 => '0') & mant_aux(22 downto 17);
                        deci_temp <= mant_aux(16);
                    elsif (expo_aux = "10000101") then --[133]
                        binario_temp <= (6 downto 0 => '0') & mant_aux(22 downto 16);
                        deci_temp <= mant_aux(15);
                    elsif (expo_aux = "10000110") then --[134]
                        binario_temp <= (5 downto 0 => '0') & mant_aux(22 downto 15);
                        deci_temp <= mant_aux(14);
                    elsif (expo_aux = "10000111") then --[135]
                        binario_temp <= (4 downto 0 => '0') & mant_aux(22 downto 14);
                        deci_temp <= mant_aux(13);
                    elsif (expo_aux = "10001000") then --[136]
                        binario_temp <= (3 downto 0 => '0') & mant_aux(22 downto 13);
                        deci_temp <= mant_aux(12);
                    elsif (expo_aux = "10001001") then --[137]
                        binario_temp <= (2 downto 0 => '0') & mant_aux(22 downto 12);
                        deci_temp <= mant_aux(11);
                    elsif (expo_aux = "10001010") then --[138]
                        binario_temp <= (1 downto 0 => '0') & mant_aux(22 downto 11);
                        deci_temp <= mant_aux(10);
                    elsif (expo_aux = "10001011") then --[139]
                        binario_temp <= '0' & mant_aux(22 downto 10);
                        deci_temp <= mant_aux(9);
                    elsif (expo_aux = "10001100") then --[140]
                        binario_temp <= mant_aux(22 downto 9);
                        deci_temp <= mant_aux(8);
                    else
                        if (expo_aux < "01111110") then
                            binario_temp <= "00000000000000";
                            deci_temp <= '0';
                        else
                            binario_temp <= "11111111111111";
                            deci_temp <= '0';
                        end if;
                    end if;
                else
                    binario_temp <= "00000000000000";
                    deci_temp <= '0';
                end if;
            end if;
        else
            binario_temp <= "00000000000000";
            deci_temp <= '0';
            t_valid_bin_temp <= '0';
        end if;
    end process;
    -- Asignacion de seniales temporales a salidas
    binario <= binario_temp;
    deci <= deci_temp;
    t_valid_bin <= t_valid_bin_temp;
end Behavioral;