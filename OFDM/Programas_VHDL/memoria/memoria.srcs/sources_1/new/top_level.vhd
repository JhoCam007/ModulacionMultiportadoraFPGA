library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    PORT(
        clock       : in std_logic;
        --ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx_out  : out std_logic_vector(35 downto 0);
        finish_img  : out std_logic;
        cont_sal : out std_logic;
        bits_tx_out  : out std_logic
        );
end top_level;

architecture Behavioral of top_level is
attribute dont_touch : string;
component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

attribute dont_touch of clk_wiz_0 : component is "yes";

signal ready_mod : std_logic := '0';
attribute dont_touch of ready_mod : signal is "yes";

signal cont_sal_signal : std_logic_vector(9 downto 0) := (others => '0');
attribute dont_touch of cont_sal_signal : signal is "yes";

signal bits_tx : std_logic_vector(35 downto 0) := (others => '0');
attribute dont_touch of bits_tx : signal is "yes";

component control_memoria is
    PORT(
        clock       : in std_logic;
        ready_mod   : in std_logic;
        start_tx    : out std_logic;
        selection_tx : out std_logic_vector(1 downto 0);
        --bits_tx     : out std_logic_vector(35 downto 0) := "101001111011111010100001101010110100";
        finish_img  : out std_logic;
        cont_sal : out std_logic_vector(9 downto 0)
        );
end component;

attribute dont_touch of control_memoria : component is "yes";

component memoria is
    Port (
        sel : in std_logic_vector(9 downto 0);
        dato : out std_logic_vector(35 downto 0)
        );
end component;

attribute dont_touch of memoria : component is "yes";

begin

reloj : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => ready_mod,
   -- Clock in ports
   clk_in1 => clock
 );

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

datos : memoria
    Port Map(
        sel => cont_sal_signal,
        dato => bits_tx
        );


cont_sal <= cont_sal_signal(0);
bits_tx_out <= bits_tx(5);

end Behavioral;
