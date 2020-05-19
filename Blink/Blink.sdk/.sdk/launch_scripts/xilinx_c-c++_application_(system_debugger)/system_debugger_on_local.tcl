connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty 210319A288FBA" && level==0} -index 0
fpga -file /home/frizik/MOPEVM/fpga/Blink/Blink.runs/impl_1/system_wrapper.bit
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Arty 210319A288FBA"} -index 0
loadhw /home/frizik/MOPEVM/fpga/Blink/Blink.sdk/system_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Arty 210319A288FBA"} -index 0
rst -system
after 3000
