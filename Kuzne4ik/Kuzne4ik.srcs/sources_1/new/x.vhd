library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
--library UNISIM;
--use UNISIM.VComponents.all;

package x is
    function funcX(x:std_logic_vector) return std_logic_vector;
end x;

package body x is
    function funcX(x:std_logic_vector) return std_logic_vector is
    
    variable input_block : std_logic_vector(128 downto 0);
    variable key_right : std_logic_vector(128 downto 0);
    variable key_left : std_logic_vector(128 downto 0);
    
    begin
        input_block := input_block xor key_left;
        return input_block;
    end;
end x;