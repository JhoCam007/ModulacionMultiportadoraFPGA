library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simulation_interpolador is
--  Port ( );
end simulation_interpolador; 

architecture Behavioral of simulation_interpolador is

component ofdm_sdr 
    PORT(
        clock1               : in std_logic;
        start_tx             : in std_logic; 
        selection_tx         : in std_logic_vector(1  downto 0);
        bits_TX              : in std_logic_vector(35 downto 0);
        finish_img           : in std_logic;
        result_ofdm_sdr      : out std_logic_vector(31 downto 0) ;
        ready_mod            : out std_logic;
        ready_result         : out std_logic
    );
end component;

signal ready_result : std_logic;
signal result_ofdm_sdr  : std_logic_vector(31 downto 0);
signal clock1    : std_logic;
signal start_tx  : std_logic; 
signal finish_img : std_logic := '1';
signal ready_mod  : std_logic; 
signal selection_tx : std_logic_vector(1 downto 0) := "00";
signal bits_TX : std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
type estado_type_preparated             is (Estado1, Estado2,Estado3);
signal estado_actual          : estado_type_preparated := Estado1;
type estado_modulation             is (Estado1, Estado2);
signal estado_actual_mod          : estado_modulation := Estado1;

begin
 
reloj : process
begin
    clock1 <= '0'; 
    wait for 5 ns;
    clock1 <= '1';
    wait for 5 ns;
end process;



start_tx <= '1';

proceso2 : process(clock1,ready_mod )    
begin  
    if rising_edge(clock1) then
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
                    bits_TX <= "101001111011111010100001101000110001";
                    finish_img   <= '0';
                    estado_actual <= Estado1;
            end case; 
    end if; 
end process;
 

test_interpolador : ofdm_sdr
     PORT MAP (
        clock1               => clock1,
        start_tx             => start_tx, 
        selection_tx         => selection_tx,
        bits_TX              => bits_TX,
        finish_img           => finish_img,
        ready_result         => ready_result,
        ready_mod            => ready_mod,
        result_ofdm_sdr      => result_ofdm_sdr);
end Behavioral;

