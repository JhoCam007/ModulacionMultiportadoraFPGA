library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cuantizador is
    PORT (
        clock : IN STD_LOGIC;
        --t_valid_bin_out : OUT STD_LOGIC;
        --deci_out : OUT STD_LOGIC;
        --binario_sin_out : OUT std_logic_vector(11 downto 0)
        --binario_out : OUT std_logic_vector(5 downto 0)
        --bin_sin_redond_out : OUT std_logic_vector(31 downto 0);
        --binario_out : OUT std_logic_vector(31 downto 0)
        
        ieee_valid : IN STD_LOGIC;
        data_ieee : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        binario : OUT std_logic_vector(13 downto 0)
    );
end cuantizador;

architecture Behavioral of cuantizador is

--constant ieee_valid : STD_LOGIC := '1';
--constant data_ieee : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00111110100110011001100110011010";

constant val_min_tvalid : STD_LOGIC := '1';
constant val_min : STD_LOGIC_VECTOR(31 DOWNTO 0) := "10111111100000000000000000000000"; -- [-1]

COMPONENT my_rest
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

signal res_result_tvalid : std_logic;
signal res_result : std_logic_vector(31 downto 0);

constant factor_tvalid : STD_LOGIC := '1';
constant factor : STD_LOGIC_VECTOR(31 DOWNTO 0) := "01000101111111111111110000000000"; -- [8191.5]

COMPONENT my_multiplicador
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

signal tvalid_multiplicador : std_logic;
signal result_multiplicador : std_logic_vector(31 downto 0);

signal t_valid_bin : STD_LOGIC;
signal bin_sin_redond : std_logic_vector(13 downto 0);

attribute dont_touch : string;

component conv_bin 
    PORT (
    clock : IN STD_LOGIC;
    ieee_tvalid : IN STD_LOGIC;
    ieee_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    binario : OUT std_logic_vector(13 downto 0);
    t_valid_bin : OUT STD_LOGIC;
    deci : OUT STD_LOGIC
  );
end component;
attribute dont_touch of conv_bin : component is "yes";

signal deci : std_logic;

component redondeo is
    PORT (
        clock : IN STD_LOGIC;
        binario_tvalid : IN STD_LOGIC;
        deci : IN STD_LOGIC;
        binario : IN std_logic_vector(13 downto 0);
        redondeo : OUT std_logic_vector(13 downto 0)
    );
end component;

attribute dont_touch of redondeo : component is "yes";

signal bin_redondeo : std_logic_vector(13 downto 0);

begin

restar : my_rest
  PORT MAP (
    aclk => clock,
    s_axis_a_tvalid => ieee_valid,
    s_axis_a_tdata => data_ieee,
    s_axis_b_tvalid => val_min_tvalid,
    s_axis_b_tdata => val_min,
    m_axis_result_tvalid => res_result_tvalid,
    m_axis_result_tdata => res_result
  );

multiplicar : my_multiplicador
  PORT MAP (
    aclk => clock,
    s_axis_a_tvalid => res_result_tvalid,
    s_axis_a_tdata => res_result,
    s_axis_b_tvalid => factor_tvalid,
    s_axis_b_tdata => factor,
    m_axis_result_tvalid => tvalid_multiplicador,
    m_axis_result_tdata => result_multiplicador
  );

cuantizador : conv_bin
    PORT MAP(
    clock => clock,
    ieee_tvalid => tvalid_multiplicador,
    ieee_tdata => result_multiplicador,
    binario => bin_sin_redond,
    t_valid_bin => t_valid_bin,
    deci => deci
  );

redondear : redondeo
    PORT MAP(
        clock => clock,
        binario_tvalid => t_valid_bin,
        deci => deci,
        binario => bin_sin_redond,
        redondeo => binario
    );

--t_valid_bin_out <= t_valid_bin;
--deci_out <= deci;
--binario_sin_out <= bin_redondeo(13 downto 2);

--binario_out <= result_multiplicador(31 downto 26);
--bin_sin_redond_out <= res_result;
--binario_out <= result_multiplicador;

end Behavioral;