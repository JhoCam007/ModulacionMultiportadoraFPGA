# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {start_tx}]
	set_property IOSTANDARD LVCMOS33 [get_ports {start_tx}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {selection_tx[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {selection_tx[1]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {selection_tx[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {selection_tx[0]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {finish_img}]
	set_property IOSTANDARD LVCMOS33 [get_ports {finish_img}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {cont_sal}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cont_sal}]
##Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {bits_tx_out}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bits_tx_out}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]