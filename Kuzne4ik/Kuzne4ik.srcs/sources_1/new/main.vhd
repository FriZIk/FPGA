library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
library UNISIM;
use UNISIM.VComponents.all;

use work.x.all;  -- Функция X-преобразования, побитовый xor  с раундовым ключом
use work.s.all;  -- Функция S-преобразования, нелинейное биективное преобразование (замена одних переменных на другие)

entity main is
    Port (
        CLK : in std_logic;
        SecBlock : inout std_logic_vector (128 downto 0);
        left_key : inout std_logic_vector (128 downto 0);
        right_key : inout std_logic_vector (128 downto 0);
        rst : in std_logic);
end main;

architecture Behavioral of main is
begin
    SecBlock <= funcX(SecBlock);
    SecBlock <= funcS(SecBlock);     
end Behavioral;
