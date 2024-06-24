// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Jun  2 01:50:46 2024
// Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Henry/Documents/TesisV4.0-RedPitaya_1/TesisV4.0-RedPitaya_1/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_8/system_top_level_0_8_stub.v
// Design      : system_top_level_0_8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "top_level,Vivado 2020.1" *)
module system_top_level_0_8(clock, binario)
/* synthesis syn_black_box black_box_pad_pin="clock,binario[13:0]" */;
  input clock;
  output [13:0]binario;
endmodule
