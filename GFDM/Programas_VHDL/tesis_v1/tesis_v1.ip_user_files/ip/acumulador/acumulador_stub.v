// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue May 21 17:02:17 2024
// Host        : DESKTOP-LACT4PH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Jhonatan/Documents/basys/modulacion/tesis_v1/tesis_v1.srcs/sources_1/ip/acumulador/acumulador_stub.v
// Design      : acumulador
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "floating_point_v7_1_10,Vivado 2020.1" *)
module acumulador(aclk, aresetn, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_a_tlast, m_axis_result_tvalid, m_axis_result_tdata, m_axis_result_tlast)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_a_tlast,m_axis_result_tvalid,m_axis_result_tdata[15:0],m_axis_result_tlast" */;
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  input [15:0]s_axis_a_tdata;
  input s_axis_a_tlast;
  output m_axis_result_tvalid;
  output [15:0]m_axis_result_tdata;
  output m_axis_result_tlast;
endmodule
