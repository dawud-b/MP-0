connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248AA38DA" && level==0 && jtag_device_ctx=="jsn-Zed-210248AA38DA-23727093-0"}
fpga -file C:/Users/zfsalti/488/MP-0/sw/wkspace/MP0_Design2/_ide/bitstream/mp0_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/zfsalti/488/MP-0/sw/wkspace/mp0_wrapper/export/mp0_wrapper/hw/mp0_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/zfsalti/488/MP-0/sw/wkspace/MP0_Design2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/zfsalti/488/MP-0/sw/wkspace/MP0_Design2/Debug/MP0_Design2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
