set_property SRC_FILE_INFO {cfile:c:/Users/zfsalti/488/MP-0/hw/hdl/mp0/ip/mp0_processing_system7_0_0/mp0_processing_system7_0_0/mp0_processing_system7_0_0_in_context.xdc rfile:../../../hdl/mp0/ip/mp0_processing_system7_0_0/mp0_processing_system7_0_0/mp0_processing_system7_0_0_in_context.xdc id:1 order:EARLY scoped_inst:mp0_i/processing_system7_0} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/zfsalti/488/MP-0/hw/hdl/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1_in_context.xdc rfile:../../../hdl/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1_in_context.xdc id:2 order:EARLY scoped_inst:mp0_i/clk_wiz_0} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/zfsalti/488/MP-0/hw/zedboard_master.xdc rfile:../../../zedboard_master.xdc id:3} [current_design]
current_instance mp0_i/processing_system7_0
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance mp0_i/clk_wiz_0
set_property src_info {type:SCOPED_XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 14.863 29.725} [get_ports {}]
current_instance
set_property src_info {type:XDC file:3 line:100 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W12 [get_ports {snes_gpio_in[0]}];  # "JB1"
set_property src_info {type:XDC file:3 line:101 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W11 [get_ports {snes_gpio_out[0]}];  # "JB2"
set_property src_info {type:XDC file:3 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V10 [get_ports {snes_gpio_out[1]}];  # "JB3"
set_property src_info {type:XDC file:3 line:187 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y21  [get_ports {VGA_RGB[0]}];  # "VGA-B1"
set_property src_info {type:XDC file:3 line:188 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y20  [get_ports {VGA_RGB[1]}];  # "VGA-B2"
set_property src_info {type:XDC file:3 line:189 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB20 [get_ports {VGA_RGB[2]}];  # "VGA-B3"
set_property src_info {type:XDC file:3 line:190 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB19 [get_ports {VGA_RGB[3]}];  # "VGA-B4"
set_property src_info {type:XDC file:3 line:191 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB22 [get_ports {VGA_RGB[4]}];  # "VGA-G1"
set_property src_info {type:XDC file:3 line:192 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA22 [get_ports {VGA_RGB[5]}];  # "VGA-G2"
set_property src_info {type:XDC file:3 line:193 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB21 [get_ports {VGA_RGB[6]}];  # "VGA-G3"
set_property src_info {type:XDC file:3 line:194 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA21 [get_ports {VGA_RGB[7]}];  # "VGA-G4"
set_property src_info {type:XDC file:3 line:195 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA19 [get_ports {VGA_HS}];  # "VGA-HS"
set_property src_info {type:XDC file:3 line:196 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V20  [get_ports {VGA_RGB[8]}];  # "VGA-R1"
set_property src_info {type:XDC file:3 line:197 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U20  [get_ports {VGA_RGB[9]}];  # "VGA-R2"
set_property src_info {type:XDC file:3 line:198 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V19  [get_ports {VGA_RGB[10]}];  # "VGA-R3"
set_property src_info {type:XDC file:3 line:199 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V18  [get_ports {VGA_RGB[11]}];  # "VGA-R4"
set_property src_info {type:XDC file:3 line:200 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y19  [get_ports {VGA_VS}];  # "VGA-VS"
set_property src_info {type:XDC file:3 line:362 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];
set_property src_info {type:XDC file:3 line:367 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];
set_property src_info {type:XDC file:3 line:372 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];
set_property src_info {type:XDC file:3 line:375 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
