// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri May 24 00:11:03 2024
// Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Henry/Documents/TesisV4.0-RedPitaya/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_use_dac_0_1/system_use_dac_0_1_stub.v
// Design      : system_use_dac_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "use_dac,Vivado 2020.1" *)
module system_use_dac_0_1(aclk, ddr_clk, locked, dac_clk, dac_rst, dac_sel, 
  dac_wrt, dac_dat, data_dac)
/* synthesis syn_black_box black_box_pad_pin="aclk,ddr_clk,locked,dac_clk,dac_rst,dac_sel,dac_wrt,dac_dat[13:0],data_dac[13:0]" */;
  input aclk;
  input ddr_clk;
  input locked;
  output dac_clk;
  output dac_rst;
  output dac_sel;
  output dac_wrt;
  output [13:0]dac_dat;
  input [13:0]data_dac;
endmodule
