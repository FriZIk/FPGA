-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Sep 10 11:36:42 2020
-- Host        : DESKTOP-IO9CP06 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/VIV_PROJECTS/project_MIGALKA/project_MIGALKA.sim/sim_1/synth/func/xsim/simulation_source_func_synth.vhd
-- Design      : main
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main is
  port (
    secBlock : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    leftKey : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    outChannel : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of main : entity is true;
end main;

architecture STRUCTURE of main is
  signal outChannel_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
\leftKey_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(0),
      O => outChannel_OBUF(0)
    );
\leftKey_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(1),
      O => outChannel_OBUF(1)
    );
\leftKey_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(2),
      O => outChannel_OBUF(2)
    );
\leftKey_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(3),
      O => outChannel_OBUF(3)
    );
\leftKey_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(4),
      O => outChannel_OBUF(4)
    );
\leftKey_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(5),
      O => outChannel_OBUF(5)
    );
\leftKey_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(6),
      O => outChannel_OBUF(6)
    );
\leftKey_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => leftKey(7),
      O => outChannel_OBUF(7)
    );
\outChannel_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(0),
      O => outChannel(0)
    );
\outChannel_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(1),
      O => outChannel(1)
    );
\outChannel_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(2),
      O => outChannel(2)
    );
\outChannel_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(3),
      O => outChannel(3)
    );
\outChannel_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(4),
      O => outChannel(4)
    );
\outChannel_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(5),
      O => outChannel(5)
    );
\outChannel_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(6),
      O => outChannel(6)
    );
\outChannel_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => outChannel_OBUF(7),
      O => outChannel(7)
    );
end STRUCTURE;
