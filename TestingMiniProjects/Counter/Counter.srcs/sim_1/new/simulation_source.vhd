library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;


ENTITY test_bench IS
END test_bench;
ARCHITECTURE behavioral OF test_bench IS

component counter
Port (  CLK     :   in std_logic;
        rst     :   in std_logic;
        dat_out :   out std_logic_vector(4 downto 0));
end component;

signal  CLK     :   std_logic;
signal  rst     :   std_logic;
signal  dat_out :   std_logic_vector(4 downto 0); 

begin

UUT: counter PORT MAP(
dat_out => dat_out,
rst => rst,
CLK => CLK);


end behavioral;