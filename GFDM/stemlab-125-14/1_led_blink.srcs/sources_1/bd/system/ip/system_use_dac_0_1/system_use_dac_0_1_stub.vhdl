-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri May 24 00:11:03 2024
-- Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Henry/Documents/TesisV4.0-RedPitaya/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_use_dac_0_1/system_use_dac_0_1_stub.vhdl
-- Design      : system_use_dac_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_use_dac_0_1 is
  Port ( 
    aclk : in STD_LOGIC;
    ddr_clk : in STD_LOGIC;
    locked : in STD_LOGIC;
    dac_clk : out STD_LOGIC;
    dac_rst : out STD_LOGIC;
    dac_sel : out STD_LOGIC;
    dac_wrt : out STD_LOGIC;
    dac_dat : out STD_LOGIC_VECTOR ( 13 downto 0 );
    data_dac : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );

end system_use_dac_0_1;

architecture stub of system_use_dac_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,ddr_clk,locked,dac_clk,dac_rst,dac_sel,dac_wrt,dac_dat[13:0],data_dac[13:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "use_dac,Vivado 2020.1";
begin
end;
