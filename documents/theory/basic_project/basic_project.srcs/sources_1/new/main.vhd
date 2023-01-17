----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2019 09:33:21
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           e : out STD_LOGIC);
end main;

architecture Behavioral of main is
signal axorb, cxord, ee: STD_LOGIC;
begin
axorb <= a xor b;
cxord <= c xor d;
ee <= axorb xor cxord;
 process (clk)
  begin
   if CLK 'event and CLK = '1' then
	e <= ee;
   end if;
 end process;
end Behavioral;
