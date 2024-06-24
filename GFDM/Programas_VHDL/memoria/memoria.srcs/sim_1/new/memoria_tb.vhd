library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria_tb is
--  Port ( );
end memoria_tb;

architecture Behavioral of memoria_tb is

component top_level is
    PORT(
        clock       : in std_logic;
        --ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx_out     : out std_logic_vector(35 downto 0);
        finish_img  : out std_logic;
        cont_sal : out std_logic;
        bits_tx_out  : out std_logic
        );
end component;

signal clock       : std_logic := '0';
signal start_tx    : std_logic := '0';
signal selection_tx : std_logic_vector(1 downto 0)  := "00";
--signal bits_tx     : std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
signal bits_tx     : std_logic := '0';
signal finish_img  : std_logic := '0';
--signal ready_mod   : std_logic := '0';
signal cont_sal : std_logic := '0';
begin

reloj : process
begin
    clock <= '0'; 
    wait for 5 ns;
    clock <= '1';
    wait for 5 ns;
end process;

--ready_modulacion : process
--begin
--    ready_mod <= '0'; 
--    wait for 200 ns;
--    ready_mod <= '1';
--    wait for 800 ns;
--end process;

mem : top_level
    PORT MAP(
        clock => clock,
        --ready_mod => ready_mod,
        start_tx => start_tx,
        selection_tx => selection_tx,
        bits_tx_out => bits_tx,
        finish_img => finish_img,
        cont_sal => cont_sal
        );

end Behavioral;
