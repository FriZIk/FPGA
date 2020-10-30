
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
library UNISIM;
use UNISIM.VComponents.all;
entity fanout is
Port(    CLK1_DD1_P  :in STD_LOGIC;
         CLK1_DD1_N  :in STD_LOGIC;
         dat_out :   out std_logic_vector(8 downto 0);
         q         :out STD_LOGIC);
         end Fanout;
         architecture data_flow of fanout is
         signal st : std_logic_vector(8 downto 0); 
         signal clk : STD_LOGIC;
         begin-- LVDS input to internal single
  CLK_IBUFDS : IBUFDS
  generic map (
    IOSTANDARD =>"DEFAULT")
    port map (
    I  => CLK1_DD1_N,
    IB => CLK1_DD1_P,
    O  => clk );
 -- LVDS input to internal single
    process(CLK)
    begin
    if CLK 'event and CLK = '1' then
        if(st) = 127 then
         Q<='1';
         else st <= st + 1;
         Q<='0';
        end if;
    end if;
    end process;
    dat_out <= st; 
 end data_flow; 