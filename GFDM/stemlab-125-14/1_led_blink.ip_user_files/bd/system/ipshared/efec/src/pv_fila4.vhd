library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity pv_fila4 is
    port(clock1            : in std_logic;
         start               : in std_logic; 
         selection_tx        : in std_logic_vector(1  downto 0);
         bits_TX             : in std_logic_vector(11 downto 0);
         ready_modulation    : out std_logic;
         RR_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         RI_tdata            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end pv_fila4;


architecture Behavioral of pv_fila4 is

-- Signal's Clock 2
signal clock_conta : std_logic_vector(0 downto 0) := "0";

-- Valores de Filtro en la Fila0
signal conta_filter : std_logic_vector(2 downto 0) := "111";
signal b_real : std_logic_vector(15 downto 0)      := "0011001010001000";
signal b_imag : std_logic_vector(15 downto 0)      := "1000000000000000";
type estado_type_filter is (Estado1, Estado2);
signal estado_actual_filter          : estado_type_filter := Estado1 ;

type filter_array is array (natural range 0 to 7) of std_logic_vector(15 downto 0);
    constant b_real_values : filter_array := (
        "0000000000000000",
        "0000000000000000",
        "0011001010001000",
        "0000000000000000",
        "0000000000000000",
        "0011001010001000",
        others => "0011001010001000"
    );
    constant b_imag_values : filter_array := (
        "0000000000000000",
        "0000000000000000",
        "0000000000000000",
        "1000000000000000",
        "1000000000000000",
        "1000000000000000",
        others => "1000000000000000"
    );

-- Signal's selector de la matriz
signal XR,YR,XI,YI : std_logic_vector(15 downto 0) := "0000000000000000";
type estado_type_select is (Estado1, Estado2);
signal estado_actual_select          : estado_type_select := Estado2 ;

-- Signal's mapeo de bits a simbolos  
signal band_sim : std_logic := '0';
signal bits_alm : std_logic_vector(11 downto 0) := "000000000000";
signal dr,di    : std_logic_vector(15 downto 0); 
type estado_type_mapeo is (Estado1, Estado2,Estado3);
signal estado_actual_mapeo,estado_ant_mapeo          : estado_type_mapeo := Estado1 ;
signal conta_estado_mapeo : std_logic_vector(2 downto 0) := "000"; 
signal reset    : std_logic := '0'; 
signal conta_mapeo : std_logic_vector(2 downto 0) := "111";
signal ready_mod : std_logic := '1';

-- Componente sobre el producto entre dos numeros
COMPONENT product
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
signal XR_tvalid,YR_tvalid             : STD_LOGIC := '1';
signal XRYR_tvalid                     : STD_LOGIC;
signal XRYR_tdata                      : STD_LOGIC_VECTOR(15 DOWNTO 0);

signal XI_tvalid,YI_tvalid             : STD_LOGIC := '1';
signal XIYI_tvalid                     : STD_LOGIC;
signal XIYI_tdata                      : STD_LOGIC_VECTOR(15 DOWNTO 0);

-- Componente acumulador
COMPONENT acumulador
  PORT (
    aclk                               : IN STD_LOGIC;
    aresetn                            : IN STD_LOGIC;
    s_axis_a_tvalid                    : IN STD_LOGIC;
    s_axis_a_tdata                     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_a_tlast                     : IN STD_LOGIC;
    m_axis_result_tvalid               : OUT STD_LOGIC;
    m_axis_result_tdata                : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_result_tlast                : OUT STD_LOGIC
  );  
END COMPONENT;
signal XRYR_tlast                     : STD_LOGIC := '0';
signal XIYI_tlast                     : STD_LOGIC := '0';
signal RR_tvalid, RR_tlast            : STD_LOGIC;
--signal RR_tdata                       : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal RI_tvalid, RI_tlast            : STD_LOGIC;
--signal RI_tdata                       : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin

-- Generacion de un clock, cuya frecuencia es la mitad de clock de entrada
reloj2 : process(clock1)
begin 
    if falling_edge(clock1) then 
        clock_conta <= clock_conta + 1;
    end if;
end process;

-- Filtro de la Fila K de la matriz A 
cont_val_filter : process(clock1,clock_conta) 
    begin 
        if falling_edge(clock1) and clock_conta = "1" then 
            case estado_actual_filter is 
                when Estado1 => 
                    conta_filter <= "111";
                    if start = '1' then 
                        estado_actual_filter <= Estado2; 
                    end if;  
                when Estado2 =>
                    conta_filter <= conta_filter + 1;
                    if conta_filter = "100" then
                        estado_actual_filter <= Estado1;
                    end if;
                when others => 
                    conta_filter <= "111";
                    estado_actual_filter <= Estado1;
            end case; 
        end if; 

end process;


with conta_filter select 
    b_real <= b_real_values(0) when "000",
              b_real_values(1) when "001",
              b_real_values(2) when "010",
              b_real_values(3) when "011",
              b_real_values(4) when "100",
              b_real_values(5) when "101",
              b_real_values(6) when others;

with conta_filter select 
    b_imag <=  b_imag_values(0) when "000",
               b_imag_values(1) when "001",
               b_imag_values(2) when "010",
               b_imag_values(3) when "011",
               b_imag_values(4) when "100",
               b_imag_values(5) when "101",
               b_imag_values(6) when others;


--alm_val_filter : process(conta_filter)
--    variable index : natural;
--    begin
--        index := to_integer(unsigned(conta_filter));
--        b_real <= b_real_values(index);
--        b_imag  <= b_imag_values(index);
--end process;


-- Selector de valores de Matriz A
selector : process(clock1)
begin
    if rising_edge(clock1) then 
        case estado_actual_select is 
            when Estado1 => 
                XR <= b_imag XOR "1000000000000000";
                YR <= di;
                
                XI <= b_real;
                YI <= di;
                
                estado_actual_select <= Estado2;
            when Estado2 =>
                XR <= b_real;
                YR <= dr;
                
                XI <= b_imag;
                YI <= dr;
                
                estado_actual_select <= Estado1;
            when others => 
                XR <= b_imag XOR "1000000000000000";
                YR <= di;
                
                XI <= b_real;
                YI <= di;
                
                estado_actual_select <= Estado1;
        end case;
    end if; 
end process;

-- Mapeo de bits a simbolos 
controlMapeo : process(clock1,clock_conta)
begin
    if falling_edge(clock1) and clock_conta = "1" then 
        case estado_actual_mapeo is 
            when Estado1 => 
                conta_mapeo<="000";
                estado_ant_mapeo <= Estado1;
                band_sim <= '0'; 
                if start = '1' then
                    reset <= '0';
                    ready_mod <= '0';
                    bits_alm <= bits_TX; 
                    estado_actual_mapeo <= Estado2; 
                else
                    reset <= '1';
                    ready_mod <= '1';
                    bits_alm <= "000000000000"; 
                     
                end if;  
            when Estado2 =>
                reset <= '1';
                if estado_ant_mapeo = Estado1 then 
                    band_sim <= '1';
                else
                    conta_mapeo <= conta_mapeo + 1;
                    if conta_mapeo < "101" then 
                        if selection_tx = "00" then 
                            bits_alm <= "00" & bits_alm(11 downto 2);
                        end if;
                    else 
                        conta_mapeo <= "000"; 
                        band_sim <= '0';
                        conta_estado_mapeo <= conta_estado_mapeo +1;
                        estado_actual_mapeo <= Estado3;
                    end if;
                end if; 
                estado_ant_mapeo <= Estado2;
            when Estado3 =>
                estado_ant_mapeo    <= Estado3;
                if conta_estado_mapeo = "100" then 
                    conta_estado_mapeo <= "000";
                    estado_actual_mapeo <= Estado1;
                else 
                    conta_estado_mapeo <= conta_estado_mapeo +1;
                    estado_actual_mapeo <= Estado3;
                end if; 
            when others => 
                conta_mapeo<="000";
                estado_ant_mapeo <= Estado1;
                estado_actual_mapeo <= Estado1;
                band_sim <= '0';
                reset <= '1';
                ready_mod <= '1';
                bits_alm <= "000000000000"; 
        end case;
    end if;
end process;

alm_mapeo : process(band_sim,bits_alm)
begin
    if band_sim = '1' and selection_tx = "00" then
        case bits_alm(1 downto 0) is 
            when "00" => 
                    dr  <= "1011110000000000";
                    di  <= "0011110000000000";
                when "01" => 
                    dr  <= "0011110000000000";
                    di  <= "0011110000000000";
                when "11" =>
                    dr  <= "0011110000000000";
                    di  <= "1011110000000000";
                when "10" =>
                    dr  <= "1011110000000000";
                    di  <= "1011110000000000";
                when others =>
                    dr  <= "0000000000000000";
                    di  <= "0000000000000000";
        end case;
     else
            dr  <= "0000000000000000";
            di  <= "0000000000000000";     
    end if;
end process;

-- Operaciones para obtener la parte real 
XR_tvalid <= '1';
YR_tvalid <= '1';
product_real : product
  PORT MAP (
    aclk                 => clock1,
    s_axis_a_tvalid      => XR_tvalid,
    s_axis_a_tdata       => XR,
    s_axis_b_tvalid      => YR_tvalid,
    s_axis_b_tdata       => YR,
    m_axis_result_tvalid => XRYR_tvalid,
    m_axis_result_tdata  => XRYR_tdata
  );
XRYR_tlast <= '0';
acumulador_real : acumulador
  PORT MAP (
    aclk                 => clock1,
    aresetn              => reset,
    s_axis_a_tvalid      => XRYR_tvalid,
    s_axis_a_tdata       => XRYR_tdata,
    s_axis_a_tlast       => XRYR_tlast,
    m_axis_result_tvalid => RR_tvalid,
    m_axis_result_tdata  => RR_tdata,
    m_axis_result_tlast  => RR_tlast
  );

-- Operaciones para obtener la parte real 
XI_tvalid <= '1';
YI_tvalid <= '1';
product_imag : product
  PORT MAP (
    aclk                 => clock1,
    s_axis_a_tvalid      => XI_tvalid,
    s_axis_a_tdata       => XI,
    s_axis_b_tvalid      => YI_tvalid,
    s_axis_b_tdata       => YI,
    m_axis_result_tvalid => XIYI_tvalid,
    m_axis_result_tdata  => XIYI_tdata
  );
XIYI_tlast <= '0';
acumulador_imag : acumulador
  PORT MAP (
    aclk                 => clock1,
    aresetn              => reset,
    s_axis_a_tvalid      => XIYI_tvalid,
    s_axis_a_tdata       => XIYI_tdata,
    s_axis_a_tlast       => XIYI_tlast,
    m_axis_result_tvalid => RI_tvalid,
    m_axis_result_tdata  => RI_tdata,
    m_axis_result_tlast  => RI_tlast
  );

ready_modulation <= (RI_tvalid or RI_tlast or RR_tvalid or RR_tlast or '1') AND ready_mod;
end Behavioral;