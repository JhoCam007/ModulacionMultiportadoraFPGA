// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri May 24 00:12:09 2024
// Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Henry/Documents/TesisV4.0-RedPitaya/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_c_counter_binary_0_0/system_c_counter_binary_0_0_sim_netlist.v
// Design      : system_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_c_counter_binary_0_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module system_c_counter_binary_0_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 32}" *) output [31:0]Q;

  wire CLK;
  wire [31:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  system_c_counter_binary_0_0_c_counter_binary_v12_0_14 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_14" *) (* downgradeipidentifiedwarnings = "yes" *) 
module system_c_counter_binary_0_0_c_counter_binary_v12_0_14
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [31:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  system_c_counter_binary_0_0_c_counter_binary_v12_0_14_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
EJFZwtxl4g9/OL6+bopUV8BP4e67HNukCIy7Ih3E75y7soa6GhqEucPXMiOy+mJrcrNwD+HjZ0/I
BwEKIiA4mA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
rZCGWdmPJXoOuANoS8fyUXk7SyF+uTNJL18BfeKc+fxcyRrCB++WrM02adxoUdICz4/92yY8TQgj
xyPC0eaHZcjSLepbnHHgSReIQ1PL0hmufLbye7QTD0ygUXC4MvFVY8s3KeW9cPCqOxkyCSziJQzs
J5OT9XLQno1e9rIBr9M=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I7Zo4frj3tO6FFzeDhpSENS0yd34dQZBtiyIrI/GMASFBUeny6muOD2l0HK69ImRJIOyobvK1+9O
DhxptAc4NzRpY4xUZvr4ix1AhM1Kars1OkrQCWz4a7ciGU/XDblidF3IL0Fa7c41gHIZR9c/Usa6
XL7UEu3aSPQYbZLSDOzeao4VtSSn+dCcjsH4X8zVjSqXg8dcN3fd5C15JaMYg00F2yOFtxwWwZWq
Yvwe1q1PG/wcA1cKAOscANbj4o3O4LjfylNIB6L+Mssxosh+e0+oobWNk/ouBa4k1c3/IzXGSCAs
hEvbI+iqkWJJKZrSb9PZk7S7XSJcScrJO/DGkQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DDRecdVJcCPEpbUqhuwKtKWXteF7XhGc5d+lQn2uiREzbHyuZvQ1wDwAGGrPwE75gjqc7CdHPMOY
8+3nqcEwR4Q5USgQcou3Cyc6C0TnzzDD/dLKPHDWA1s52x8Rx+LBH9WCvBpD5BKkE4o1s3rN1tL2
wTdCqzzKD8YlryKQ4U0lr2bX6Mlf4/nIt2K1eyPKbIrHIvKDThmaIF/qLnLnkE04pksWJ9Af1OVB
46iqBssrR5p6wZc241D4CqSRCRamfP/s1JrTi8bBNCcXhC0f0Aa35UAoG8vnFngHlFd3G2J88cas
Fo7UH4k1BTTfgbQ35ec0XfSbS/qQWS+EgAF+wA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
L11p2bsABDhO9HvT3IM+HulCClFvs/UPexuAVExicKtzrLN7tNvUjSouZSn9KwAjR2hg5ZIJ23uy
1elB+eyEl65vQnoH4+s6Q5K4EIcMo5WVKfIKwgu5Q3Sg/jYW+aWT/kGuc7CazRsTxJ7XPFndpMIM
cxYWx2DLps320t+Be0c=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uublhc2r9VmPPq1tMATsd3XJltn9QRg1/PdCtSlxgFBDDAk13md52Fz+h+DOWptR3Q4i+Sx5IhIP
QIONVNTf1DnoK/wa1lkbd1dROJam8/cZQFiIxnsnSPGXzOGoc0c04xDSCJCCDxiDMF1YTtAqt6nw
yZh1RwOhPpgwUKjeJ4o4TY6/i0xuYAYVc83O6KwI9Ywk9UsfyIQQS8UXFo8zA9eniU2n2NcyAVNj
Y8xZ9PYJfzfDo6dHWsj4Ik588uhfO/bmsf2/ZuY5HCAMQpnda9XzPkVomNjRfsUghko7KipIl2ur
aHh+4i2kI/+cHaihhw3z14aGidBkuYKaopasbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VYqlyQSuRywWcSrUprXX2UzoaWsJXTTbptzDY9ycgFR91H2uYfY43f80gn0E87Gvj90Qmn0Dl6ck
2VjO2Zn9yATmqtuzi/Etuf29dkl3uyKtk02OitZJEhD1CDyUJHDXKHkPMXOZCBU5CfkrIWw2SsSq
YuQKmvxp4BrhcwXypr+vRSsYd1liMxxuXOdBN5AIyzibGfcR4YUeOokIoP05xZoQOfPQkotMC1B6
SHVKEaBxe37YkyKAkQ0f9eKfnPPLG/G5qeLrFPAiIar0HHpOvdCOO69vi3RG1XqoxtTm/wGwRb5J
ZqzZyTn1Fm55PXyKhlElzXXAv1xPOTbkJXRZNQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EktM4icAEVQRmfzXBBFeRr7d3ZTOU9f+J40sQAiff114nDU+fxlewcv+twlytUk9LMSR67RJlLt4
+ZBTwcuSPZ2Cvrommkp++7rNze0VCD8pSAdj4uo1ZnYWVWmPMQaRIqI88lnAzc5+T/LxEiXKn4ji
AYGs9fja4ME8C0CHbBsg+jfUryleVk1D8jEMCetM7qDx64s/7AGfwzDqMiW2DPCPLKNUsdlOlBYT
JAOnfy6deN7/o7BYxBsE1P4Pib1x1hvR8RwEm38pBOLKGade6KL/1SHmz5N1KGLPSXQXlK53RLTI
Exc4wN04Kg72tf503oGq6Vp90c5pksQ9cc0M+w==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qzYsaSn6YzxyfrxIwv3eyowRK7ZyzZmQHzUmV2AITf6g43c7IV/fwNBDik+XFhLScW2SxsyaGGI7
5n6kAt9uM3GerkCXA+LJQrqshcEyjuvm17vWVovBURqxhTARgZaTs5OtXdhc/wLi5e6lsdyyLtQo
bt66ubjErMgf5+tD8rpn0HkjUYmGv/MBZ0i4bGui735H12aK+wTfhGVOOiuWHCk2zCJJSx3vH4sl
dKtlpg4W0hPEM3TBPHaLnOpIDkrIUaGGN5fm6NJL6US59+Lr8/3mplbD8ld21OKzgLH+5YPRMoo4
1Pbjxkawu5Kk60AsuaR/OxngawaRMd9N4niRfQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
krB4hFB2xOhp3vC8/jzgMIUOiwF6kHZ7NZVUHFxayPVC7k5zfT7v4gDEMzlA9cRepLpW5mr3tX9a
Wbcf540LOPjQrYvuCvdHx0Ryb1gIOzaEZHXlRRZ+RqP2C60gLhSge+fNzf43Hoar2NqazJaXG60g
ooK3jr8a/UIQd6iXVJYhDqAhbblKD+ex7BB0cwywrn34LA3nPxs2yTs19eBpAx+qIfFFuuJO4nzf
dBWi9uVljDonyrJ6R8p6N/XGJ+4IMxVN3vMYeajCXO2dG/tGPAh0mucWjoli10rgDWdX1Czj9+ZE
sK23T7D1GyyY+TRCaIwRx1OYwDBX2T8XV8hpKg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
y5DIt0gErk46GsDtb7G6G+bTsCj90wX5breBpTFMJYYRm714Rlly+LbgFdcbT2uTtqr0cCtvuqOp
gebTSSsaLFTYz53VT0rvzcDvrzWAnx7uw1mH0xlqJLJYjbq5R+XDdOP9QK6P+nGLKQFIxeKY4jgi
r8s71/nFcMhYiW8B3TgIyA8K6tC1GtzeEkBtXY1bWdxKs6AyfGJWO2kvk0A9RCP6LVIqs850WT1N
3Ap/jq2fZL3g/qS/joCf99t7rJeglXs4ZzYONzoi6VDLEBe0gwTmo0nXfBf/jYd+YWXgY+kDEo48
+MVcRJNosoK1nDOgWiCKjkhrUXCNKpwEix2Fzg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17616)
`pragma protect data_block
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
PEDy
`pragma protect end_protected
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
