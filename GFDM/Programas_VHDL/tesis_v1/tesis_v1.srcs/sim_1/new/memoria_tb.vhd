library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria_tb is
--  Port ( );
end memoria_tb;

architecture Behavioral of memoria_tb is

component config_ofdm is
    PORT(
        clock       : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        bits_tx  : out std_logic_vector(35 downto 0);
        finish_img  : out std_logic;
        ready_mod   : in std_logic
        );
end component;

signal clock        : std_logic;
signal start_tx     : std_logic;
signal selection_tx : std_logic_vector(1 downto 0);
signal bits_tx  : std_logic_vector(35 downto 0);
signal finish_img   : std_logic;
signal ready_mod    : std_logic;

begin

reloj : process
begin
    clock <= '0'; 
    wait for 1 ns;
    clock <= '1';
    wait for 1 ns;
end process;

ready_mod_comp : process
begin
    ready_mod <= '0'; 
    wait for 10 ns;
    ready_mod <= '1';
    wait for 100 ns;
end process;

test_memoria : config_ofdm
     PORT MAP (
        clock => clock,
        start_tx => start_tx,
        selection_tx => selection_tx,
        bits_tx => bits_tx,
        finish_img => finish_img,
        ready_mod => ready_mod);

end Behavioral;
