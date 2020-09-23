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
    signal tempL: unsigned(0 to 7);
    signal tempL2: unsigned(0 to 7);
    signal tempMult: unsigned(0 to 7);
    signal lOutput: unsigned(0 to 15);
    
    signal eightBitBlock: integer;
    signal eightBitBlock2: integer;
    
    signal outInteger: integer;
    signal outInteger2: integer;
    
    signal outUnsigned: unsigned(0 to 7);
    signal outUnsigned2: unsigned(0 to 7);
    
    signal tempLogVec: std_logic_vector(0 to 7);
      
    signal constss: Consts;
    
begin
    constss <= (252, 238, 221, 17, 207, 110, 49, 22, 251, 196, 250, 218, 35, 197, 4, 77,
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
    45, 43, 9, 91, 203, 155, 37, 208, 190, 229, 108, 82, 89, 166, 116, 210, 230,
    244, 180, 192, 209, 102, 175, 194, 57, 75, 99, 182);                            

   	--THAT IS X FUNCTION
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
    --END X FUNCTION  


    --THAT IS S FUNCTION   
        --first block conversion through table
        --why dont we just convert pieces of workblock??
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

        --possibly cannot use variable array index
        	--shity solution probobly needs some more work
        eightBitBlock2 <= TO_INTEGER(temp2(0 to 7));
        outInteger2 <= constss(eightBitBlock2);
        outUnsigned2(0 to 7) <= TO_UNSIGNED(outInteger2, 8);
        ----outputBlockPo(8 to 15) <= std_logic_vector(outUnsigned(0 to 7));
    --END S FUNCTION

        
    --THAT IS L FUNCTION PROTOTYPE
    	--TODO copy this part for first block
      	--THIS MEANS MULTIPLYING BY 1001 0100 (148)
		tempL(0) <= outUnsigned(0) xor '1';
		tempL(1) <= outUnsigned(1) xor '0';	
		tempL(2) <= outUnsigned(2) xor '0';
		tempL(3) <= outUnsigned(3) xor '1';
		tempL(4) <= outUnsigned(4) xor '0';
		tempL(5) <= outUnsigned(5) xor '1';
		tempL(6) <= outUnsigned(6) xor '0';
		tempL(7) <= outUnsigned(7) xor '0';

		--THIS MEANS MULTIPLYING BY 32
        tempL2(0) <= outUnsigned2(0)  xor '0';
		tempL2(1) <= outUnsigned2(1)  xor '0';	
		tempL2(2) <= outUnsigned2(2) xor '0';
		tempL2(3) <= outUnsigned2(3) xor '0';
		tempL2(4) <= outUnsigned2(4) xor '0';
		tempL2(5) <= outUnsigned2(5) xor '1';
		tempL2(6) <= outUnsigned2(6) xor '0';
		tempL2(7) <= outUnsigned2(7) xor '0';
		
		--myltiplying parts together
		tempMult(0) <= tempL2(0) xor tempL(0); 
		tempMult(1) <= tempL2(1) xor tempL(1);
		tempMult(2) <= tempL2(2) xor tempL(2);
		tempMult(3) <= tempL2(3) xor tempL(3);
		tempMult(4) <= tempL2(4) xor tempL(4);
		tempMult(5) <= tempL2(5) xor tempL(5);
		tempMult(6) <= tempL2(6) xor tempL(6);
		tempMult(7) <= tempL2(7) xor tempL(7);

		--TEMP2 <= TEMP1; TEMP1 <= TEMPMULT
		lOutput(0)  <= tempMult(0);
		lOutput(1)  <= tempMult(1);
		lOutput(2)  <= tempMult(2);
		lOutput(3)  <= tempMult(3);
		lOutput(4)  <= tempMult(4);
		lOutput(5)  <= tempMult(5);
		lOutput(6)  <= tempMult(6);
		lOutput(7)  <= tempMult(7);
		lOutput(8)  <= tempL(0);
		lOutput(9)  <= tempL(1);
		lOutput(10) <= tempL(2);
		lOutput(11) <= tempL(3);
		lOutput(12) <= tempL(4);
		lOutput(13) <= tempL(5);
		lOutput(14) <= tempL(6);
 		lOutput(15) <= tempL(7);

 		outputBlockPo(0) <= lOutput(0);
 		outputBlockPo(1) <= lOutput(1);
 		outputBlockPo(2) <= lOutput(2);
 		outputBlockPo(3) <= lOutput(3);
 		outputBlockPo(4) <= lOutput(4);
 		outputBlockPo(5) <= lOutput(5);
 		outputBlockPo(6) <= lOutput(6);
 		outputBlockPo(7) <= lOutput(7);
 		outputBlockPo(8) <= lOutput(8);
 		outputBlockPo(9) <= lOutput(9);
 		outputBlockPo(10) <= lOutput(10);
 		outputBlockPo(11) <= lOutput(11);
 		outputBlockPo(12) <= lOutput(12);
 		outputBlockPo(13) <= lOutput(13);
 		outputBlockPo(14) <= lOutput(14);
 		outputBlockPo(15) <= lOutput(15);
 	--END L FUNCTION
end Behavioral;

