library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.x.all;

package l is
    function funcL(l:std_logic_vector(0 to 128)) return std_logic_vector;
end l;

package body l is
    function funcL(l:std_logic_vector(0 to 128)) return std_logic_vector is
    
    type eightBit is array (0 to 15) of std_logic_vector(0 to 7);
    type coefArr is array (0 to 15) of integer;
    
    variable tmp: eightBit;
    variable sum: std_logic_vector(0 to 7);
    variable kBi: coefArr := (148, 32, 133, 16, 194, 192, 1, 251, 1, 192, 194, 16, 133, 32, 148, 1);
    --MOIA KUKUHA NACHINAET ULETAT
    begin
    --copy from input to working array
        for i in 0 to 15 loop --It is Lfunc loop here we just execute R 16 times and nothing else\/
            for j in 0 to 15 loop--Its Rfunc loop an here we shift and xor all 8 bit parts (our 16 blocks)
                --Got to xor a block shifted 1bit(*256) added to round key(kB(kuz_lvec)), which then replaced via polinomial table(multTable)
                
            end loop;
            --Here we are shifting all blocks to the 0's block\/
            --kinda yadayada(1 to 15) := yadayada(0 to 14)\/
            --yadayada(0) := THING YOU DID IN J LOOP \/
        end loop;
    --copy back to output
    end;
end l;