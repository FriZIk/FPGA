--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.3 (lin64) Build 1682563 Mon Oct 10 19:07:26 MDT 2016
--Date        : Wed Feb 19 21:11:02 2020
--Host        : frizik running 64-bit Arch Linux
--Command     : generate_target system_wrapper.bd
--Design      : system_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_wrapper is
  port (
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end system_wrapper;

architecture STRUCTURE of system_wrapper is
  component system is
  port (
    clk_in1 : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC
  );
  end component system;
begin
system_i: component system
     port map (
      UART_rxd => UART_rxd,
      UART_txd => UART_txd,
      clk_in1 => clk_in1,
      gpio_io_o(0) => gpio_io_o(0)
    );
end STRUCTURE;
