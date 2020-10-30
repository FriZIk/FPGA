library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;-- можем пользоваться своими наработками в проекте
use work.all;
entity counter is
Port (  CLK     :   in std_logic;
        rst     :   in std_logic;
        dat_out :   out std_logic_vector(8 downto 0); 
        mycount :   out std_logic;
        out_zad :   out std_logic;
        Q       :   out std_logic);
end counter;
architecture Behavioral of counter is
component trig_sh 
Port ( c :     in  STD_LOGIC;
       reset : in  STD_LOGIC;
       d :     in  STD_LOGIC;
       q :     out STD_LOGIC);
end component;
signal st : std_logic_vector(8 downto 0);
signal my_data : std_logic;
begin
process(CLK)
begin
if CLK 'event and CLK = '1' then
if (rst) = '1' then
  st <= "000000000";
  my_data <= '0';
  Q <= '0';
else
    if(st) = 127 then
     Q<='1';
     else st <= st + 1;
     Q<='0';
    end if;
     if(st) = 126 then
      my_data  <='1';
     else
      my_data  <='0';
     end if; 
end if;
end if;
end process;
dat_out <= st;
my_data <= st(5);
--out_zad <= my_data;
dd11: entity work.trig_sh(trig_sh) port map(c=>clk, reset=>rst, d=>my_data, q=>out_zad);
-- можно подключить и без явного указания портов, вероятность ошибки выше
mycount <= my_data;
end Behavioral;