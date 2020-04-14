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
-- *** Clock Process for CLK - User Defined Section 1 *** 
constant PERIOD : TIME := 4 ns;
constant DUTY_CYCLE : real := 0.5;
constant OFFSET : time := 3 ns; 
-- *** END Clock Process for CLK - User Defined Section 1 ***
begin
UUT: counter PORT MAP(
dat_out => dat_out,
rst => rst,
CLK => CLK);

-- *** Clock Process for CLK - User Defined Section 2 ***
clk_gen: PROCESS 
BEGIN
WAIT for OFFSET;
CLOCK_LOOP : LOOP
CLK <= '0';
WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
CLK <= '1';
WAIT FOR (PERIOD * DUTY_CYCLE);
END LOOP CLOCK_LOOP;
END PROCESS; 

rst_gen: PROCESS 
BEGIN
WAIT for OFFSET;
rst <='1';
wait for period * DUTY_CYCLE *5;
rst <='0';
wait;
END PROCESS; 
end;
--end Behavioral;