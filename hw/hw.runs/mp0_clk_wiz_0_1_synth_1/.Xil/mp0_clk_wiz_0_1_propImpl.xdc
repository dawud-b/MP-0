set_property SRC_FILE_INFO {cfile:c:/Users/zfsalti/488/MP-0/hw/hdl/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1.xdc rfile:../../../hdl/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
