// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Sep 15 17:14:57 2020
// Host        : DESKTOP-IO9CP06 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/FPGA/KUZNECHIK_TAKE2/KUZNECHIK_TAKE2.sim/sim_1/impl/timing/xsim/SIMULATION_1_time_impl.v
// Design      : main
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "ecca6fc5" *) 
(* NotValidForBitStream *)
module main
   (inputBlock,
    leftKey,
    outputBlock);
  input [0:15]inputBlock;
  input [0:15]leftKey;
  output [0:15]outputBlock;

  wire [0:15]inputBlock;
  wire [12:15]inputBlock_IBUF;
  wire [0:15]leftKey;
  wire [12:15]leftKey_IBUF;
  wire [0:15]outputBlock;
  wire [8:15]outputBlock_OBUF;
  wire [3:2]workBlock;

initial begin
 $sdf_annotate("SIMULATION_1_time_impl.sdf",,,,"tool_control");
end
  IBUF \inputBlock_IBUF[12]_inst 
       (.I(inputBlock[12]),
        .O(inputBlock_IBUF[12]));
  IBUF \inputBlock_IBUF[13]_inst 
       (.I(inputBlock[13]),
        .O(inputBlock_IBUF[13]));
  IBUF \inputBlock_IBUF[14]_inst 
       (.I(inputBlock[14]),
        .O(inputBlock_IBUF[14]));
  IBUF \inputBlock_IBUF[15]_inst 
       (.I(inputBlock[15]),
        .O(inputBlock_IBUF[15]));
  IBUF \leftKey_IBUF[12]_inst 
       (.I(leftKey[12]),
        .O(leftKey_IBUF[12]));
  IBUF \leftKey_IBUF[13]_inst 
       (.I(leftKey[13]),
        .O(leftKey_IBUF[13]));
  IBUF \leftKey_IBUF[14]_inst 
       (.I(leftKey[14]),
        .O(leftKey_IBUF[14]));
  IBUF \leftKey_IBUF[15]_inst 
       (.I(leftKey[15]),
        .O(leftKey_IBUF[15]));
  OBUF \outputBlock_OBUF[0]_inst 
       (.I(outputBlock_OBUF[8]),
        .O(outputBlock[0]));
  LUT6 #(
    .INIT(64'h7337B22BB22B7337)) 
    \outputBlock_OBUF[0]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(inputBlock_IBUF[14]),
        .I3(leftKey_IBUF[14]),
        .I4(inputBlock_IBUF[15]),
        .I5(leftKey_IBUF[15]),
        .O(outputBlock_OBUF[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \outputBlock_OBUF[0]_inst_i_2 
       (.I0(leftKey_IBUF[12]),
        .I1(inputBlock_IBUF[12]),
        .O(workBlock[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \outputBlock_OBUF[0]_inst_i_3 
       (.I0(leftKey_IBUF[13]),
        .I1(inputBlock_IBUF[13]),
        .O(workBlock[2]));
  OBUF \outputBlock_OBUF[10]_inst 
       (.I(outputBlock_OBUF[10]),
        .O(outputBlock[10]));
  OBUF \outputBlock_OBUF[11]_inst 
       (.I(outputBlock_OBUF[11]),
        .O(outputBlock[11]));
  OBUF \outputBlock_OBUF[12]_inst 
       (.I(outputBlock_OBUF[12]),
        .O(outputBlock[12]));
  OBUF \outputBlock_OBUF[13]_inst 
       (.I(outputBlock_OBUF[13]),
        .O(outputBlock[13]));
  OBUF \outputBlock_OBUF[14]_inst 
       (.I(outputBlock_OBUF[14]),
        .O(outputBlock[14]));
  OBUF \outputBlock_OBUF[15]_inst 
       (.I(outputBlock_OBUF[15]),
        .O(outputBlock[15]));
  OBUF \outputBlock_OBUF[1]_inst 
       (.I(outputBlock_OBUF[9]),
        .O(outputBlock[1]));
  LUT6 #(
    .INIT(64'h7337FAAFFAAF7337)) 
    \outputBlock_OBUF[1]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(inputBlock_IBUF[14]),
        .I3(leftKey_IBUF[14]),
        .I4(inputBlock_IBUF[15]),
        .I5(leftKey_IBUF[15]),
        .O(outputBlock_OBUF[9]));
  OBUF \outputBlock_OBUF[2]_inst 
       (.I(outputBlock_OBUF[10]),
        .O(outputBlock[2]));
  LUT6 #(
    .INIT(64'h96D74182418296D7)) 
    \outputBlock_OBUF[2]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(inputBlock_IBUF[15]),
        .I2(leftKey_IBUF[15]),
        .I3(workBlock[2]),
        .I4(inputBlock_IBUF[14]),
        .I5(leftKey_IBUF[14]),
        .O(outputBlock_OBUF[10]));
  OBUF \outputBlock_OBUF[3]_inst 
       (.I(outputBlock_OBUF[11]),
        .O(outputBlock[3]));
  LUT6 #(
    .INIT(64'h3773077007703773)) 
    \outputBlock_OBUF[3]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(leftKey_IBUF[14]),
        .I3(inputBlock_IBUF[14]),
        .I4(leftKey_IBUF[15]),
        .I5(inputBlock_IBUF[15]),
        .O(outputBlock_OBUF[11]));
  OBUF \outputBlock_OBUF[4]_inst 
       (.I(outputBlock_OBUF[12]),
        .O(outputBlock[4]));
  LUT6 #(
    .INIT(64'h73375AA55AA57337)) 
    \outputBlock_OBUF[4]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(inputBlock_IBUF[14]),
        .I3(leftKey_IBUF[14]),
        .I4(inputBlock_IBUF[15]),
        .I5(leftKey_IBUF[15]),
        .O(outputBlock_OBUF[12]));
  OBUF \outputBlock_OBUF[5]_inst 
       (.I(outputBlock_OBUF[13]),
        .O(outputBlock[5]));
  LUT6 #(
    .INIT(64'h5995FCCFFCCF5995)) 
    \outputBlock_OBUF[5]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(inputBlock_IBUF[14]),
        .I3(leftKey_IBUF[14]),
        .I4(inputBlock_IBUF[15]),
        .I5(leftKey_IBUF[15]),
        .O(outputBlock_OBUF[13]));
  OBUF \outputBlock_OBUF[6]_inst 
       (.I(outputBlock_OBUF[14]),
        .O(outputBlock[6]));
  LUT6 #(
    .INIT(64'hE55E26622662E55E)) 
    \outputBlock_OBUF[6]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(workBlock[2]),
        .I2(inputBlock_IBUF[15]),
        .I3(leftKey_IBUF[15]),
        .I4(inputBlock_IBUF[14]),
        .I5(leftKey_IBUF[14]),
        .O(outputBlock_OBUF[14]));
  OBUF \outputBlock_OBUF[7]_inst 
       (.I(outputBlock_OBUF[15]),
        .O(outputBlock[7]));
  LUT6 #(
    .INIT(64'hEB8269556955EB82)) 
    \outputBlock_OBUF[7]_inst_i_1 
       (.I0(workBlock[3]),
        .I1(inputBlock_IBUF[15]),
        .I2(leftKey_IBUF[15]),
        .I3(workBlock[2]),
        .I4(leftKey_IBUF[14]),
        .I5(inputBlock_IBUF[14]),
        .O(outputBlock_OBUF[15]));
  OBUF \outputBlock_OBUF[8]_inst 
       (.I(outputBlock_OBUF[8]),
        .O(outputBlock[8]));
  OBUF \outputBlock_OBUF[9]_inst 
       (.I(outputBlock_OBUF[9]),
        .O(outputBlock[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
