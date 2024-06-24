library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity config_ofdm is
    PORT(
        clock       : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        bits_tx  : out std_logic_vector(11 downto 0);
        finish_img  : out std_logic;
        ready_mod   : in std_logic
        );
end config_ofdm;

architecture Behavioral of config_ofdm is

attribute dont_touch : string;

signal cont_sal_signal : std_logic_vector(5 downto 0) := (others => '0');
attribute dont_touch of cont_sal_signal : signal is "yes";

component control_memoria is
    PORT(
        clock       : in std_logic;
        ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx     : out std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
        finish_img  : out std_logic;
        cont_sal : out std_logic_vector(5 downto 0)
        );
end component;

attribute dont_touch of control_memoria : component is "yes";

--component memoria is
--    Port (
--        sel : in std_logic_vector(9 downto 0);
--        dato : out std_logic_vector(35 downto 0)
--        );
--end component;

--attribute dont_touch of memoria : component is "yes";

begin

mem : control_memoria
    PORT MAP(
        clock => clock,
        ready_mod => ready_mod,
        start_tx => start_tx,
        selection_tx => selection_tx,
        --bits_tx => bits_tx,
        finish_img => finish_img,
        cont_sal => cont_sal_signal
        );

--datos : memoria
--    Port Map(
--        sel => cont_sal_signal,
--        dato => bits_tx
--        );

datos : process(cont_sal_signal,clock)
begin
if rising_edge(clock) then 
    case cont_sal_signal is 
        when "000000" => bits_tx <= "000000000000";
			when "000001" => bits_tx <= "010000111011";
			when "000010" => bits_tx <= "000011011000";
			when "000011" => bits_tx <= "101101011000";
			when "000100" => bits_tx <= "011011111100";
			when "000101" => bits_tx <= "010110111000";
			when "000110" => bits_tx <= "010001101101";
			when "000111" => bits_tx <= "011101101110";
			when "001000" => bits_tx <= "100101110110";
			when "001001" => bits_tx <= "101001111000";
			when "001010" => bits_tx <= "000010111011";
			when "001011" => bits_tx <= "110010000001";
			when "001100" => bits_tx <= "000010001110";
			when "001101" => bits_tx <= "011111110000";
			when "001110" => bits_tx <= "100111100110";
			when "001111" => bits_tx <= "111111101100";
			when "010000" => bits_tx <= "000000001010";
			when "010001" => bits_tx <= "001001110011";
			when "010010" => bits_tx <= "110010111100";
			when "010011" => bits_tx <= "001010111110";
			when "010100" => bits_tx <= "000000001010";
			when "010101" => bits_tx <= "000111111001";
			when "010110" => bits_tx <= "111010100010";
			when "010111" => bits_tx <= "111011010010";
			when "011000" => bits_tx <= "010110000010";
			when "011001" => bits_tx <= "110001101011";
			when "011010" => bits_tx <= "001001011010";
			when "011011" => bits_tx <= "110011010100";
			when "011100" => bits_tx <= "110010100110";
			when "011101" => bits_tx <= "011111011000";
			when "011110" => bits_tx <= "110111011100";
			when "011111" => bits_tx <= "100010010001";
			when "100000" => bits_tx <= "110011001010";
			when "100001" => bits_tx <= "010111110001";
			when "100010" => bits_tx <= "100100001000";
			when "100011" => bits_tx <= "100001100001";
			when "100100" => bits_tx <= "000111101111";
			when "100101" => bits_tx <= "111111100101";
			when "100110" => bits_tx <= "101001110010";
			when "100111" => bits_tx <= "110100000100";
			when "101000" => bits_tx <= "010000000111";
			when "101001" => bits_tx <= "100110110101";
			when "101010" => bits_tx <= "111111100100";
			when "101011" => bits_tx <= "101101111000";
			when "101100" => bits_tx <= "101011110011";
			when "101101" => bits_tx <= "110111101011";
			when "101110" => bits_tx <= "100100100101";
			when "101111" => bits_tx <= "000000010111";
			when "110000" => bits_tx <= "001000111110";
			when "110001" => bits_tx <= "011101011011";
			when "110010" => bits_tx <= "101001101001";
			when "110011" => bits_tx <= "001101010001";
			when "110100" => bits_tx <= "101111010000";
			when "110101" => bits_tx <= "101011101000";
			when "110110" => bits_tx <= "110001111011";
			when "110111" => bits_tx <= "001111100011";
			when "111000" => bits_tx <= "000110110110";
			when "111001" => bits_tx <= "010001011111";
			when "111010" => bits_tx <= "001110111000";
			when "111011" => bits_tx <= "111101111100";
			when "111100" => bits_tx <= "100001001100";
			when "111101" => bits_tx <= "111111111111";
			when "111110" => bits_tx <= "111111111111";
			when "111111" => bits_tx <= "111111111111";
			when  others =>bits_tx <= "000000000000";        
    end case;
end if;
end process;


end Behavioral;
