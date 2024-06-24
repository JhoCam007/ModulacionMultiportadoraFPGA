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

signal cont_sal_signal : std_logic_vector(13 downto 0) := (others => '0');
attribute dont_touch of cont_sal_signal : signal is "yes";

component control_memoria is
    PORT(
        clock       : in std_logic;
        ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx     : out std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
        finish_img  : out std_logic;
        cont_sal : out std_logic_vector(13 downto 0)
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
        when "00000000000000" => bits_tx <= "000000000000";
        when "00000000000001" => bits_tx <= "101100110011";
        when "00000000000010" => bits_tx <= "111100100001";
	    when  others =>bits_tx <= "111101110010";        
    end case;
end if;
end process;


end Behavioral;
