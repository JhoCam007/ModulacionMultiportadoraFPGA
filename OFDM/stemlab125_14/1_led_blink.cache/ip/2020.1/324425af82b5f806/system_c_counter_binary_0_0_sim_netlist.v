// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri May 24 00:12:07 2024
// Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_c_counter_binary_0_0_sim_netlist.v
// Design      : system_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_c_counter_binary_0_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14 U0
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
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_14_viv i_synth
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
mzvAAxEIe6CJ1DJ2I64lh7+uIF+wDrlskAkmu1U9MR99oOJsD9zeTNkz4LBgRp9iASJeXOFotPNE
9l6sW3pnWahQZfeZr+0LSlGLPmh9mI6SOBe9316iKV15Yqi8oswKgHSDQsywecgr5nraP+qy/BO1
LK7AoW8yy6hFFoi0j5l5Vw+SrQ7825MSMhlFEZRLqCl0xRo8+90jvfOLiLiLNmgCGmZ7Y/PxAEmO
/mHuibfm1mRX6IixQONQpZfUADgHkQVUaKAcfdJ436JthMJ+J5G+5SEsPjdWDTtEgLF74jURP2go
QahJSytXC9B/rkjYC56kup8lxyHn7Wljgxg0pA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nFXNCvAtKagoUDREGUqU6s51Qql5O518xdwD8+SotDVwVHrQOkugjyrXFKNVvZg9hyXlol1ydym9
WW6JQbD+2ILkgr1+83eE0jhStjbd+nQd6z1A5fNQT1bFkT7G2BaFGq12hM8Y8bW0jlTMxPcqViqD
5xnD38zHgDDs9huyi35Py/OiCwQdUGoQeXxKKR84vtRBE+bdc/sFuNMauXPfTMPtn7I9oYtTC2Lx
eq90foP3MO3CpD+IsA+czP6khrkqmUDxiwBt1wf2zgtjSQc97DsLo6qfGh2BchH0bBKsEKUfvBeM
1HWZcypiXJn36QkvF0oVvSoy7+0pJdxfZwQynw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17440)
`pragma protect data_block
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
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
