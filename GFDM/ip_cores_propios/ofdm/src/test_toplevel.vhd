
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_toplevel is

end test_toplevel;

architecture Behavioral of test_toplevel is

component top_level
     PORT(clock : in std_logic;
         binario : out std_logic_vector(13 downto 0)
--         start_tx_out : out std_logic;
--         bits_tx_out  : out std_logic;
--         finish_img_out : out std_logic;
         
--         result_ofdm_sdr_out : out std_logic;
--         ready_result_out : out std_logic;
--         ready_mod_out : out std_logic;
--         binario_out : out std_logic
         );
end component;
signal clock : std_logic;
signal binario : std_logic_vector(13 downto 0); 
--signal start_tx_out : std_logic;
--signal bits_tx_out : std_logic;
--signal finish_img_out : std_logic;
--signal result_ofdm_sdr_out : std_logic;
--signal ready_result_out : std_logic;
--signal ready_mod_out : std_logic;
--signal binario_out : std_logic;
begin

reloj : process
begin
    clock <= '0'; 
    wait for 4 ns;
    clock <= '1';
    wait for 4 ns;
end process;

programa : top_level
    PORT MAP(
        clock => clock,
        binario => binario
--        start_tx_out => start_tx_out,
--        bits_tx_out => bits_tx_out, 
--        finish_img_out => finish_img_out,
--        result_ofdm_sdr_out => result_ofdm_sdr_out,
--        ready_result_out => ready_result_out,
--        ready_mod_out => ready_mod_out,
--        binario_out => binario_out
         );

end Behavioral;
