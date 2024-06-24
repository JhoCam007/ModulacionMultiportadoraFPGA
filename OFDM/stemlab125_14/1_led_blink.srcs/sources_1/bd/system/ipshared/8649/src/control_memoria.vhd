library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity control_memoria is
    PORT(
        clock       : in std_logic;
        ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx     : out std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
        finish_img  : out std_logic;
        cont_sal : out std_logic_vector(13 downto 0)
        );
end control_memoria;

architecture Behavioral of control_memoria is

attribute dont_touch : string;

constant selection_tx1 : std_logic_vector := "00";

type estado_modulation  is (Estado1, Estado2, Estado3);
signal estado_actual_mod    : estado_modulation := Estado1;
attribute dont_touch of estado_actual_mod : signal is "yes";

signal cont : std_logic_vector(13 downto 0) := (others => '0');
attribute dont_touch of cont : signal is "yes";

signal cont_fin : std_logic_vector(1 downto 0) := (others => '0');
attribute dont_touch of cont_fin : signal is "yes";

signal cont_trans : std_logic_vector(25 downto 0) := (others => '0');
attribute dont_touch of cont_trans : signal is "yes";

signal start_tx_signal : std_logic := '0';
attribute dont_touch of start_tx_signal : signal is "yes";

signal finish_img_signal : std_logic := '0';
attribute dont_touch of finish_img_signal : signal is "yes";

begin

selection_tx <= selection_tx1;

proceso2 : process(clock, ready_mod)
    begin  
        if rising_edge(clock) then
            case estado_actual_mod is 
                when Estado1 =>
                    if ready_mod = '1' then
                    
                        estado_actual_mod <= Estado2;
                        cont <= cont + "00000000000001";
                        cont_fin <= cont_fin + "01";
                        
                        if cont = "11111111111111" then
                            cont <= "00000000000000";
                            start_tx_signal <= '0';
                            finish_img_signal <= '0';
                            estado_actual_mod <= Estado3;
                        else
                            start_tx_signal <= '1';
                        end if;
                        
                        if cont_fin = "10" then
                            cont_fin <= "00";
                            finish_img_signal <= '1';
                        else
                            finish_img_signal <= '0';
                        end if;
                        
                    end if;
                when Estado2 => 
                    if ready_mod = '0' then 
                        estado_actual_mod <= Estado1;
                    else
                        estado_actual_mod <= Estado2;
                    end if;
                when Estado3 =>
                    if cont_trans = "00000000000000000000000001" then
                        --0010 1111 1010 1111 0000 1000 0000
                        --10111110101111000010000000
                        cont_trans <= "00000000000000000000000000";
                        estado_actual_mod <= Estado1;
                    else
                        cont_trans <= cont_trans + "00000000000000000000000001";
                        cont <= "00000000000000";
                        cont_fin <= "00";
                        start_tx_signal <= '0';
                        finish_img_signal <= '0';
                    end if;
                when others =>
                        finish_img_signal <= '0';
                        start_tx_signal <= '0';
                end case; 
        end if; 
    end process;
    
    cont_sal <= cont;
    start_tx <= start_tx_signal;
    finish_img <= finish_img_signal;
end Behavioral;