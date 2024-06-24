library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity config_ofdm is
    PORT(clock : in std_logic;
        start_tx : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        bits_tx     : out std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
        finish_img  : out std_logic := '1';
        ready_mod   : in std_logic);
    
end config_ofdm;

architecture Behavioral of config_ofdm is

constant start_tx1 : std_logic := '1';
constant selection_tx1 : std_logic_vector := "00";
type estado_type_preparated             is (Estado1, Estado2,Estado3);
signal estado_actual          : estado_type_preparated := Estado1;
type estado_modulation             is (Estado1, Estado2);
signal estado_actual_mod          : estado_modulation := Estado1;

begin
start_tx <= start_tx1;
selection_tx <= selection_tx1;

proceso2 : process(clock,ready_mod )    
begin  
    if rising_edge(clock) then
        case estado_actual_mod is 
            when Estado1 =>
                if ready_mod = '1' then
                    estado_actual_mod <= Estado2;
                    case estado_actual is 
                        when Estado1 =>
                            bits_TX <= "101001111011111010100001101010110100";
                            finish_img   <= '0';
                            estado_actual <= Estado2;
                        when Estado2 => 
                            estado_actual <= Estado3;
                            finish_img   <= '0';
                            bits_TX <= "101001111011111010100001101010110100";
                        when Estado3 => 
                            estado_actual <= Estado1;
                            finish_img   <= '1';
                            bits_TX <= "101001111011111010100001101010110100";
                    end case; 
                end if;
            when Estado2 => 
                if ready_mod = '0' then 
                    estado_actual_mod <= Estado1;
                else
                    estado_actual_mod <= Estado2;
                end if;
            when others => 
                    bits_TX <= "101001111011111010100001101010110100";
                    finish_img   <= '0';
                    estado_actual <= Estado1;
            end case; 
    end if; 
end process;
end Behavioral;