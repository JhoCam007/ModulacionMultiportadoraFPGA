library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity ofdm_sdr is
    PORT(
        clock1               : in std_logic;
        start_tx             : in std_logic; 
        selection_tx         : in std_logic_vector(1  downto 0);
        bits_TX              : in std_logic_vector(11 downto 0);
        finish_img           : in std_logic;
        result_ofdm_sdr      : out std_logic_vector(31 downto 0);
        ready_result         : out std_logic;
        ready_mod            : out std_logic
    );
     
end ofdm_sdr;

architecture Behavioral of ofdm_sdr is
attribute dont_touch : string;
component ofdm 
    port(clock1               : in std_logic;
         start                : in std_logic; 
         selection_tx         : in std_logic_vector(1  downto 0);
         bits_TX              : in std_logic_vector(11 downto 0);
         ready_modulation     : out std_logic;
         RR0_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI0_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR1_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI1_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR2_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI2_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR3_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI3_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR4_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI4_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RR5_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI5_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
attribute dont_touch of ofdm : component is "yes";

signal start_mod,ready_modulation : std_logic;
attribute dont_touch of ready_modulation : signal is "yes";
signal RR0,RR1,RR2,RR3,RR4,RR5,RI0,RI1,RI2,RI3,RI4,RI5 : std_logic_vector(15 downto 0) := "0000000000000000";

component interpolador 
    PORT(clock1     : in std_logic;
         finish_tx_total      : out std_logic;
         start_tx   : in std_logic;
         finish_img : in std_logic;
         ready_mod  : in std_logic; 
         start_mod  : out std_logic;
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
         RR,RI                : out std_logic_vector(15 downto 0));
end component;
signal finish_tx_total      : std_logic := '0';
attribute dont_touch of interpolador : component is "yes";

component carrier 
    PORT(
        n       : IN  std_logic_vector(1 DOWNTO 0);
        r       : OUT std_logic_vector(15 DOWNTO 0)
    );
end component;
signal n_cos : std_logic_vector(1 downto 0) := "00";
signal n_sin : std_logic_vector(1 downto 0) := "01";
signal x_cos : std_logic_vector(15 downto 0) := "0011110000000000";
signal x_sin : std_logic_vector(15 downto 0) := "0000000000000000";
--signal conta_portadora : std_logic_vector(11 downto 0) := (9 downto 0 => '0')&"01"; -- Cambiar modo a banda base

COMPONENT product_sdr
  PORT (
    aclk                 : IN STD_LOGIC;
    s_axis_a_tvalid      : IN STD_LOGIC;
    s_axis_a_tdata       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_b_tvalid      : IN STD_LOGIC;
    s_axis_b_tdata       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
signal RR,RI,RPCoseno,RPSeno  : std_logic_vector(15 downto 0) :="0000000000000000";
signal rr_tvalid,ri_tvalid,coseno_tvalid,seno_tvalid : std_logic := '1'; 
signal cos_tvalid,sin_tvalid : std_logic := '0';
COMPONENT suma
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

-- Signal's Transformacion de formato 
signal input16 : std_logic_vector(15 downto 0) := "0000000000000000";
attribute dont_touch of input16: signal is "true";
--signal output_32 : std_logic_vector(31 downto 0) :="00000000000000000000000000000000";

component bits16_bits32 
    PORT(
        input16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clock1 : IN STD_LOGIC;
        output32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end component;
attribute dont_touch of bits16_bits32 : component is "yes";
-- Componente de Syncronizacion
component synch_tx 
    PORT (clock1          : in std_logic;
          n_cos           : in std_logic_vector(1 downto 0);
          start_tx_i      : in std_logic;
          finish_tx_total : in std_logic;
--          conta_portadora : in std_logic_vector(11 downto 0); -- Modificar aqui cuando se quiera cambiar la freq portadora
          start_tx_r      : out std_logic := '0');
end component;
signal start_tx_r : std_logic := '0';
 
attribute dont_touch of synch_tx : component is "yes";
begin

    ofdm_modulador : ofdm 
        PORT MAP
        (clock1     => clock1,
        start       => start_mod,
        selection_tx=> selection_tx,
        bits_TX      => bits_TX, 
        ready_modulation => ready_modulation,
        RR0_tdata => RR0,
        RI0_tdata => RI0,
        RR1_tdata => RR1,
        RI1_tdata => RI1,
        RR2_tdata => RR2,
        RI2_tdata => RI2,
        RR3_tdata => RR3,
        RI3_tdata => RI3,
        RR4_tdata => RR4,
        RI4_tdata => RI4,
        RR5_tdata => RR5,
        RI5_tdata => RI5);
        
ready_mod <= ready_modulation;

interpolador_p : interpolador 
    PORT MAP 
    (clock1     => clock1,
     start_tx   => start_tx_r,
     finish_img => finish_img,
     finish_tx_total => finish_tx_total,
     ready_mod  => ready_modulation, 
     start_mod  => start_mod,
     RR0_tdata => RR0,
     RI0_tdata => RI0,
     RR1_tdata => RR1,
     RI1_tdata => RI1,
     RR2_tdata => RR2,
     RI2_tdata => RI2,
     RR3_tdata => RR3,
     RI3_tdata => RI3,
     RR4_tdata => RR4,
     RI4_tdata => RI4,
     RR5_tdata => RR5,
     RI5_tdata => RI5,
     RR => RR,
     RI => RI
    );   
    
    -- Aplicacion de SDR 
    portadoras : process(clock1)
    begin 
        if rising_edge(clock1) then 
--            conta_portadora <= conta_portadora + 1;
--            if conta_portadora = 0 then 
                n_cos <= n_cos + 1;
                n_sin <= n_sin + 1;
--            end if;
        end if;
    end process;   
    
    synch_portadora : synch_tx 
        PORT MAP(
            clock1              => clock1,
            n_cos               => n_cos,
            finish_tx_total     => finish_tx_total,
--            conta_portadora     => conta_portadora,
            start_tx_i          => start_tx,
            start_tx_r          => start_tx_r ); 
             
    coseno : carrier
        PORT MAP (
            n => n_cos,
            r => x_cos 
        );
    
    seno : carrier
        PORT MAP (
            n => n_sin,
            r => x_sin 
        );   
     
      rr_tvalid <= '1';
      coseno_tvalid <= '1';
    product_coseno : product_sdr
      PORT MAP (
        aclk                    => clock1,
        s_axis_a_tvalid         => rr_tvalid,
        s_axis_a_tdata          => RR,
        s_axis_b_tvalid         => coseno_tvalid,
        s_axis_b_tdata          => x_cos,
        m_axis_result_tvalid    => cos_tvalid,
        m_axis_result_tdata     => RPCoseno
      );
      ri_tvalid <= '1';
      seno_tvalid <= '1';
      product_seno : product_sdr
      PORT MAP (
        aclk                    => clock1,
        s_axis_a_tvalid         => ri_tvalid,
        s_axis_a_tdata          => RI,
        s_axis_b_tvalid         => seno_tvalid,
        s_axis_b_tdata          => x_sin,
        m_axis_result_tvalid    => sin_tvalid,
        m_axis_result_tdata     => RPSeno
      );    
      
      resultado_sdr : suma
      PORT MAP (
        aclk                    => clock1,
        s_axis_a_tvalid         => cos_tvalid,
        s_axis_a_tdata          => RPCoseno,
        s_axis_b_tvalid         => sin_tvalid,
        s_axis_b_tdata          => RPSeno,
        m_axis_result_tvalid    => ready_result,
        m_axis_result_tdata     => input16
      );        
      
      -- Transformacion de formatos de 16 bits a 32 bits
      transformation : bits16_bits32 
        PORT MAP (
        input16  => input16,
        clock1 => clock1,
        output32 => result_ofdm_sdr
        );
      
end Behavioral;
