## Clock signal
#set_property PACKAGE_PIN W5 [get_ports clock]							
#	set_property IOSTANDARD LVCMOS33 [get_ports clock]
#	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

##Pmod Header JB
##Sch name = JB1
#set_property PACKAGE_PIN A14 [get_ports {binario[0]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[0]}]
##Sch name = JB2
#set_property PACKAGE_PIN A16 [get_ports {binario[1]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[1]}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {binario[2]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[2]}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {binario[3]}]	
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {binario[4]}]		
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {binario[5]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {binario[6]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {binario[7]}]			
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[7]}]

##Pmod Header JC
##Sch name = JC1
#set_property PACKAGE_PIN K17 [get_ports {binario[8]}]		
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[8]}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {binario[9]}]		
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[9]}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {binario[10]}]		
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[10]}]
##Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {binario[11]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[11]}]
##Sch name = JC7
#set_property PACKAGE_PIN L17 [get_ports {binario[12]}]	
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[12]}]
##Sch name = JC8
#set_property PACKAGE_PIN M19 [get_ports {binario[13]}]	
#	set_property IOSTANDARD LVCMOS33 [get_ports {binario[13]}]
	
##Sch name = JC9
##set_property PACKAGE_PIN P17 [get_ports {binario[6]}}]					
##	set_property IOSTANDARD LVCMOS33 [get_ports {binario[6]}}]
###Sch name = JC10
##set_property PACKAGE_PIN R18 [get_ports {binario[6]}}]					
##	set_property IOSTANDARD LVCMOS33 [get_ports {binario[6]}}]

### Configuration options, can be used for all designs
#set_property CONFIG_VOLTAGE 3.3 [current_design]
#set_property CFGBVS VCCO [current_design]