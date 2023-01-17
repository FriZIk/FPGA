-- Vhdl test bench created from schematic D:\Kasarkin\Library\Lib_US\common\synchro_2ds_test_comp.sch - Mon Oct 19 17:56:16 2015
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY testbench IS
END testbench;
ARCHITECTURE behavorial OF 
testbench IS

COMPONENT main
Port ( clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           e : out STD_LOGIC);
END COMPONENT;
signal clk :std_logic;
signal a :STD_LOGIC;
signal b :STD_LOGIC;
signal c :STD_LOGIC;
signal d :STD_LOGIC;
signal e :STD_LOGIC;

--SIGNAL RND : STD_LOGIC_VECTOR (31 DOWNTO 0):=X"00000000";


-- *** Clock Process for CLK - User Defined Section 1 *** 
constant PERIOD : TIME := 10 ns;
constant DUTY_CYCLE : real := 0.5;
constant OFFSET : time := 3 ns; 
-- *** END Clock Process for CLK - User Defined Section 1 ***

BEGIN

UUT: main PORT MAP(
CLK => CLK, 
a => a,
b => b,
c => c,
d => d,
e => e 
);


--- *** Clock Process for CLK - User Defined Section 2 ***
clk_gen: PROCESS 
BEGIN
WAIT for OFFSET;
CLOCK_LOOP : LOOP
CLK <= '1';
WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
CLK <= '0';
WAIT FOR (PERIOD * DUTY_CYCLE);
END LOOP CLOCK_LOOP;
END PROCESS; 

--- *** END Clock Process for CLK - User Defined Section 2 ***

a_gen : PROCESS
BEGIN
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
a <= '1'; WAIT FOR PERIOD*2;
a <= '0'; WAIT FOR PERIOD*2;
WAIT; -- will wait forever
END PROCESS;

b_gen : PROCESS
BEGIN
b <= '0'; WAIT FOR PERIOD *4;
b <= '1'; WAIT FOR PERIOD *4;
b <= '0'; WAIT FOR PERIOD *4;
b <= '1'; WAIT FOR PERIOD *4;
b <= '0'; WAIT FOR PERIOD *4;
b <= '1'; WAIT FOR PERIOD *4;
b <= '0'; WAIT FOR PERIOD *4;
b <= '1'; WAIT FOR PERIOD *4;
WAIT; -- will wait forever
END PROCESS;

a2_gen : PROCESS
BEGIN
c <= '0'; WAIT FOR PERIOD *8;
c <= '1'; WAIT FOR PERIOD *8;
c <= '0'; WAIT FOR PERIOD *8;
c <= '1'; WAIT FOR PERIOD *8;


WAIT; -- will wait forever
END PROCESS;

d_gen : PROCESS
BEGIN
d <= '1'; WAIT FOR PERIOD*16;
d <= '0'; WAIT FOR PERIOD*16;
WAIT; -- will wait forever
END PROCESS;


END;