library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity synch_tx is
    PORT (clock1          : in std_logic;
          n_cos           : in std_logic_vector(1 downto 0);
          start_tx_i      : in std_logic;
          finish_tx_total : in std_logic;
--          conta_portadora : in std_logic_vector(11 downto 0); -- Modificar aqui cuando se quiera cambiar la freq portadora x1
          start_tx_r      : out std_logic := '0');
end synch_tx;

architecture Behavioral of synch_tx is
type estado_type_synch is (Estado1, Estado2);
signal estado_actual_synch          : estado_type_synch := Estado1 ;

begin

proceso: process(clock1)
begin 
    if rising_edge(clock1) then 
        case estado_actual_synch is 
            when Estado1 => 
--                if start_tx_i = '1' and finish_tx_total = '1' and n_cos = "11" and conta_portadora = "111111111110" then -- Modificar en funcion de portadora
                if start_tx_i = '1' and finish_tx_total = '1' and n_cos = "01"  then 
                    start_tx_r <= '1';    
                    estado_actual_synch <= Estado2;
                end if;
            when Estado2 => 
                start_tx_r <= '0';
                estado_actual_synch <= Estado1;
            when others => 
                start_tx_r <= '0';
                estado_actual_synch <= Estado1;
        end case; 
    end if; 
end process;

end Behavioral;
