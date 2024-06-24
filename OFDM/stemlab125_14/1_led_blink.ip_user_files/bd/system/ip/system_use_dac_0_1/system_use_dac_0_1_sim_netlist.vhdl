-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri May 24 00:11:03 2024
-- Host        : DESKTOP-5U57I87 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Henry/Documents/TesisV4.0-RedPitaya/Pitaya/redpitaya_guide-master/tmp/1_led_blink/1_led_blink.srcs/sources_1/bd/system/ip/system_use_dac_0_1/system_use_dac_0_1_sim_netlist.vhdl
-- Design      : system_use_dac_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_use_dac_0_1_use_dac is
  port (
    dac_rst : out STD_LOGIC;
    dac_sel : out STD_LOGIC;
    dac_wrt : out STD_LOGIC;
    dac_clk : out STD_LOGIC;
    dac_dat : out STD_LOGIC_VECTOR ( 13 downto 0 );
    aclk : in STD_LOGIC;
    ddr_clk : in STD_LOGIC;
    data_dac : in STD_LOGIC_VECTOR ( 13 downto 0 );
    locked : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_use_dac_0_1_use_dac : entity is "use_dac";
end system_use_dac_0_1_use_dac;

architecture STRUCTURE of system_use_dac_0_1_use_dac is
  signal int_dat_a_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal int_dat_b_reg : STD_LOGIC_VECTOR ( 13 to 13 );
  signal int_rst_reg : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \NLW_DAC_DAT[0].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[0].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[10].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[10].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[11].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[11].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[12].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[12].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[13].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[13].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[1].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[1].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[2].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[2].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[3].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[3].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[4].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[4].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[5].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[5].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[6].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[6].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[7].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[7].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[8].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[8].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[9].ODDR_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DAC_DAT[9].ODDR_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal NLW_ODDR_clk_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_clk_S_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_rst_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_rst_S_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_sel_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_sel_S_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_wrt_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_wrt_S_UNCONNECTED : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \DAC_DAT[0].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \DAC_DAT[0].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \DAC_DAT[0].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[10].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[10].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[10].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[11].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[11].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[11].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[12].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[12].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[12].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[13].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[13].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[13].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[1].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[1].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[1].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[2].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[2].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[2].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[3].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[3].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[3].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[4].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[4].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[4].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[5].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[5].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[5].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[6].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[6].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[6].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[7].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[7].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[7].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[8].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[8].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[8].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of \DAC_DAT[9].ODDR_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \DAC_DAT[9].ODDR_inst\ : label is "MLO";
  attribute \__SRVAL\ of \DAC_DAT[9].ODDR_inst\ : label is "TRUE";
  attribute BOX_TYPE of ODDR_clk : label is "PRIMITIVE";
  attribute OPT_MODIFIED of ODDR_clk : label is "MLO";
  attribute \__SRVAL\ of ODDR_clk : label is "TRUE";
  attribute BOX_TYPE of ODDR_rst : label is "PRIMITIVE";
  attribute OPT_MODIFIED of ODDR_rst : label is "MLO";
  attribute \__SRVAL\ of ODDR_rst : label is "TRUE";
  attribute BOX_TYPE of ODDR_sel : label is "PRIMITIVE";
  attribute OPT_MODIFIED of ODDR_sel : label is "MLO";
  attribute \__SRVAL\ of ODDR_sel : label is "TRUE";
  attribute BOX_TYPE of ODDR_wrt : label is "PRIMITIVE";
  attribute OPT_MODIFIED of ODDR_wrt : label is "MLO";
  attribute \__SRVAL\ of ODDR_wrt : label is "TRUE";
begin
\DAC_DAT[0].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(0),
      D2 => '0',
      Q => dac_dat(0),
      R => \NLW_DAC_DAT[0].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[0].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[10].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(10),
      D2 => '0',
      Q => dac_dat(10),
      R => \NLW_DAC_DAT[10].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[10].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[11].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(11),
      D2 => '0',
      Q => dac_dat(11),
      R => \NLW_DAC_DAT[11].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[11].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[12].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(12),
      D2 => '0',
      Q => dac_dat(12),
      R => \NLW_DAC_DAT[12].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[12].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[13].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(13),
      D2 => int_dat_b_reg(13),
      Q => dac_dat(13),
      R => \NLW_DAC_DAT[13].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[13].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[1].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(1),
      D2 => '0',
      Q => dac_dat(1),
      R => \NLW_DAC_DAT[1].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[1].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[2].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(2),
      D2 => '0',
      Q => dac_dat(2),
      R => \NLW_DAC_DAT[2].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[2].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[3].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(3),
      D2 => '0',
      Q => dac_dat(3),
      R => \NLW_DAC_DAT[3].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[3].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[4].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(4),
      D2 => '0',
      Q => dac_dat(4),
      R => \NLW_DAC_DAT[4].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[4].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[5].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(5),
      D2 => '0',
      Q => dac_dat(5),
      R => \NLW_DAC_DAT[5].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[5].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[6].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(6),
      D2 => '0',
      Q => dac_dat(6),
      R => \NLW_DAC_DAT[6].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[6].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[7].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(7),
      D2 => '0',
      Q => dac_dat(7),
      R => \NLW_DAC_DAT[7].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[7].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[8].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(8),
      D2 => '0',
      Q => dac_dat(8),
      R => \NLW_DAC_DAT[8].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[8].ODDR_inst_S_UNCONNECTED\
    );
\DAC_DAT[9].ODDR_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_dat_a_reg(9),
      D2 => '0',
      Q => dac_dat(9),
      R => \NLW_DAC_DAT[9].ODDR_inst_R_UNCONNECTED\,
      S => \NLW_DAC_DAT[9].ODDR_inst_S_UNCONNECTED\
    );
ODDR_clk: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => ddr_clk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => dac_clk,
      R => NLW_ODDR_clk_R_UNCONNECTED,
      S => NLW_ODDR_clk_S_UNCONNECTED
    );
ODDR_rst: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => int_rst_reg,
      D2 => int_rst_reg,
      Q => dac_rst,
      R => NLW_ODDR_rst_R_UNCONNECTED,
      S => NLW_ODDR_rst_S_UNCONNECTED
    );
ODDR_sel: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => aclk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => dac_sel,
      R => NLW_ODDR_sel_R_UNCONNECTED,
      S => NLW_ODDR_sel_S_UNCONNECTED
    );
ODDR_wrt: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => ddr_clk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => dac_wrt,
      R => NLW_ODDR_wrt_R_UNCONNECTED,
      S => NLW_ODDR_wrt_S_UNCONNECTED
    );
\int_dat_a_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(0),
      Q => int_dat_a_reg(0),
      R => p_0_in
    );
\int_dat_a_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(10),
      Q => int_dat_a_reg(10),
      R => p_0_in
    );
\int_dat_a_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(11),
      Q => int_dat_a_reg(11),
      R => p_0_in
    );
\int_dat_a_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(12),
      Q => int_dat_a_reg(12),
      R => p_0_in
    );
\int_dat_a_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(13),
      Q => int_dat_a_reg(13),
      R => p_0_in
    );
\int_dat_a_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(1),
      Q => int_dat_a_reg(1),
      R => p_0_in
    );
\int_dat_a_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(2),
      Q => int_dat_a_reg(2),
      R => p_0_in
    );
\int_dat_a_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(3),
      Q => int_dat_a_reg(3),
      R => p_0_in
    );
\int_dat_a_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(4),
      Q => int_dat_a_reg(4),
      R => p_0_in
    );
\int_dat_a_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(5),
      Q => int_dat_a_reg(5),
      R => p_0_in
    );
\int_dat_a_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(6),
      Q => int_dat_a_reg(6),
      R => p_0_in
    );
\int_dat_a_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(7),
      Q => int_dat_a_reg(7),
      R => p_0_in
    );
\int_dat_a_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(8),
      Q => int_dat_a_reg(8),
      R => p_0_in
    );
\int_dat_a_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => data_dac(9),
      Q => int_dat_a_reg(9),
      R => p_0_in
    );
\int_dat_b_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => '1',
      Q => int_dat_b_reg(13),
      R => p_0_in
    );
int_rst_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => locked,
      O => p_0_in
    );
int_rst_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in,
      Q => int_rst_reg,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_use_dac_0_1 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_use_dac_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_use_dac_0_1 : entity is "system_use_dac_0_1,use_dac,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_use_dac_0_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_use_dac_0_1 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_use_dac_0_1 : entity is "use_dac,Vivado 2020.1";
end system_use_dac_0_1;

architecture STRUCTURE of system_use_dac_0_1 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of dac_clk : signal is "xilinx.com:signal:clock:1.0 dac_clk CLK";
  attribute X_INTERFACE_PARAMETER of dac_clk : signal is "XIL_INTERFACENAME dac_clk, ASSOCIATED_RESET dac_rst, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN system_use_dac_0_1_dac_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of dac_rst : signal is "xilinx.com:signal:reset:1.0 dac_rst RST";
  attribute X_INTERFACE_PARAMETER of dac_rst : signal is "XIL_INTERFACENAME dac_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ddr_clk : signal is "xilinx.com:signal:clock:1.0 ddr_clk CLK";
  attribute X_INTERFACE_PARAMETER of ddr_clk : signal is "XIL_INTERFACENAME ddr_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
begin
inst: entity work.system_use_dac_0_1_use_dac
     port map (
      aclk => aclk,
      dac_clk => dac_clk,
      dac_dat(13 downto 0) => dac_dat(13 downto 0),
      dac_rst => dac_rst,
      dac_sel => dac_sel,
      dac_wrt => dac_wrt,
      data_dac(13 downto 0) => data_dac(13 downto 0),
      ddr_clk => ddr_clk,
      locked => locked
    );
end STRUCTURE;
