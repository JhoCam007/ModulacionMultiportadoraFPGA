-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Jun 21 03:42:05 2024
-- Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Henry/Documents/TesisV4.0-RedPitaya_1-GFDM/TesisV4.0-RedPitaya_1/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_11/system_top_level_0_11_stub.vhdl
-- Design      : system_top_level_0_11
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_top_level_0_11 is
  Port ( 
    clock : in STD_LOGIC;
    binario : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );

end system_top_level_0_11;

architecture stub of system_top_level_0_11 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,binario[13:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "top_level,Vivado 2020.1";
begin
end;
