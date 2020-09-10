#set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }];

set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { outChannel  }]; #IO_L16P_T2_CSI_B_14          Sch=ck_io[0]

#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { secBlock }]; #IO_L19N_T3_A09_D25_VREF_14 	Sch=ck_io[26]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { leftKey  }]; #IO_L18P_T2_A12_D28_14        Sch=ck_io[1]
