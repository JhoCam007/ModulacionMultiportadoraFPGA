library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ofdm is
    port(clock1               : in std_logic;
         start                : in std_logic; 
         selection_tx         : in std_logic_vector(1  downto 0);
         bits_TX              : in std_logic_vector(35 downto 0);
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
end ofdm;

architecture Behavioral of ofdm is

component pv_fila0 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation0     : std_logic;

component pv_fila1 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation1     : std_logic;

component pv_fila2 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation2     : std_logic;

component pv_fila3 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation3     : std_logic;

component pv_fila4 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation4     : std_logic;

component pv_fila5 
    port(clock1              : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(35 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal ready_modulation5     : std_logic;

begin
fila0 : pv_fila0
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation0,        
    RR_tdata                 => RR0_tdata,
    RI_tdata                 => RI0_tdata);
    
fila1 : pv_fila1
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation1,        
    RR_tdata                 => RR1_tdata,
    RI_tdata                 => RI1_tdata);

fila2 : pv_fila2
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation2,        
    RR_tdata                 => RR2_tdata,
    RI_tdata                 => RI2_tdata);

fila3 : pv_fila3
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation3,        
    RR_tdata                 => RR3_tdata,
    RI_tdata                 => RI3_tdata);

fila4 : pv_fila4
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation4,        
    RR_tdata                 => RR4_tdata,
    RI_tdata                 => RI4_tdata);

fila5 : pv_fila5
  PORT MAP (
    clock1                   => clock1,
    start                    => start, 
    selection_tx             => selection_tx,
    bits_TX                  => bits_TX,
    ready_modulation         => ready_modulation5,        
    RR_tdata                 => RR5_tdata,
    RI_tdata                 => RI5_tdata);

ready_modulation <= ready_modulation0 and ready_modulation1 and ready_modulation2 and ready_modulation3 and ready_modulation4 and ready_modulation5;

end Behavioral;
