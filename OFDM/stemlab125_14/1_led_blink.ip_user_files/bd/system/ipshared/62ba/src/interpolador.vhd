library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity interpolador is
    generic (
        n : integer            := 21  --Numero de bits del interpolador menos 1 
        );
    PORT(clock1     : in std_logic;
         start_tx   : in std_logic;
         finish_img : in std_logic;
         ready_mod  : in std_logic; 
         start_mod  : out std_logic := '0';
         RR0_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI0_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR1_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI1_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR2_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI2_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR3_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI3_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR4_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI4_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR5_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI5_tdata            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         finish_tx_total      : out std_logic := '1';
         RR,RI                : out std_logic_vector(15 downto 0) := "0000000000000000");
end interpolador;

architecture Behavioral of interpolador is

-- Signal's Controlador Interpolador 
type estado_contInterpolador is (Estado1, Estado2, Estado3);
signal estado_actual_contInterpolador                   : estado_contInterpolador := Estado1;
signal conta_interpolador                               : std_logic_vector(n-1 downto 0) := (n-3 downto 0 => '0')&"01";
signal band_alm_img                                     : std_logic := '0';
signal band_finish_tx                                   : std_logic_vector(1 downto 0) := "00";
signal band_act_salida                                  : std_logic := '0';
signal finish_img_alm                                   : std_logic := '0';
signal band_start_mod                                   : std_logic := '0';
signal band_control_tx                                  : std_logic := '0';
signal estado_retenedor_pulso                           : std_logic_vector(2 downto 0) := "000";
signal RR0,RR1,RR2,RR3,RR4,RR5,RI0,RI1,RI2,RI3,RI4,RI5  : std_logic_vector(15 downto 0) := "0000000000000000";
signal estado_alm                                       : std_logic_vector(3 downto 0) := "1000";

begin    
    -- Control interpolador 
    
    control_interpolador : process(clock1,start_TX)
    begin
        if rising_edge(clock1) then 
            case estado_actual_contInterpolador is 
                when Estado1 => 
                    if start_tx = '1' then 
                        band_alm_img <= '1';
                        band_start_mod <= '1'; 
                        band_act_salida <= '1';
                        estado_alm <= "1001";
                        estado_actual_contInterpolador <= Estado2;
                    else
                        band_alm_img <= '0';
                        band_start_mod <= '0'; 
                        band_act_salida <= '0';
                        estado_alm <= "1000";
                        estado_actual_contInterpolador <= Estado1;
                    end if;
                when Estado2 =>                 
                    conta_interpolador <= conta_interpolador + 1;
                    if conta_interpolador = 0 then 
                        estado_alm <= estado_alm + 1;
                        band_act_salida <= '1'; 
                        if estado_alm = "1111" then 
                            estado_actual_contInterpolador <= Estado3;
                            band_control_tx <= '1';
                            if finish_img_alm = '1' then 
                                band_start_mod  <= '0';
                                band_finish_tx  <= "10";
                            else 
                                band_start_mod  <= '1';
                                band_finish_tx  <= "00";
                            end if; 
                        end if;
                    else 
                        band_start_mod  <= '0';
                        band_act_salida <= '0';
                        band_control_tx <= '0';
                    end if;
                 when Estado3 =>
                    conta_interpolador <= conta_interpolador + 1;
                    if conta_interpolador = 0 then 
                        estado_alm <= estado_alm + 1; 
                        band_act_salida <= '1';
                        if estado_alm = "0111" then
                            if finish_img_alm = '1' then 
                                if band_finish_tx = "00" then 
                                    estado_alm      <= "0000";
                                    band_finish_tx  <= "01";
                                    band_control_tx <= '1';
                                    band_start_mod  <= '1';
                                    estado_actual_contInterpolador <= Estado3;
                                elsif band_finish_tx = "01" then
                                    estado_alm      <= "0000";
                                    band_finish_tx  <= "10";
                                    band_control_tx <= '1';
                                    band_start_mod  <= '0';
                                    estado_actual_contInterpolador <= Estado3;
                                else                                 
                                    estado_alm      <= "1000";
                                    band_finish_tx  <= "00";
                                    band_control_tx <= '0';
                                    band_start_mod  <= '0';
                                    estado_actual_contInterpolador <= Estado1;
                                end if;
                            else
                                estado_alm <= "0000";
                                band_control_tx <= '1';
                                band_start_mod  <= '1';
                                estado_actual_contInterpolador <= Estado3;
                            end if;
                        end if;   
                    else 
                        band_start_mod  <= '0';
                        band_act_salida <= '0';
                        band_control_tx <= '0';
                    end if;
                 when others =>
                        band_alm_img <= '0';
                        band_start_mod <= '0'; 
                        estado_alm <= "1000";
                        estado_actual_contInterpolador <= Estado1;
            end case;
        end if; 
    end process;
    
    retenedor_pulso : process(band_start_mod,clock1)  
    begin 
        if rising_edge(clock1) then
            case estado_retenedor_pulso is
                when "000" =>
                if band_start_mod = '1' then 
                    start_mod <= '1';
                    estado_retenedor_pulso <= estado_retenedor_pulso + 1;  
                else 
                    start_mod <= '0';
                end if;
                when others =>
                    estado_retenedor_pulso <= estado_retenedor_pulso + 1;
            end case; 
        end if; 
    end process;
    
    
    alm_finish_img : process (clock1,band_alm_img,finish_img) 
    begin    
        if rising_edge(clock1) then 
            if band_alm_img = '1' then 
                if finish_img = '1' then 
                    finish_img_alm <= '1';    
                end if;
            else 
                finish_img_alm <= '0';
            end if;
        end if;
    end process;
    
    -- Almacenamiento temporal de datos
    almacenamiento : process(band_control_tx,clock1)
    begin
        if rising_edge(clock1) and band_control_tx = '1' then
           RR0<=RR0_tdata; 
           RR1<=RR1_tdata;
           RR2<=RR2_tdata;
           RR3<=RR3_tdata;
           RR4<=RR4_tdata;
           RR5<=RR5_tdata;
           
           RI0<=RI0_tdata;
           RI1<=RI1_tdata;
           RI2<=RI2_tdata;
           RI3<=RI3_tdata;
           RI4<=RI4_tdata;
           RI5<=RI5_tdata;
        end if;
    end process;
    
    salida : process(clock1,band_act_salida)
    begin 
        if rising_edge(clock1) and band_act_salida = '1' then 
            case estado_alm is 
                when "0000" => 
                    finish_tx_total <= '0';
                    RR <= RR4_tdata;
                    RI <= RI4_tdata;
                when "0001" =>
                    finish_tx_total <= '0';
                    RR <= RR5;
                    RI <= RI5;
                when "0010" =>
                    finish_tx_total <= '0';
                    RR <= RR0;
                    RI <= RI0;
                when "0011" =>
                    finish_tx_total <= '0';
                    RR <= RR1;
                    RI <= RI1;
                when "0100" =>
                    finish_tx_total <= '0';
                    RR <= RR2;
                    RI <= RI2;
                when "0101" =>
                    finish_tx_total <= '0';
                    RR <= RR3;
                    RI <= RI3;
                when "0110" =>
                    finish_tx_total <= '0';
                    RR <= RR4;
                    RI <= RI4;
                when "0111" =>
                    finish_tx_total <= '0';
                    RR <= RR5;
                    RI <= RI5;
                when "1000" =>
                    finish_tx_total <= '1';
                    RR <= "0000000000000000";
                    RI <= "0000000000000000";
                when others => 
                    finish_tx_total <= '0';
                    RR <= "0011101100110011";
                    RI <= "0011101100110011";                
            end case;
        end if;
    end process;

end Behavioral;
