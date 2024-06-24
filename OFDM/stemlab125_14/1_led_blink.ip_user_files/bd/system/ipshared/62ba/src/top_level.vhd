library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
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
end top_level;

architecture Behavioral of top_level is

attribute dont_touch : string;
--signal clock : std_logic;

--component clk_wiz_0
--port
-- (-- Clock in ports
--  -- Clock out ports
--  clk_out1          : out    std_logic;
--  clk_in1           : in     std_logic
-- );
--end component;

component config_ofdm
    PORT(
        clock       : in std_logic;
        start_tx     : out std_logic; --
        selection_tx : out std_logic_vector(1 downto 0);
        bits_tx      : out std_logic_vector(35 downto 0); --(Menos significativo)
        finish_img   : out std_logic; --
        ready_mod    : in std_logic
        );
end component;
attribute dont_touch of config_ofdm : component is "yes";
signal start_tx,finish_img,ready_mod : std_logic;
signal selection_tx                  : std_logic_vector(1 downto 0);
signal bits_tx                       : std_logic_vector(35 downto 0);

component ofdm_sdr 
    PORT(
        clock1               : in std_logic;
        start_tx             : in std_logic; 
        selection_tx         : in std_logic_vector(1  downto 0);
        bits_TX              : in std_logic_vector(35 downto 0);
        finish_img           : in std_logic;
        result_ofdm_sdr      : out std_logic_vector(31 downto 0); --menos
        ready_result         : out std_logic; --
        ready_mod            : out std_logic --Salida
    );
end component;
attribute dont_touch of ofdm_sdr : component is "yes";
signal result_ofdm_sdr      : std_logic_vector(31 downto 0);
signal ready_result         : std_logic;

component cuantizador 
    PORT (
        clock : IN STD_LOGIC;
        ieee_valid : IN STD_LOGIC;
        data_ieee : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        binario : OUT std_logic_vector(13 downto 0) --menos
    );
end component;
attribute dont_touch of cuantizador : component is "yes";

--signal binario_out_v : std_logic_vector(13 downto 0);



begin

--    reloj : clk_wiz_0
--       port map ( 
--      -- Clock out ports  
--       clk_out1 => clock,
--       -- Clock in ports
--       clk_in1 => clock_10MHz
--     );
    
    memoria : config_ofdm
        PORT MAP(
            clock        => clock,
            start_tx     => start_tx,
            selection_tx => selection_tx,
            bits_tx      => bits_tx,
            finish_img   => finish_img,
            ready_mod    => ready_mod
            );
    modulacion : ofdm_sdr
        PORT MAP (
            clock1           => clock,
            start_tx         => start_tx, 
            selection_tx     => selection_tx,
            bits_TX          => bits_tx,
            finish_img       => finish_img,
            result_ofdm_sdr  => result_ofdm_sdr,
            ready_result     => ready_result,
            ready_mod        => ready_mod);
    cuantizador_1 : cuantizador 
        PORT MAP(
            clock            => clock,
            ieee_valid       => ready_result,
            data_ieee        => result_ofdm_sdr,
            binario          => binario
        );
--binario <= binario_out_v; 
-- Asignacion de salidas a seniales
--start_tx_out <= start_tx;
--bits_tx_out <= bits_tx(2);
--finish_img_out <= finish_img;
--result_ofdm_sdr_out <= result_ofdm_sdr(29);
--ready_result_out <= ready_result;
--ready_mod_out <= ready_mod;
--binario_out <= binario_out_v(4);

end Behavioral;
