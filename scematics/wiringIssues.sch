# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new main work:main:NOFILE -nosplit
load symbol RTL_ROM work GEN pinBus A input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_ROM0 work GEN pin O output.right pinBus A input.left [7:0] fillcolor 1
load symbol RTL_LATCH work GEN pin G input.left pinBus D input.left [7:0] pinBus Q output.right [7:0] fillcolor 1
load symbol RTL_XOR18 work XOR pin I0 input pin I1 input pin O output fillcolor 1
load portBus inputBlockPo input [0:15] -attr @name inputBlockPo[0:15] -pg 1 -lvl 0 -x 0 -y 30
load portBus leftKeyPo input [0:15] -attr @name leftKeyPo[0:15] -pg 1 -lvl 0 -x 0 -y 50
load portBus outputBlockPo output [0:15] -attr @name outputBlockPo[0:15] -pg 1 -lvl 6 -x 1110 -y 440
load inst outUnsigned2_i RTL_ROM work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[7:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 2 -x 310 -y 700
load inst outUnsigned2_i__0 RTL_ROM0 work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[7:0] -pg 1 -lvl 2 -x 310 -y 610
load inst outUnsigned2_reg RTL_LATCH work -attr @cell(#000000) RTL_LATCH -pinBusAttr D @name D[7:0] -pinBusAttr Q @name Q[7:0] -pg 1 -lvl 3 -x 500 -y 620
load inst outUnsigned_i RTL_ROM work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[7:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -x 500 -y 520
load inst outUnsigned_i__0 RTL_ROM0 work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[7:0] -pg 1 -lvl 3 -x 500 -y 430
load inst outUnsigned_reg RTL_LATCH work -attr @cell(#000000) RTL_LATCH -pinBusAttr D @name D[7:0] -pinBusAttr Q @name Q[7:0] -pg 1 -lvl 4 -x 710 -y 470
load inst tempL2_2_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 4 -x 710 -y 570
load inst tempL_2_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 740
load inst tempL_4_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 810
load inst tempL_7_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 880
load inst tempMult_0_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 440
load inst tempMult_1_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 510
load inst tempMult_2_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 580
load inst tempMult_3_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 650
load inst tempMult_4_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 950
load inst tempMult_5_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 1020
load inst tempMult_6_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 1120
load inst tempMult_7_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 5 -x 960 -y 1190
load inst workBlock_0_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 40
load inst workBlock_10_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 180
load inst workBlock_11_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 250
load inst workBlock_12_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 320
load inst workBlock_13_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 390
load inst workBlock_14_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 460
load inst workBlock_15_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 530
load inst workBlock_1_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 110
load inst workBlock_2_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 180
load inst workBlock_3_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 250
load inst workBlock_4_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 320
load inst workBlock_5_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 390
load inst workBlock_6_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 460
load inst workBlock_7_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 1 -x 90 -y 560
load inst workBlock_8_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 40
load inst workBlock_9_i RTL_XOR18 work -attr @cell(#000000) RTL_XOR -pg 1 -lvl 2 -x 310 -y 110
load net <const1> -power -pin tempL2_2_i I1 -pin tempL_2_i I1 -pin tempL_4_i I1 -pin tempL_7_i I1
load net inputBlockPo[0] -attr @rip(#000000) inputBlockPo[0] -port inputBlockPo[0] -pin workBlock_15_i I0
load net inputBlockPo[10] -attr @rip(#000000) inputBlockPo[10] -port inputBlockPo[10] -pin workBlock_5_i I0
load net inputBlockPo[11] -attr @rip(#000000) inputBlockPo[11] -port inputBlockPo[11] -pin workBlock_4_i I0
load net inputBlockPo[12] -attr @rip(#000000) inputBlockPo[12] -port inputBlockPo[12] -pin workBlock_3_i I0
load net inputBlockPo[13] -attr @rip(#000000) inputBlockPo[13] -port inputBlockPo[13] -pin workBlock_2_i I0
load net inputBlockPo[14] -attr @rip(#000000) inputBlockPo[14] -port inputBlockPo[14] -pin workBlock_1_i I0
load net inputBlockPo[15] -attr @rip(#000000) inputBlockPo[15] -port inputBlockPo[15] -pin workBlock_0_i I0
load net inputBlockPo[1] -attr @rip(#000000) inputBlockPo[1] -port inputBlockPo[1] -pin workBlock_14_i I0
load net inputBlockPo[2] -attr @rip(#000000) inputBlockPo[2] -port inputBlockPo[2] -pin workBlock_13_i I0
load net inputBlockPo[3] -attr @rip(#000000) inputBlockPo[3] -port inputBlockPo[3] -pin workBlock_12_i I0
load net inputBlockPo[4] -attr @rip(#000000) inputBlockPo[4] -port inputBlockPo[4] -pin workBlock_11_i I0
load net inputBlockPo[5] -attr @rip(#000000) inputBlockPo[5] -port inputBlockPo[5] -pin workBlock_10_i I0
load net inputBlockPo[6] -attr @rip(#000000) inputBlockPo[6] -port inputBlockPo[6] -pin workBlock_9_i I0
load net inputBlockPo[7] -attr @rip(#000000) inputBlockPo[7] -port inputBlockPo[7] -pin workBlock_8_i I0
load net inputBlockPo[8] -attr @rip(#000000) inputBlockPo[8] -port inputBlockPo[8] -pin workBlock_7_i I0
load net inputBlockPo[9] -attr @rip(#000000) inputBlockPo[9] -port inputBlockPo[9] -pin workBlock_6_i I0
load net leftKeyPo[0] -attr @rip(#000000) leftKeyPo[0] -port leftKeyPo[0] -pin workBlock_15_i I1
load net leftKeyPo[10] -attr @rip(#000000) leftKeyPo[10] -port leftKeyPo[10] -pin workBlock_5_i I1
load net leftKeyPo[11] -attr @rip(#000000) leftKeyPo[11] -port leftKeyPo[11] -pin workBlock_4_i I1
load net leftKeyPo[12] -attr @rip(#000000) leftKeyPo[12] -port leftKeyPo[12] -pin workBlock_3_i I1
load net leftKeyPo[13] -attr @rip(#000000) leftKeyPo[13] -port leftKeyPo[13] -pin workBlock_2_i I1
load net leftKeyPo[14] -attr @rip(#000000) leftKeyPo[14] -port leftKeyPo[14] -pin workBlock_1_i I1
load net leftKeyPo[15] -attr @rip(#000000) leftKeyPo[15] -port leftKeyPo[15] -pin workBlock_0_i I1
load net leftKeyPo[1] -attr @rip(#000000) leftKeyPo[1] -port leftKeyPo[1] -pin workBlock_14_i I1
load net leftKeyPo[2] -attr @rip(#000000) leftKeyPo[2] -port leftKeyPo[2] -pin workBlock_13_i I1
load net leftKeyPo[3] -attr @rip(#000000) leftKeyPo[3] -port leftKeyPo[3] -pin workBlock_12_i I1
load net leftKeyPo[4] -attr @rip(#000000) leftKeyPo[4] -port leftKeyPo[4] -pin workBlock_11_i I1
load net leftKeyPo[5] -attr @rip(#000000) leftKeyPo[5] -port leftKeyPo[5] -pin workBlock_10_i I1
load net leftKeyPo[6] -attr @rip(#000000) leftKeyPo[6] -port leftKeyPo[6] -pin workBlock_9_i I1
load net leftKeyPo[7] -attr @rip(#000000) leftKeyPo[7] -port leftKeyPo[7] -pin workBlock_8_i I1
load net leftKeyPo[8] -attr @rip(#000000) leftKeyPo[8] -port leftKeyPo[8] -pin workBlock_7_i I1
load net leftKeyPo[9] -attr @rip(#000000) leftKeyPo[9] -port leftKeyPo[9] -pin workBlock_6_i I1
load net outUnsigned2_i__0_n_0 -pin outUnsigned2_i__0 O -pin outUnsigned2_reg G
netloc outUnsigned2_i__0_n_0 1 2 1 N 610
load net outUnsigned2_i_n_0 -attr @rip(#000000) O[7] -pin outUnsigned2_i O[7] -pin outUnsigned2_reg D[7]
load net outUnsigned2_i_n_1 -attr @rip(#000000) O[6] -pin outUnsigned2_i O[6] -pin outUnsigned2_reg D[6]
load net outUnsigned2_i_n_2 -attr @rip(#000000) O[5] -pin outUnsigned2_i O[5] -pin outUnsigned2_reg D[5]
load net outUnsigned2_i_n_3 -attr @rip(#000000) O[4] -pin outUnsigned2_i O[4] -pin outUnsigned2_reg D[4]
load net outUnsigned2_i_n_4 -attr @rip(#000000) O[3] -pin outUnsigned2_i O[3] -pin outUnsigned2_reg D[3]
load net outUnsigned2_i_n_5 -attr @rip(#000000) O[2] -pin outUnsigned2_i O[2] -pin outUnsigned2_reg D[2]
load net outUnsigned2_i_n_6 -attr @rip(#000000) O[1] -pin outUnsigned2_i O[1] -pin outUnsigned2_reg D[1]
load net outUnsigned2_i_n_7 -attr @rip(#000000) O[0] -pin outUnsigned2_i O[0] -pin outUnsigned2_reg D[0]
load net outUnsigned[0] -attr @rip(#000000) Q[7] -pin outUnsigned_reg Q[7] -pin tempL_7_i I0
load net outUnsigned[3] -attr @rip(#000000) Q[4] -pin outUnsigned_reg Q[4] -pin tempL_4_i I0
load net outUnsigned[5] -attr @rip(#000000) Q[2] -pin outUnsigned_reg Q[2] -pin tempL_2_i I0
load net outUnsigned__0[0] -attr @rip(#000000) O[0] -pin outUnsigned_i O[0] -pin outUnsigned_reg D[0]
load net outUnsigned__0[1] -attr @rip(#000000) O[1] -pin outUnsigned_i O[1] -pin outUnsigned_reg D[1]
load net outUnsigned__0[2] -attr @rip(#000000) O[2] -pin outUnsigned_i O[2] -pin outUnsigned_reg D[2]
load net outUnsigned__0[3] -attr @rip(#000000) O[3] -pin outUnsigned_i O[3] -pin outUnsigned_reg D[3]
load net outUnsigned__0[4] -attr @rip(#000000) O[4] -pin outUnsigned_i O[4] -pin outUnsigned_reg D[4]
load net outUnsigned__0[5] -attr @rip(#000000) O[5] -pin outUnsigned_i O[5] -pin outUnsigned_reg D[5]
load net outUnsigned__0[6] -attr @rip(#000000) O[6] -pin outUnsigned_i O[6] -pin outUnsigned_reg D[6]
load net outUnsigned__0[7] -attr @rip(#000000) O[7] -pin outUnsigned_i O[7] -pin outUnsigned_reg D[7]
load net outUnsigned_i__0_n_0 -pin outUnsigned_i__0 O -pin outUnsigned_reg G
netloc outUnsigned_i__0_n_0 1 3 1 640 430n
load net outputBlockPo[0] -attr @rip(#000000) 0 -port outputBlockPo[0] -pin tempMult_7_i O
load net outputBlockPo[10] -attr @rip(#000000) Q[5] -pin outUnsigned_reg Q[5] -port outputBlockPo[10] -pin tempMult_5_i I1
load net outputBlockPo[11] -attr @rip(#000000) 11 -port outputBlockPo[11] -pin tempL_4_i O -pin tempMult_4_i I1
load net outputBlockPo[12] -attr @rip(#000000) Q[3] -pin outUnsigned_reg Q[3] -port outputBlockPo[12] -pin tempMult_3_i I1
load net outputBlockPo[13] -attr @rip(#000000) 13 -port outputBlockPo[13] -pin tempL_2_i O -pin tempMult_2_i I1
load net outputBlockPo[14] -attr @rip(#000000) Q[1] -pin outUnsigned_reg Q[1] -port outputBlockPo[14] -pin tempMult_1_i I1
load net outputBlockPo[15] -attr @rip(#000000) Q[0] -pin outUnsigned_reg Q[0] -port outputBlockPo[15] -pin tempMult_0_i I1
load net outputBlockPo[1] -attr @rip(#000000) 1 -port outputBlockPo[1] -pin tempMult_6_i O
load net outputBlockPo[2] -attr @rip(#000000) 2 -port outputBlockPo[2] -pin tempMult_5_i O
load net outputBlockPo[3] -attr @rip(#000000) 3 -port outputBlockPo[3] -pin tempMult_4_i O
load net outputBlockPo[4] -attr @rip(#000000) 4 -port outputBlockPo[4] -pin tempMult_3_i O
load net outputBlockPo[5] -attr @rip(#000000) 5 -port outputBlockPo[5] -pin tempMult_2_i O
load net outputBlockPo[6] -attr @rip(#000000) 6 -port outputBlockPo[6] -pin tempMult_1_i O
load net outputBlockPo[7] -attr @rip(#000000) 7 -port outputBlockPo[7] -pin tempMult_0_i O
load net outputBlockPo[8] -attr @rip(#000000) 8 -port outputBlockPo[8] -pin tempL_7_i O -pin tempMult_7_i I1
load net outputBlockPo[9] -attr @rip(#000000) Q[6] -pin outUnsigned_reg Q[6] -port outputBlockPo[9] -pin tempMult_6_i I1
load net p_0_in -attr @rip(#000000) Q[2] -pin outUnsigned2_reg Q[2] -pin tempL2_2_i I0
load net temp2[0] -attr @rip(#000000) 7 -pin outUnsigned2_i A[7] -pin outUnsigned2_i__0 A[7] -pin workBlock_7_i O
load net temp2[1] -attr @rip(#000000) 6 -pin outUnsigned2_i A[6] -pin outUnsigned2_i__0 A[6] -pin workBlock_6_i O
load net temp2[2] -attr @rip(#000000) 5 -pin outUnsigned2_i A[5] -pin outUnsigned2_i__0 A[5] -pin workBlock_5_i O
load net temp2[3] -attr @rip(#000000) 4 -pin outUnsigned2_i A[4] -pin outUnsigned2_i__0 A[4] -pin workBlock_4_i O
load net temp2[4] -attr @rip(#000000) 3 -pin outUnsigned2_i A[3] -pin outUnsigned2_i__0 A[3] -pin workBlock_3_i O
load net temp2[5] -attr @rip(#000000) 2 -pin outUnsigned2_i A[2] -pin outUnsigned2_i__0 A[2] -pin workBlock_2_i O
load net temp2[6] -attr @rip(#000000) 1 -pin outUnsigned2_i A[1] -pin outUnsigned2_i__0 A[1] -pin workBlock_1_i O
load net temp2[7] -attr @rip(#000000) 0 -pin outUnsigned2_i A[0] -pin outUnsigned2_i__0 A[0] -pin workBlock_0_i O
load net tempL2_0 -attr @rip(#000000) Q[0] -pin outUnsigned2_reg Q[0] -pin tempMult_0_i I0
load net tempL2_1 -attr @rip(#000000) Q[1] -pin outUnsigned2_reg Q[1] -pin tempMult_1_i I0
load net tempL2_2 -pin tempL2_2_i O -pin tempMult_2_i I0
netloc tempL2_2 1 4 1 NJ 570
load net tempL2_3 -attr @rip(#000000) Q[3] -pin outUnsigned2_reg Q[3] -pin tempMult_3_i I0
load net tempL2_4 -attr @rip(#000000) Q[4] -pin outUnsigned2_reg Q[4] -pin tempMult_4_i I0
load net tempL2_5 -attr @rip(#000000) Q[5] -pin outUnsigned2_reg Q[5] -pin tempMult_5_i I0
load net tempL2_6 -attr @rip(#000000) Q[6] -pin outUnsigned2_reg Q[6] -pin tempMult_6_i I0
load net tempL2_7 -attr @rip(#000000) Q[7] -pin outUnsigned2_reg Q[7] -pin tempMult_7_i I0
load net temp[0] -attr @rip(#000000) 7 -pin outUnsigned_i A[7] -pin outUnsigned_i__0 A[7] -pin workBlock_15_i O
load net temp[1] -attr @rip(#000000) 6 -pin outUnsigned_i A[6] -pin outUnsigned_i__0 A[6] -pin workBlock_14_i O
load net temp[2] -attr @rip(#000000) 5 -pin outUnsigned_i A[5] -pin outUnsigned_i__0 A[5] -pin workBlock_13_i O
load net temp[3] -attr @rip(#000000) 4 -pin outUnsigned_i A[4] -pin outUnsigned_i__0 A[4] -pin workBlock_12_i O
load net temp[4] -attr @rip(#000000) 3 -pin outUnsigned_i A[3] -pin outUnsigned_i__0 A[3] -pin workBlock_11_i O
load net temp[5] -attr @rip(#000000) 2 -pin outUnsigned_i A[2] -pin outUnsigned_i__0 A[2] -pin workBlock_10_i O
load net temp[6] -attr @rip(#000000) 1 -pin outUnsigned_i A[1] -pin outUnsigned_i__0 A[1] -pin workBlock_9_i O
load net temp[7] -attr @rip(#000000) 0 -pin outUnsigned_i A[0] -pin outUnsigned_i__0 A[0] -pin workBlock_8_i O
load netBundle @inputBlockPo 16 inputBlockPo[0] inputBlockPo[1] inputBlockPo[2] inputBlockPo[3] inputBlockPo[4] inputBlockPo[5] inputBlockPo[6] inputBlockPo[7] inputBlockPo[8] inputBlockPo[9] inputBlockPo[10] inputBlockPo[11] inputBlockPo[12] inputBlockPo[13] inputBlockPo[14] inputBlockPo[15] -autobundled
netbloc @inputBlockPo 1 0 2 40 510 260
load netBundle @leftKeyPo 16 leftKeyPo[0] leftKeyPo[1] leftKeyPo[2] leftKeyPo[3] leftKeyPo[4] leftKeyPo[5] leftKeyPo[6] leftKeyPo[7] leftKeyPo[8] leftKeyPo[9] leftKeyPo[10] leftKeyPo[11] leftKeyPo[12] leftKeyPo[13] leftKeyPo[14] leftKeyPo[15] -autobundled
netbloc @leftKeyPo 1 0 2 20 610 240
load netBundle @outputBlockPo 16 outputBlockPo[0] outputBlockPo[1] outputBlockPo[2] outputBlockPo[3] outputBlockPo[4] outputBlockPo[5] outputBlockPo[6] outputBlockPo[7] outputBlockPo[8] outputBlockPo[9] outputBlockPo[10] outputBlockPo[11] outputBlockPo[12] outputBlockPo[13] outputBlockPo[14] outputBlockPo[15] -autobundled
netbloc @outputBlockPo 1 4 2 890 1070 1090
load netBundle @outUnsigned2_i_n_ 8 outUnsigned2_i_n_0 outUnsigned2_i_n_1 outUnsigned2_i_n_2 outUnsigned2_i_n_3 outUnsigned2_i_n_4 outUnsigned2_i_n_5 outUnsigned2_i_n_6 outUnsigned2_i_n_7 -autobundled
netbloc @outUnsigned2_i_n_ 1 2 1 450 630n
load netBundle @tempL2_,p_0_in 8 tempL2_7 tempL2_6 tempL2_5 tempL2_4 tempL2_3 p_0_in tempL2_1 tempL2_0 -autobundled
netbloc @tempL2_,p_0_in 1 3 2 640 620 870
load netBundle @outUnsigned__0 8 outUnsigned__0[7] outUnsigned__0[6] outUnsigned__0[5] outUnsigned__0[4] outUnsigned__0[3] outUnsigned__0[2] outUnsigned__0[1] outUnsigned__0[0] -autobundled
netbloc @outUnsigned__0 1 3 1 640 480n
load netBundle @outUnsigned 3 outUnsigned[0] outUnsigned[3] outUnsigned[5] -autobundled
netbloc @outUnsigned 1 4 1 850 470n
load netBundle @temp2 8 temp2[0] temp2[1] temp2[2] temp2[3] temp2[4] temp2[5] temp2[6] temp2[7] -autobundled
netbloc @temp2 1 1 1 220 40n
load netBundle @temp 8 temp[0] temp[1] temp[2] temp[3] temp[4] temp[5] temp[6] temp[7] -autobundled
netbloc @temp 1 2 1 450 40n
levelinfo -pg 1 0 90 310 500 710 960 1110
pagesize -pg 1 -db -bbox -sgen -170 0 1290 1230
show
fullfit
#
# initialize ictrl to current module main work:main:NOFILE
ictrl init topinfo |
