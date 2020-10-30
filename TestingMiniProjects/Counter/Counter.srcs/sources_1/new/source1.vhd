library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
library UNISIM;
use UNISIM.VComponents.all;

entity counter is
    Port (CLK     :   in std_logic;
          rst     :   in std_logic;
          dat_out :   out std_logic_vector(4 downto 0)); 
end counter;

architecture Behavioral of counter is
signal dat : std_logic_vector(4 downto 0);
begin
    Process(CLK)
    Begin
        If (CLK 'event and CLK = '1') then
            If ((rst) = '1') then
                dat <= "00000";
            Else
                dat <= dat + 1;
            End if;
        End if;
     End process;
     dat_out <= dat;
end Behavioral;
