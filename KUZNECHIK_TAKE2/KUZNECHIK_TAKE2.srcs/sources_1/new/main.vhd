library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  Port (
    inputBlock: in std_logic_vector(127 downto 0);
            leftKey: in std_logic_vector(127 downto 0);
            outputBlock: out std_logic_vector(127 downto 0)
            );
end main;

architecture Behavioral of main is

    --signal inputBlock: std_logic_vector(127 downto 0);
   -- signal rightKey: std_logic_vector(127 downto 0);
   -- signal leftKey: std_logic_vector(127 downto 0);
   -- signal outputBlock: std_logic_vector(127 downto 0);
    
begin
        outputBlock <= inputBlock xor leftKey;
end Behavioral;
