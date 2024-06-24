vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_7
vlib activehdl/processing_system7_vip_v1_0_9
vlib activehdl/xil_defaultlib
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/c_reg_fd_v12_0_6
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_dsp48_addsub_v3_0_6
vlib activehdl/xbip_addsub_v3_0_6
vlib activehdl/c_addsub_v12_0_14
vlib activehdl/c_gate_bit_v12_0_6
vlib activehdl/xbip_counter_v3_0_6
vlib activehdl/c_counter_binary_v12_0_14
vlib activehdl/xlslice_v1_0_2
vlib activehdl/axi_utils_v2_0_6
vlib activehdl/xbip_dsp48_multadd_v3_0_6
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/floating_point_v7_1_10

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 activehdl/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 activehdl/processing_system7_vip_v1_0_9
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 activehdl/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 activehdl/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 activehdl/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 activehdl/c_addsub_v12_0_14
vmap c_gate_bit_v12_0_6 activehdl/c_gate_bit_v12_0_6
vmap xbip_counter_v3_0_6 activehdl/xbip_counter_v3_0_6
vmap c_counter_binary_v12_0_14 activehdl/c_counter_binary_v12_0_14
vmap xlslice_v1_0_2 activehdl/xlslice_v1_0_2
vmap axi_utils_v2_0_6 activehdl/axi_utils_v2_0_6
vmap xbip_dsp48_multadd_v3_0_6 activehdl/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap floating_point_v7_1_10 activehdl/floating_point_v7_1_10

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -sv2k12 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_util_ds_buf_0_0/util_ds_buf.vhd" \
"../../../bd/system/ip/system_util_ds_buf_0_0/sim/system_util_ds_buf_0_0.vhd" \
"../../../bd/system/ip/system_util_ds_buf_1_0/sim/system_util_ds_buf_1_0.vhd" \
"../../../bd/system/ip/system_util_ds_buf_2_0/sim/system_util_ds_buf_2_0.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/7161/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/9ac8/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_14 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/1f12/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_c_counter_binary_0_0/sim/system_c_counter_binary_0_0.vhd" \

vlog -work xlslice_v1_0_2  -v2k5 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/6b56/hdl" "+incdir+../../../../1_led_blink.srcs/sources_1/bd/system/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xlslice_0_0/sim/system_xlslice_0_0.v" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.v" \
"../../../bd/system/ipshared/beec/src/use_dac.v" \
"../../../bd/system/ip/system_use_dac_0_1/sim/system_use_dac_0_1.v" \
"../../../bd/system/sim/system.v" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_9/src/product/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_9/src/product/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_9/src/product/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_9/src/product/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_10 -93 \
"../../../../1_led_blink.srcs/sources_1/bd/system/ip/system_top_level_0_9/src/product/hdl/floating_point_v7_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_top_level_0_9/src/product/sim/product.vhd" \
"../../../bd/system/ip/system_top_level_0_9/src/acumulador/sim/acumulador.vhd" \
"../../../bd/system/ip/system_top_level_0_9/src/suma/sim/suma.vhd" \
"../../../bd/system/ip/system_top_level_0_9/src/my_rest/sim/my_rest.vhd" \
"../../../bd/system/ip/system_top_level_0_9/src/my_multiplicador/sim/my_multiplicador.vhd" \
"../../../bd/system/ip/system_top_level_0_9/src/product_sdr/sim/product_sdr.vhd" \
"../../../bd/system/ipshared/efec/src/bits16_bits32.vhd" \
"../../../bd/system/ipshared/efec/src/carrier.vhd" \
"../../../bd/system/ipshared/efec/src/config_ofdm.vhd" \
"../../../bd/system/ipshared/efec/src/control_memoria.vhd" \
"../../../bd/system/ipshared/efec/src/conv_bin.vhd" \
"../../../bd/system/ipshared/efec/src/cuantizador.vhd" \
"../../../bd/system/ipshared/efec/src/interpolador.vhd" \
"../../../bd/system/ipshared/efec/src/ofdm.vhd" \
"../../../bd/system/ipshared/efec/src/ofdm_sdr.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila0.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila1.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila2.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila3.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila4.vhd" \
"../../../bd/system/ipshared/efec/src/pv_fila5.vhd" \
"../../../bd/system/ipshared/efec/src/redondeo.vhd" \
"../../../bd/system/ipshared/efec/src/synch_tx.vhd" \
"../../../bd/system/ipshared/efec/src/top_level.vhd" \
"../../../bd/system/ip/system_top_level_0_9/sim/system_top_level_0_9.vhd" \

vlog -work xil_defaultlib \
"glbl.v"
