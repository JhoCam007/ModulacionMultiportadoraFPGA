// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri May 24 00:11:02 2024
// Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_use_dac_0_1_sim_netlist.v
// Design      : system_use_dac_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_use_dac_0_1,use_dac,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "use_dac,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    ddr_clk,
    locked,
    dac_clk,
    dac_rst,
    dac_sel,
    dac_wrt,
    dac_dat,
    data_dac);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ddr_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input ddr_clk;
  input locked;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_clk, ASSOCIATED_RESET dac_rst, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_use_dac_0_1_dac_clk, INSERT_VIP 0" *) output dac_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dac_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output dac_rst;
  output dac_sel;
  output dac_wrt;
  output [13:0]dac_dat;
  input [13:0]data_dac;

  wire aclk;
  wire dac_clk;
  wire [13:0]dac_dat;
  wire dac_rst;
  wire dac_sel;
  wire dac_wrt;
  wire [13:0]data_dac;
  wire ddr_clk;
  wire locked;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_use_dac inst
       (.aclk(aclk),
        .dac_clk(dac_clk),
        .dac_dat(dac_dat),
        .dac_rst(dac_rst),
        .dac_sel(dac_sel),
        .dac_wrt(dac_wrt),
        .data_dac(data_dac),
        .ddr_clk(ddr_clk),
        .locked(locked));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_use_dac
   (dac_rst,
    dac_sel,
    dac_wrt,
    dac_clk,
    dac_dat,
    aclk,
    ddr_clk,
    data_dac,
    locked);
  output dac_rst;
  output dac_sel;
  output dac_wrt;
  output dac_clk;
  output [13:0]dac_dat;
  input aclk;
  input ddr_clk;
  input [13:0]data_dac;
  input locked;

  wire aclk;
  wire dac_clk;
  wire [13:0]dac_dat;
  wire dac_rst;
  wire dac_sel;
  wire dac_wrt;
  wire [13:0]data_dac;
  wire ddr_clk;
  wire [13:0]int_dat_a_reg;
  wire [13:13]int_dat_b_reg;
  wire int_rst_reg;
  wire locked;
  wire p_0_in;
  wire \NLW_DAC_DAT[0].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[0].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[10].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[10].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[11].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[11].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[12].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[12].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[13].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[13].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[1].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[1].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[2].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[2].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[3].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[3].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[4].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[4].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[5].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[5].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[6].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[6].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[7].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[7].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[8].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[8].ODDR_inst_S_UNCONNECTED ;
  wire \NLW_DAC_DAT[9].ODDR_inst_R_UNCONNECTED ;
  wire \NLW_DAC_DAT[9].ODDR_inst_S_UNCONNECTED ;
  wire NLW_ODDR_clk_R_UNCONNECTED;
  wire NLW_ODDR_clk_S_UNCONNECTED;
  wire NLW_ODDR_rst_R_UNCONNECTED;
  wire NLW_ODDR_rst_S_UNCONNECTED;
  wire NLW_ODDR_sel_R_UNCONNECTED;
  wire NLW_ODDR_sel_S_UNCONNECTED;
  wire NLW_ODDR_wrt_R_UNCONNECTED;
  wire NLW_ODDR_wrt_S_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[0].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[0]),
        .D2(1'b0),
        .Q(dac_dat[0]),
        .R(\NLW_DAC_DAT[0].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[0].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[10].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[10]),
        .D2(1'b0),
        .Q(dac_dat[10]),
        .R(\NLW_DAC_DAT[10].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[10].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[11].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[11]),
        .D2(1'b0),
        .Q(dac_dat[11]),
        .R(\NLW_DAC_DAT[11].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[11].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[12].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[12]),
        .D2(1'b0),
        .Q(dac_dat[12]),
        .R(\NLW_DAC_DAT[12].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[12].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[13].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[13]),
        .D2(int_dat_b_reg),
        .Q(dac_dat[13]),
        .R(\NLW_DAC_DAT[13].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[13].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[1].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[1]),
        .D2(1'b0),
        .Q(dac_dat[1]),
        .R(\NLW_DAC_DAT[1].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[1].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[2].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[2]),
        .D2(1'b0),
        .Q(dac_dat[2]),
        .R(\NLW_DAC_DAT[2].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[2].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[3].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[3]),
        .D2(1'b0),
        .Q(dac_dat[3]),
        .R(\NLW_DAC_DAT[3].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[3].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[4].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[4]),
        .D2(1'b0),
        .Q(dac_dat[4]),
        .R(\NLW_DAC_DAT[4].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[4].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[5].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[5]),
        .D2(1'b0),
        .Q(dac_dat[5]),
        .R(\NLW_DAC_DAT[5].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[5].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[6].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[6]),
        .D2(1'b0),
        .Q(dac_dat[6]),
        .R(\NLW_DAC_DAT[6].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[6].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[7].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[7]),
        .D2(1'b0),
        .Q(dac_dat[7]),
        .R(\NLW_DAC_DAT[7].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[7].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[8].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[8]),
        .D2(1'b0),
        .Q(dac_dat[8]),
        .R(\NLW_DAC_DAT[8].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[8].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \DAC_DAT[9].ODDR_inst 
       (.C(aclk),
        .CE(1'b1),
        .D1(int_dat_a_reg[9]),
        .D2(1'b0),
        .Q(dac_dat[9]),
        .R(\NLW_DAC_DAT[9].ODDR_inst_R_UNCONNECTED ),
        .S(\NLW_DAC_DAT[9].ODDR_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_clk
       (.C(ddr_clk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(dac_clk),
        .R(NLW_ODDR_clk_R_UNCONNECTED),
        .S(NLW_ODDR_clk_S_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_rst
       (.C(aclk),
        .CE(1'b1),
        .D1(int_rst_reg),
        .D2(int_rst_reg),
        .Q(dac_rst),
        .R(NLW_ODDR_rst_R_UNCONNECTED),
        .S(NLW_ODDR_rst_S_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_sel
       (.C(aclk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(dac_sel),
        .R(NLW_ODDR_sel_R_UNCONNECTED),
        .S(NLW_ODDR_sel_S_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_wrt
       (.C(ddr_clk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(dac_wrt),
        .R(NLW_ODDR_wrt_R_UNCONNECTED),
        .S(NLW_ODDR_wrt_S_UNCONNECTED));
  FDRE \int_dat_a_reg_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[0]),
        .Q(int_dat_a_reg[0]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[10]),
        .Q(int_dat_a_reg[10]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[11]),
        .Q(int_dat_a_reg[11]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[12] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[12]),
        .Q(int_dat_a_reg[12]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[13] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[13]),
        .Q(int_dat_a_reg[13]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[1]),
        .Q(int_dat_a_reg[1]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[2]),
        .Q(int_dat_a_reg[2]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[3]),
        .Q(int_dat_a_reg[3]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[4]),
        .Q(int_dat_a_reg[4]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[5]),
        .Q(int_dat_a_reg[5]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[6]),
        .Q(int_dat_a_reg[6]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[7]),
        .Q(int_dat_a_reg[7]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[8]),
        .Q(int_dat_a_reg[8]),
        .R(p_0_in));
  FDRE \int_dat_a_reg_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(data_dac[9]),
        .Q(int_dat_a_reg[9]),
        .R(p_0_in));
  FDRE \int_dat_b_reg_reg[13] 
       (.C(aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(int_dat_b_reg),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    int_rst_reg_i_1
       (.I0(locked),
        .O(p_0_in));
  FDRE int_rst_reg_reg
       (.C(aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(int_rst_reg),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
