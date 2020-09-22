library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port (
        inputBlockPo: in std_logic_vector(0 to 15);
        leftKeyPo: in std_logic_vector(0 to 15);
        outputBlockPo: out std_logic_vector(0 to 15)
        );
    type Consts is array(0 to 255) of integer; 
    
end main;

architecture Behavioral of main is
   
    signal workBlock: std_logic_vector(0 to 15);
    
    signal temp: unsigned(0 to 7);
    signal temp2: unsigned(0 to 7);
    
    signal eightBitBlock: integer;
    signal eightBitBlock2: integer;
    
    signal outInteger: integer;
    signal outInteger2: integer;
    
    signal outUnsigned: unsigned(0 to 7);
    signal outUnsigned2: unsigned(0 to 7);
    
    signal tempLogVec: std_logic_vector(0 to 7);
      
    signal constss: Consts;
    
begin
    constss <= ( 252, 238, 221, 17, 207, 110, 49, 22, 251, 196, 250, 218, 35, 197, 4, 77,
    233, 119, 240, 219, 147, 46, 153, 186, 23, 54, 241, 187, 20, 205, 95, 193,
    249, 24, 101, 90, 226, 92, 239, 33, 129, 28, 60, 66, 139, 1, 142, 79, 5,
    132, 2, 174, 227, 106, 143, 160, 6, 11, 237, 152, 127, 212, 211, 31, 235,
    52, 44, 81, 234, 200, 72, 171, 242, 42, 104, 162, 253, 58, 206, 204, 181,
    112, 14, 86, 8, 12, 118, 18, 191, 114, 19, 71, 156, 183, 93, 135, 21, 161,
    150, 41, 16, 123, 154, 199, 243, 145, 120, 111, 157, 158, 178, 177, 50, 117,
    25, 61, 255, 53, 138, 126, 109, 84, 198, 128, 195, 189, 13, 87, 223, 245,
    36, 169, 62, 168, 67, 201, 215, 121, 214, 246, 124, 34, 185, 3, 224, 15,
    236, 222, 122, 148, 176, 188, 220, 232, 40, 80, 78, 51, 10, 74, 167, 151,
    96, 115, 30, 0, 98, 68, 26, 184, 56, 130, 100, 159, 38, 65, 173, 69, 70,
    146, 39, 94, 85, 47, 140, 163, 165, 125, 105, 213, 149, 59, 7, 88, 179, 64,
    134, 172, 29, 247, 48, 55, 107, 228, 136, 217, 231, 137, 225, 27, 131, 73,
    76, 63, 248, 254, 141, 83, 170, 144, 202, 216, 133, 97, 32, 113, 103, 164,
    45, 43, 9, 91, 203, 155, 37, 208, 190, 229, 108, 82, 89, 166, 116, 210, 230,+
    244, 180, 192, 209, 102, 175, 194, 57, 75, 99, 182);                            
 --  process
   --begin
        workBlock(0) <= InputBlockPo(0) xor leftKeyPo(0);
        workBlock(1) <= InputBlockPo(1) xor leftKeyPo(1);
        workBlock(2) <= InputBlockPo(2) xor leftKeyPo(2);
        workBlock(3) <= InputBlockPo(3) xor leftKeyPo(3);
        workBlock(4) <= InputBlockPo(4) xor leftKeyPo(4);
        workBlock(5) <= InputBlockPo(5) xor leftKeyPo(5);
        workBlock(6) <= InputBlockPo(6) xor leftKeyPo(6);
        workBlock(7) <= InputBlockPo(7) xor leftKeyPo(7);

        
        workBlock(8) <= InputBlockPo(8) xor leftKeyPo(8);
        workBlock(9) <= InputBlockPo(9) xor leftKeyPo(9);
        workBlock(10) <= InputBlockPo(10) xor leftKeyPo(10);
        workBlock(11) <= InputBlockPo(11) xor leftKeyPo(11);
        workBlock(12) <= InputBlockPo(12) xor leftKeyPo(12);
        workBlock(13) <= InputBlockPo(13) xor leftKeyPo(13);
        workBlock(14) <= InputBlockPo(14) xor leftKeyPo(14);
        workBlock(15) <= InputBlockPo(15) xor leftKeyPo(15);
        
        --first block conversion through table
        temp(0) <= workBlock(0);
        temp(1) <= workBlock(1);
        temp(2) <= workBlock(2);
        temp(3) <= workBlock(3);
        temp(4) <= workBlock(4);
        temp(5) <= workBlock(5);
        temp(6) <= workBlock(6);
        temp(7) <= workBlock(7);
        eightBitBlock <= TO_INTEGER(temp(0 to 7));
        outInteger <= constss(eightBitBlock);
        outUnsigned(0 to 7) <= TO_UNSIGNED(outInteger, 8);

        --second block conversion
        temp2(0) <= workBlock(8);
        temp2(1) <= workBlock(9);
        temp2(2) <= workBlock(10);
        temp2(3) <= workBlock(11);
        temp2(4) <= workBlock(12);
        temp2(5) <= workBlock(13);
        temp2(6) <= workBlock(14);
        temp2(7) <= workBlock(15);
        eightBitBlock2 <= TO_INTEGER(temp2(0 to 7));
        --possibly cannot use variable array index
        outInteger2 <= constss(eightBitBlock2);
        outUnsigned2(0 to 7) <= TO_UNSIGNED(outInteger2, 8);
        outputBlockPo(8 to 15) <= std_logic_vector(outUnsigned(0 to 7));

end Behavioral;

