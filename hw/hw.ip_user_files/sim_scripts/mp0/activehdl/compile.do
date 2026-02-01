vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_7
vlib activehdl/processing_system7_vip_v1_0_9
vlib activehdl/xil_defaultlib
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_23
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_21
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_20
vlib activehdl/axi_crossbar_v2_1_22
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/gigantic_mux
vlib activehdl/xlconcat_v2_1_3
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_fifo_v1_0_14
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/lib_bmg_v1_0_13
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_datamover_v5_1_23
vlib activehdl/axi_vdma_v6_3_9
vlib activehdl/axi_protocol_converter_v2_1_21

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 activehdl/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 activehdl/processing_system7_vip_v1_0_9
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_23 activehdl/axi_gpio_v2_0_23
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 activehdl/axi_register_slice_v2_1_21
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_20 activehdl/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 activehdl/axi_crossbar_v2_1_22
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap gigantic_mux activehdl/gigantic_mux
vmap xlconcat_v2_1_3 activehdl/xlconcat_v2_1_3
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_fifo_v1_0_14 activehdl/lib_fifo_v1_0_14
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap lib_bmg_v1_0_13 activehdl/lib_bmg_v1_0_13
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_23 activehdl/axi_datamover_v5_1_23
vmap axi_vdma_v6_3_9 activehdl/axi_vdma_v6_3_9
vmap axi_protocol_converter_v2_1_21 activehdl/axi_protocol_converter_v2_1_21

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

vlog -work xpm  -sv2k12 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -sv2k12 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_processing_system7_0_0/sim/mp0_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../hdl/mp0/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../hdl/mp0/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../hdl/mp0/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_23 -93 \
"../../../../hdl/mp0/ipshared/bb35/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mp0/ip/mp0_axi_gpio_0_0/sim/mp0_axi_gpio_0_0.vhd" \
"../../../bd/mp0/ip/mp0_axi_gpio_0_1/sim/mp0_axi_gpio_0_1.vhd" \
"../../../bd/mp0/ip/mp0_axi_gpio_0_2/sim/mp0_axi_gpio_0_2.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../hdl/mp0/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_xbar_0/sim/mp0_xbar_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../hdl/mp0/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mp0/ip/mp0_rst_ps7_0_100M_1/sim/mp0_rst_ps7_0_100M_1.vhd" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/sim/bd_9b48.vhd" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_0/sim/bd_9b48_ila_lib_0.vhd" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_1/bd_9b48_g_inst_0_gigantic_mux.v" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_1/sim/bd_9b48_g_inst_0.v" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_2/sim/bd_9b48_slot_0_aw_0.v" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_3/sim/bd_9b48_slot_0_w_0.v" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_4/sim/bd_9b48_slot_0_b_0.v" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_5/sim/bd_9b48_slot_0_ar_0.v" \
"../../../bd/mp0/ip/mp0_system_ila_0_0/bd_0/ip/ip_6/sim/bd_9b48_slot_0_r_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mp0/ip/mp0_system_ila_0_0/sim/mp0_system_ila_0_0.vhd" \
"../../../bd/mp0/sim/mp0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../hdl/mp0/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../hdl/mp0/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_13 -93 \
"../../../../hdl/mp0/ipshared/af67/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../hdl/mp0/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_23 -93 \
"../../../../hdl/mp0/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_9  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/7af1/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_9 -93 \
"../../../../hdl/mp0/ipshared/7af1/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mp0/ip/mp0_axi_vdma_0_0/sim/mp0_axi_vdma_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1_clk_wiz.v" \
"../../../bd/mp0/ip/mp0_clk_wiz_0_1/mp0_clk_wiz_0_1.v" \

vlog -work axi_protocol_converter_v2_1_21  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../hdl/mp0/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdl/mp0/ipshared/ec67/hdl" "+incdir+../../../../hdl/mp0/ipshared/6b56/hdl" "+incdir+../../../../hdl/mp0/ipshared/7af1/hdl" "+incdir+../../../../hdl/mp0/ipshared/8b3d" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mp0/ip/mp0_auto_pc_0/sim/mp0_auto_pc_0.v" \
"../../../bd/mp0/ip/mp0_auto_pc_1/sim/mp0_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

