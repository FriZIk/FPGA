	library IEEE, work;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;  
	use IEEE.NUMERIC_STD.ALL;
	use work.ALL;

	entity main is
	    Port (
	        inputBlockPo: in unsigned(0 to 15);
	        keyPo: in unsigned(0 to 31);
	        outputBlockPort: out unsigned(0 to 15);
	        outputKeykPort: out unsigned(0 to 15)
	        );
	    type Consts is array(0 to 255) of integer; 
	    
	end main;

	architecture Behavioral of main is
		signal workBlock: unsigned(0 to 15);
	    
	    signal temp:   unsigned(0 to 7);
	    signal temp2:  unsigned(0 to 7);
	 
	    signal signalForXor:  unsigned(0 to 7);
	    signal signalForXor2: unsigned(0 to 7);

	    signal outUnsigned:  unsigned(0 to 7);
	    signal outUnsignedD: unsigned(0 to 7);

	    signal testCoef1: unsigned(0 to 7);
		signal testCoef2: unsigned(0 to 7);
		signal testCoef1Tab: unsigned(0 to 7);
		signal testCoef2Tab: unsigned(0 to 7);
		signal testKey1: unsigned(0 to 7);
		signal testKey2: unsigned(0 to 7);
		signal coef2Int, intCoef1, intCoef2: integer;

		signal firBlocNoCon: unsigned(0 to 7);
		signal SecBlocNoCon: unsigned(0 to 7);

		signal firBlocCon: unsigned(0 to 7);
		signal SecBlocCon: unsigned(0 to 7);

		signal masterKey1, masterKey2: unsigned(0 to 15);
		--keygen signals
			signal c1, c2,c3, c4, c5, c6, c7, c8: unsigned(0 to 15);

			signal firIterRes, firIterXor,secIterIn: unsigned(0 to 15);
			signal  firIterS1, firIterS2, firIterL1, firIterL2, firIterPow1, firIterPow2, firIterSum1, firIterSum2, firIterNum1, firIterNum2:unsigned(0 to 7);

			signal secIterRes, secIterXor,thirIterIn: unsigned(0 to 15);
			signal  secIterS1, secIterS2, secIterL1, secIterL2, secIterPow1, secIterPow2, secIterSum1, secIterSum2, secIterNum1, secIterNum2:unsigned(0 to 7);

			signal thirIterRes, thirIterXor,fouIterIn: unsigned(0 to 15);
			signal  thirIterS1, thirIterS2, thirIterL1, thirIterL2, thirIterPow1, thirIterPow2, thirIterSum1, thirIterSum2, thirIterNum1, thirIterNum2:unsigned(0 to 7);

			signal fouIterRes,fouIterXor, fifIterIn: unsigned(0 to 15);
			signal  fouIterS1, fouIterS2, fouIterL1, fouIterL2, fouIterPow1, fouIterPow2, fouIterSum1, fouIterSum2, fouIterNum1, fouIterNum2:unsigned(0 to 7);

			signal fifIterRes,fifIterXor, sixIterIn: unsigned(0 to 15);
			signal  fifIterS1, fifIterS2, fifIterL1, fifIterL2, fifIterPow1, fifIterPow2, fifIterSum1, fifIterSum2, fifIterNum1, fifIterNum2:unsigned(0 to 7);

			signal sixIterRes, sixIterXor,sevIterIn: unsigned(0 to 15);
			signal  sixIterS1, sixIterS2, sixIterL1, sixIterL2, sixIterPow1, sixIterPow2, sixIterSum1, sixIterSum2, sixIterNum1, sixIterNum2:unsigned(0 to 7);

			signal sevIterRes,sevIterXor, eigIterIn: unsigned(0 to 15);
			signal  sevIterS1, sevIterS2, sevIterL1, sevIterL2, sevIterPow1, sevIterPow2, sevIterSum1, sevIterSum2, sevIterNum1, sevIterNum2:unsigned(0 to 7);

			signal eigIterRes,eigIterXor, ninIterIn: unsigned(0 to 15);
			signal  eigIterS1, eigIterS2, eigIterL1, eigIterL2, eigIterPow1, eigIterPow2, eigIterSum1, eigIterSum2, eigIterNum1, eigIterNum2:unsigned(0 to 7);

		--text encode signals
			signal secworkBlock, secinputBlockPo, outputBlockNotPo:  unsigned(0 to 15);
	 		signal sectemp, sectemp2, secoutUnsigned, secoutUnsignedD, sectestKey1, sectestKey2, sectestCoef1, sectestCoef1Tab, sectestCoef2,
	 		sectestCoef2Tab, secfirBlocNoCon, secSecBlocNoCon, 
	 		secfirBlocCon, secSecBlocCon:  unsigned(0 to 7); 
	 		signal secoutputBlockPo: unsigned(0 to 15);

	 		signal thirworkBlock, thirinputBlockPo:  unsigned(0 to 15);
	 		signal thirtemp, thirtemp2, thiroutUnsigned,thiroutUnsignedD, thirtestKey1, thirtestKey2, thirtestCoef1, thirtestCoef1Tab, thirtestCoef2,
	 		thirtestCoef2Tab, thirfirBlocNoCon, thirSecBlocNoCon, 
	 		thirfirBlocCon, thirSecBlocCon:  unsigned(0 to 7); 
	 		signal thiroutputBlockPo: unsigned(0 to 15);

	 		signal fouworkBlock, fouinputBlockPo, fououtputBlockPo:  unsigned(0 to 15);
	 	


	 	--замена через таблицу коэфициентов
	    procedure tableShift(signal inputPart: in unsigned(0 to 7); signal result:out unsigned(0 to 7)) is
	    begin
	    	C: case inputPart is
				    	when "11111100" =>
	result(0 to 7) <= b"00000000";
	when "11101110" =>
	result(0 to 7) <= b"00000001";
	when "11011101" =>
	result(0 to 7) <= b"00000010";
	when "00010001" =>
	result(0 to 7) <= b"00000011";
	when "11001111" =>
	result(0 to 7) <= b"00000100";
	when "01101110" =>
	result(0 to 7) <= b"00000101";
	when "00110001" =>
	result(0 to 7) <= b"00000110";
	when "00010110" =>
	result(0 to 7) <= b"00000111";
	when "11111011" =>
	result(0 to 7) <= b"00001000";
	when "11000100" =>
	result(0 to 7) <= b"00001001";
	when "11111010" =>
	result(0 to 7) <= b"00001010";
	when "11011010" =>
	result(0 to 7) <= b"00001011";
	when "00100011" =>
	result(0 to 7) <= b"00001100";
	when "11000101" =>
	result(0 to 7) <= b"00001101";
	when "00000100" =>
	result(0 to 7) <= b"00001110";
	when "01001101" =>
	result(0 to 7) <= b"00001111";
	when "11101001" =>
	result(0 to 7) <= b"00010000";
	when "01110111" =>
	result(0 to 7) <= b"00010001";
	when "11110000" =>
	result(0 to 7) <= b"00010010";
	when "11011011" =>
	result(0 to 7) <= b"00010011";
	when "10010011" =>
	result(0 to 7) <= b"00010100";
	when "00101110" =>
	result(0 to 7) <= b"00010101";
	when "10011001" =>
	result(0 to 7) <= b"00010110";
	when "10111010" =>
	result(0 to 7) <= b"00010111";
	when "00010111" =>
	result(0 to 7) <= b"00011000";
	when "00110110" =>
	result(0 to 7) <= b"00011001";
	when "11110001" =>
	result(0 to 7) <= b"00011010";
	when "10111011" =>
	result(0 to 7) <= b"00011011";
	when "00010100" =>
	result(0 to 7) <= b"00011100";
	when "11001101" =>
	result(0 to 7) <= b"00011101";
	when "01011111" =>
	result(0 to 7) <= b"00011110";
	when "11000001" =>
	result(0 to 7) <= b"00011111";
	when "11111001" =>
	result(0 to 7) <= b"00100000";
	when "00011000" =>
	result(0 to 7) <= b"00100001";
	when "01100101" =>
	result(0 to 7) <= b"00100010";
	when "01011010" =>
	result(0 to 7) <= b"00100011";
	when "11100010" =>
	result(0 to 7) <= b"00100100";
	when "01011100" =>
	result(0 to 7) <= b"00100101";
	when "11101111" =>
	result(0 to 7) <= b"00100110";
	when "00100001" =>
	result(0 to 7) <= b"00100111";
	when "10000001" =>
	result(0 to 7) <= b"00101000";
	when "00011100" =>
	result(0 to 7) <= b"00101001";
	when "00111100" =>
	result(0 to 7) <= b"00101010";
	when "01000010" =>
	result(0 to 7) <= b"00101011";
	when "10001011" =>
	result(0 to 7) <= b"00101100";
	when "00000001" =>
	result(0 to 7) <= b"00101101";
	when "10001110" =>
	result(0 to 7) <= b"00101110";
	when "01001111" =>
	result(0 to 7) <= b"00101111";
	when "00000101" =>
	result(0 to 7) <= b"00110000";
	when "10000100" =>
	result(0 to 7) <= b"00110001";
	when "00000010" =>
	result(0 to 7) <= b"00110010";
	when "10101110" =>
	result(0 to 7) <= b"00110011";
	when "11100011" =>
	result(0 to 7) <= b"00110100";
	when "01101010" =>
	result(0 to 7) <= b"00110101";
	when "10001111" =>
	result(0 to 7) <= b"00110110";
	when "10100000" =>
	result(0 to 7) <= b"00110111";
	when "00000110" =>
	result(0 to 7) <= b"00111000";
	when "00001011" =>
	result(0 to 7) <= b"00111001";
	when "11101101" =>
	result(0 to 7) <= b"00111010";
	when "10011000" =>
	result(0 to 7) <= b"00111011";
	when "01111111" =>
	result(0 to 7) <= b"00111100";
	when "11010100" =>
	result(0 to 7) <= b"00111101";
	when "11010011" =>
	result(0 to 7) <= b"00111110";
	when "00011111" =>
	result(0 to 7) <= b"00111111";
	when "11101011" =>
	result(0 to 7) <= b"01000000";
	when "00110100" =>
	result(0 to 7) <= b"01000001";
	when "00101100" =>
	result(0 to 7) <= b"01000010";
	when "01010001" =>
	result(0 to 7) <= b"01000011";
	when "11101010" =>
	result(0 to 7) <= b"01000100";
	when "11001000" =>
	result(0 to 7) <= b"01000101";
	when "01001000" =>
	result(0 to 7) <= b"01000110";
	when "10101011" =>
	result(0 to 7) <= b"01000111";
	when "11110010" =>
	result(0 to 7) <= b"01001000";
	when "00101010" =>
	result(0 to 7) <= b"01001001";
	when "01101000" =>
	result(0 to 7) <= b"01001010";
	when "10100010" =>
	result(0 to 7) <= b"01001011";
	when "11111101" =>
	result(0 to 7) <= b"01001100";
	when "00111010" =>
	result(0 to 7) <= b"01001101";
	when "11001110" =>
	result(0 to 7) <= b"01001110";
	when "11001100" =>
	result(0 to 7) <= b"01001111";
	when "10110101" =>
	result(0 to 7) <= b"01010000";
	when "01110000" =>
	result(0 to 7) <= b"01010001";
	when "00001110" =>
	result(0 to 7) <= b"01010010";
	when "01010110" =>
	result(0 to 7) <= b"01010011";
	when "00001000" =>
	result(0 to 7) <= b"01010100";
	when "00001100" =>
	result(0 to 7) <= b"01010101";
	when "01110110" =>
	result(0 to 7) <= b"01010110";
	when "00010010" =>
	result(0 to 7) <= b"01010111";
	when "10111111" =>
	result(0 to 7) <= b"01011000";
	when "01110010" =>
	result(0 to 7) <= b"01011001";
	when "00010011" =>
	result(0 to 7) <= b"01011010";
	when "01000111" =>
	result(0 to 7) <= b"01011011";
	when "10011100" =>
	result(0 to 7) <= b"01011100";
	when "10110111" =>
	result(0 to 7) <= b"01011101";
	when "01011101" =>
	result(0 to 7) <= b"01011110";
	when "10000111" =>
	result(0 to 7) <= b"01011111";
	when "00010101" =>
	result(0 to 7) <= b"01100000";
	when "10100001" =>
	result(0 to 7) <= b"01100001";
	when "10010110" =>
	result(0 to 7) <= b"01100010";
	when "00101001" =>
	result(0 to 7) <= b"01100011";
	when "00010000" =>
	result(0 to 7) <= b"01100100";
	when "01111011" =>
	result(0 to 7) <= b"01100101";
	when "10011010" =>
	result(0 to 7) <= b"01100110";
	when "11000111" =>
	result(0 to 7) <= b"01100111";
	when "11110011" =>
	result(0 to 7) <= b"01101000";
	when "10010001" =>
	result(0 to 7) <= b"01101001";
	when "01111000" =>
	result(0 to 7) <= b"01101010";
	when "01101111" =>
	result(0 to 7) <= b"01101011";
	when "10011101" =>
	result(0 to 7) <= b"01101100";
	when "10011110" =>
	result(0 to 7) <= b"01101101";
	when "10110010" =>
	result(0 to 7) <= b"01101110";
	when "10110001" =>
	result(0 to 7) <= b"01101111";
	when "00110010" =>
	result(0 to 7) <= b"01110000";
	when "01110101" =>
	result(0 to 7) <= b"01110001";
	when "00011001" =>
	result(0 to 7) <= b"01110010";
	when "00111101" =>
	result(0 to 7) <= b"01110011";
	when "11111111" =>
	result(0 to 7) <= b"01110100";
	when "00110101" =>
	result(0 to 7) <= b"01110101";
	when "10001010" =>
	result(0 to 7) <= b"01110110";
	when "01111110" =>
	result(0 to 7) <= b"01110111";
	when "01101101" =>
	result(0 to 7) <= b"01111000";
	when "01010100" =>
	result(0 to 7) <= b"01111001";
	when "11000110" =>
	result(0 to 7) <= b"01111010";
	when "10000000" =>
	result(0 to 7) <= b"01111011";
	when "11000011" =>
	result(0 to 7) <= b"01111100";
	when "10111101" =>
	result(0 to 7) <= b"01111101";
	when "00001101" =>
	result(0 to 7) <= b"01111110";
	when "01010111" =>
	result(0 to 7) <= b"01111111";
	when "11011111" =>
	result(0 to 7) <= b"10000000";
	when "11110101" =>
	result(0 to 7) <= b"10000001";
	when "00100100" =>
	result(0 to 7) <= b"10000010";
	when "10101001" =>
	result(0 to 7) <= b"10000011";
	when "00111110" =>
	result(0 to 7) <= b"10000100";
	when "10101000" =>
	result(0 to 7) <= b"10000101";
	when "01000011" =>
	result(0 to 7) <= b"10000110";
	when "11001001" =>
	result(0 to 7) <= b"10000111";
	when "11010111" =>
	result(0 to 7) <= b"10001000";
	when "01111001" =>
	result(0 to 7) <= b"10001001";
	when "11010110" =>
	result(0 to 7) <= b"10001010";
	when "11110110" =>
	result(0 to 7) <= b"10001011";
	when "01111100" =>
	result(0 to 7) <= b"10001100";
	when "00100010" =>
	result(0 to 7) <= b"10001101";
	when "10111001" =>
	result(0 to 7) <= b"10001110";
	when "00000011" =>
	result(0 to 7) <= b"10001111";
	when "11100000" =>
	result(0 to 7) <= b"10010000";
	when "00001111" =>
	result(0 to 7) <= b"10010001";
	when "11101100" =>
	result(0 to 7) <= b"10010010";
	when "11011110" =>
	result(0 to 7) <= b"10010011";
	when "01111010" =>
	result(0 to 7) <= b"10010100";
	when "10010100" =>
	result(0 to 7) <= b"10010101";
	when "10110000" =>
	result(0 to 7) <= b"10010110";
	when "10111100" =>
	result(0 to 7) <= b"10010111";
	when "11011100" =>
	result(0 to 7) <= b"10011000";
	when "11101000" =>
	result(0 to 7) <= b"10011001";
	when "00101000" =>
	result(0 to 7) <= b"10011010";
	when "01010000" =>
	result(0 to 7) <= b"10011011";
	when "01001110" =>
	result(0 to 7) <= b"10011100";
	when "00110011" =>
	result(0 to 7) <= b"10011101";
	when "00001010" =>
	result(0 to 7) <= b"10011110";
	when "01001010" =>
	result(0 to 7) <= b"10011111";
	when "10100111" =>
	result(0 to 7) <= b"10100000";
	when "10010111" =>
	result(0 to 7) <= b"10100001";
	when "01100000" =>
	result(0 to 7) <= b"10100010";
	when "01110011" =>
	result(0 to 7) <= b"10100011";
	when "00011110" =>
	result(0 to 7) <= b"10100100";
	when "00000000" =>
	result(0 to 7) <= b"10100101";
	when "01100010" =>
	result(0 to 7) <= b"10100110";
	when "01000100" =>
	result(0 to 7) <= b"10100111";
	when "00011010" =>
	result(0 to 7) <= b"10101000";
	when "10111000" =>
	result(0 to 7) <= b"10101001";
	when "00111000" =>
	result(0 to 7) <= b"10101010";
	when "10000010" =>
	result(0 to 7) <= b"10101011";
	when "01100100" =>
	result(0 to 7) <= b"10101100";
	when "10011111" =>
	result(0 to 7) <= b"10101101";
	when "00100110" =>
	result(0 to 7) <= b"10101110";
	when "01000001" =>
	result(0 to 7) <= b"10101111";
	when "10101101" =>
	result(0 to 7) <= b"10110000";
	when "01000101" =>
	result(0 to 7) <= b"10110001";
	when "01000110" =>
	result(0 to 7) <= b"10110010";
	when "10010010" =>
	result(0 to 7) <= b"10110011";
	when "00100111" =>
	result(0 to 7) <= b"10110100";
	when "01011110" =>
	result(0 to 7) <= b"10110101";
	when "01010101" =>
	result(0 to 7) <= b"10110110";
	when "00101111" =>
	result(0 to 7) <= b"10110111";
	when "10001100" =>
	result(0 to 7) <= b"10111000";
	when "10100011" =>
	result(0 to 7) <= b"10111001";
	when "10100101" =>
	result(0 to 7) <= b"10111010";
	when "01111101" =>
	result(0 to 7) <= b"10111011";
	when "01101001" =>
	result(0 to 7) <= b"10111100";
	when "11010101" =>
	result(0 to 7) <= b"10111101";
	when "10010101" =>
	result(0 to 7) <= b"10111110";
	when "00111011" =>
	result(0 to 7) <= b"10111111";
	when "00000111" =>
	result(0 to 7) <= b"11000000";
	when "01011000" =>
	result(0 to 7) <= b"11000001";
	when "10110011" =>
	result(0 to 7) <= b"11000010";
	when "01000000" =>
	result(0 to 7) <= b"11000011";
	when "10000110" =>
	result(0 to 7) <= b"11000100";
	when "10101100" =>
	result(0 to 7) <= b"11000101";
	when "00011101" =>
	result(0 to 7) <= b"11000110";
	when "11110111" =>
	result(0 to 7) <= b"11000111";
	when "00110000" =>
	result(0 to 7) <= b"11001000";
	when "00110111" =>
	result(0 to 7) <= b"11001001";
	when "01101011" =>
	result(0 to 7) <= b"11001010";
	when "11100100" =>
	result(0 to 7) <= b"11001011";
	when "10001000" =>
	result(0 to 7) <= b"11001100";
	when "11011001" =>
	result(0 to 7) <= b"11001101";
	when "11100111" =>
	result(0 to 7) <= b"11001110";
	when "10001001" =>
	result(0 to 7) <= b"11001111";
	when "11100001" =>
	result(0 to 7) <= b"11010000";
	when "00011011" =>
	result(0 to 7) <= b"11010001";
	when "10000011" =>
	result(0 to 7) <= b"11010010";
	when "01001001" =>
	result(0 to 7) <= b"11010011";
	when "01001100" =>
	result(0 to 7) <= b"11010100";
	when "00111111" =>
	result(0 to 7) <= b"11010101";
	when "11111000" =>
	result(0 to 7) <= b"11010110";
	when "11111110" =>
	result(0 to 7) <= b"11010111";
	when "10001101" =>
	result(0 to 7) <= b"11011000";
	when "01010011" =>
	result(0 to 7) <= b"11011001";
	when "10101010" =>
	result(0 to 7) <= b"11011010";
	when "10010000" =>
	result(0 to 7) <= b"11011011";
	when "11001010" =>
	result(0 to 7) <= b"11011100";
	when "11011000" =>
	result(0 to 7) <= b"11011101";
	when "10000101" =>
	result(0 to 7) <= b"11011110";
	when "01100001" =>
	result(0 to 7) <= b"11011111";
	when "00100000" =>
	result(0 to 7) <= b"11100000";
	when "01110001" =>
	result(0 to 7) <= b"11100001";
	when "01100111" =>
	result(0 to 7) <= b"11100010";
	when "10100100" =>
	result(0 to 7) <= b"11100011";
	when "00101101" =>
	result(0 to 7) <= b"11100100";
	when "00101011" =>
	result(0 to 7) <= b"11100101";
	when "00001001" =>
	result(0 to 7) <= b"11100110";
	when "01011011" =>
	result(0 to 7) <= b"11100111";
	when "11001011" =>
	result(0 to 7) <= b"11101000";
	when "10011011" =>
	result(0 to 7) <= b"11101001";
	when "00100101" =>
	result(0 to 7) <= b"11101010";
	when "11010000" =>
	result(0 to 7) <= b"11101011";
	when "10111110" =>
	result(0 to 7) <= b"11101100";
	when "11100101" =>
	result(0 to 7) <= b"11101101";
	when "01101100" =>
	result(0 to 7) <= b"11101110";
	when "01010010" =>
	result(0 to 7) <= b"11101111";
	when "01011001" =>
	result(0 to 7) <= b"11110000";
	when "10100110" =>
	result(0 to 7) <= b"11110001";
	when "01110100" =>
	result(0 to 7) <= b"11110010";
	when "11010010" =>
	result(0 to 7) <= b"11110011";
	when "11100110" =>
	result(0 to 7) <= b"11110100";
	when "11110100" =>
	result(0 to 7) <= b"11110101";
	when "10110100" =>
	result(0 to 7) <= b"11110110";
	when "11000000" =>
	result(0 to 7) <= b"11110111";
	when "11010001" =>
	result(0 to 7) <= b"11111000";
	when "01100110" =>
	result(0 to 7) <= b"11111001";
	when "10101111" =>
	result(0 to 7) <= b"11111010";
	when "11000010" =>
	result(0 to 7) <= b"11111011";
	when "00111001" =>
	result(0 to 7) <= b"11111100";
	when "01001011" =>
	result(0 to 7) <= b"11111101";
	when "01100011" =>
	result(0 to 7) <= b"11111110";
	when "10110110" =>
	result(0 to 7) <= b"11111111";

				    when others => null;
				end case C;
	    end tableShift;

	    --перевод в степени полей галуа, используется в полях галлуа
	    --блоки по 8 бит так как масимальное значение в таблице 256
	    procedure numToPower(signal numba: in unsigned(0 to 7); signal result: out unsigned(0 to 7)) is
	    begin
	    	case numba is
		    			when "00000001" =>
	result(0 to 7) <= b"00000000";
	when "00000010" =>
	result(0 to 7) <= b"00000001";
	when "00000100" =>
	result(0 to 7) <= b"00000010";
	when "00001000" =>
	result(0 to 7) <= b"00000011";
	when "00010000" =>
	result(0 to 7) <= b"00000100";
	when "00100000" =>
	result(0 to 7) <= b"00000101";
	when "01000000" =>
	result(0 to 7) <= b"00000110";
	when "10000000" =>
	result(0 to 7) <= b"00000111";
	when "11000011" =>
	result(0 to 7) <= b"00001000";
	when "01000101" =>
	result(0 to 7) <= b"00001001";
	when "10001010" =>
	result(0 to 7) <= b"00001010";
	when "11010111" =>
	result(0 to 7) <= b"00001011";
	when "01101101" =>
	result(0 to 7) <= b"00001100";
	when "11011010" =>
	result(0 to 7) <= b"00001101";
	when "01110111" =>
	result(0 to 7) <= b"00001110";
	when "11101110" =>
	result(0 to 7) <= b"00001111";
	when "00011111" =>
	result(0 to 7) <= b"00010000";
	when "00111110" =>
	result(0 to 7) <= b"00010001";
	when "01111100" =>
	result(0 to 7) <= b"00010010";
	when "11111000" =>
	result(0 to 7) <= b"00010011";
	when "00110011" =>
	result(0 to 7) <= b"00010100";
	when "01100110" =>
	result(0 to 7) <= b"00010101";
	when "11001100" =>
	result(0 to 7) <= b"00010110";
	when "01011011" =>
	result(0 to 7) <= b"00010111";
	when "10110110" =>
	result(0 to 7) <= b"00011000";
	when "10101111" =>
	result(0 to 7) <= b"00011001";
	when "10011101" =>
	result(0 to 7) <= b"00011010";
	when "11111001" =>
	result(0 to 7) <= b"00011011";
	when "00110001" =>
	result(0 to 7) <= b"00011100";
	when "01100010" =>
	result(0 to 7) <= b"00011101";
	when "11000100" =>
	result(0 to 7) <= b"00011110";
	when "01001011" =>
	result(0 to 7) <= b"00011111";
	when "10010110" =>
	result(0 to 7) <= b"00100000";
	when "11101111" =>
	result(0 to 7) <= b"00100001";
	when "00011101" =>
	result(0 to 7) <= b"00100010";
	when "00111010" =>
	result(0 to 7) <= b"00100011";
	when "01110100" =>
	result(0 to 7) <= b"00100100";
	when "11101000" =>
	result(0 to 7) <= b"00100101";
	when "00010011" =>
	result(0 to 7) <= b"00100110";
	when "00100110" =>
	result(0 to 7) <= b"00100111";
	when "01001100" =>
	result(0 to 7) <= b"00101000";
	when "10011000" =>
	result(0 to 7) <= b"00101001";
	when "11110011" =>
	result(0 to 7) <= b"00101010";
	when "00100101" =>
	result(0 to 7) <= b"00101011";
	when "01001010" =>
	result(0 to 7) <= b"00101100";
	when "10010100" =>
	result(0 to 7) <= b"00101101";
	when "11101011" =>
	result(0 to 7) <= b"00101110";
	when "00010101" =>
	result(0 to 7) <= b"00101111";
	when "00101010" =>
	result(0 to 7) <= b"00110000";
	when "01010100" =>
	result(0 to 7) <= b"00110001";
	when "10101000" =>
	result(0 to 7) <= b"00110010";
	when "10010011" =>
	result(0 to 7) <= b"00110011";
	when "11100101" =>
	result(0 to 7) <= b"00110100";
	when "00001001" =>
	result(0 to 7) <= b"00110101";
	when "00010010" =>
	result(0 to 7) <= b"00110110";
	when "00100100" =>
	result(0 to 7) <= b"00110111";
	when "01001000" =>
	result(0 to 7) <= b"00111000";
	when "10010000" =>
	result(0 to 7) <= b"00111001";
	when "11100011" =>
	result(0 to 7) <= b"00111010";
	when "00000101" =>
	result(0 to 7) <= b"00111011";
	when "00001010" =>
	result(0 to 7) <= b"00111100";
	when "00010100" =>
	result(0 to 7) <= b"00111101";
	when "00101000" =>
	result(0 to 7) <= b"00111110";
	when "01010000" =>
	result(0 to 7) <= b"00111111";
	when "10100000" =>
	result(0 to 7) <= b"01000000";
	when "10000011" =>
	result(0 to 7) <= b"01000001";
	when "11000101" =>
	result(0 to 7) <= b"01000010";
	when "01001001" =>
	result(0 to 7) <= b"01000011";
	when "10010010" =>
	result(0 to 7) <= b"01000100";
	when "11100111" =>
	result(0 to 7) <= b"01000101";
	when "00001101" =>
	result(0 to 7) <= b"01000110";
	when "00011010" =>
	result(0 to 7) <= b"01000111";
	when "00110100" =>
	result(0 to 7) <= b"01001000";
	when "01101000" =>
	result(0 to 7) <= b"01001001";
	when "11010000" =>
	result(0 to 7) <= b"01001010";
	when "01100011" =>
	result(0 to 7) <= b"01001011";
	when "11000110" =>
	result(0 to 7) <= b"01001100";
	when "01001111" =>
	result(0 to 7) <= b"01001101";
	when "10011110" =>
	result(0 to 7) <= b"01001110";
	when "11111111" =>
	result(0 to 7) <= b"01001111";
	when "00111101" =>
	result(0 to 7) <= b"01010000";
	when "01111010" =>
	result(0 to 7) <= b"01010001";
	when "11110100" =>
	result(0 to 7) <= b"01010010";
	when "00101011" =>
	result(0 to 7) <= b"01010011";
	when "01010110" =>
	result(0 to 7) <= b"01010100";
	when "10101100" =>
	result(0 to 7) <= b"01010101";
	when "10011011" =>
	result(0 to 7) <= b"01010110";
	when "11110101" =>
	result(0 to 7) <= b"01010111";
	when "00101001" =>
	result(0 to 7) <= b"01011000";
	when "01010010" =>
	result(0 to 7) <= b"01011001";
	when "10100100" =>
	result(0 to 7) <= b"01011010";
	when "10001011" =>
	result(0 to 7) <= b"01011011";
	when "11010101" =>
	result(0 to 7) <= b"01011100";
	when "01101001" =>
	result(0 to 7) <= b"01011101";
	when "11010010" =>
	result(0 to 7) <= b"01011110";
	when "01100111" =>
	result(0 to 7) <= b"01011111";
	when "11001110" =>
	result(0 to 7) <= b"01100000";
	when "01011111" =>
	result(0 to 7) <= b"01100001";
	when "10111110" =>
	result(0 to 7) <= b"01100010";
	when "10111111" =>
	result(0 to 7) <= b"01100011";
	when "10111101" =>
	result(0 to 7) <= b"01100100";
	when "10111001" =>
	result(0 to 7) <= b"01100101";
	when "10110001" =>
	result(0 to 7) <= b"01100110";
	when "10100001" =>
	result(0 to 7) <= b"01100111";
	when "10000001" =>
	result(0 to 7) <= b"01101000";
	when "11000001" =>
	result(0 to 7) <= b"01101001";
	when "01000001" =>
	result(0 to 7) <= b"01101010";
	when "10000010" =>
	result(0 to 7) <= b"01101011";
	when "11000111" =>
	result(0 to 7) <= b"01101100";
	when "01001101" =>
	result(0 to 7) <= b"01101101";
	when "10011010" =>
	result(0 to 7) <= b"01101110";
	when "11110111" =>
	result(0 to 7) <= b"01101111";
	when "00101101" =>
	result(0 to 7) <= b"01110000";
	when "01011010" =>
	result(0 to 7) <= b"01110001";
	when "10110100" =>
	result(0 to 7) <= b"01110010";
	when "10101011" =>
	result(0 to 7) <= b"01110011";
	when "10010101" =>
	result(0 to 7) <= b"01110100";
	when "11101001" =>
	result(0 to 7) <= b"01110101";
	when "00010001" =>
	result(0 to 7) <= b"01110110";
	when "00100010" =>
	result(0 to 7) <= b"01110111";
	when "01000100" =>
	result(0 to 7) <= b"01111000";
	when "10001000" =>
	result(0 to 7) <= b"01111001";
	when "11010011" =>
	result(0 to 7) <= b"01111010";
	when "01100101" =>
	result(0 to 7) <= b"01111011";
	when "11001010" =>
	result(0 to 7) <= b"01111100";
	when "01010111" =>
	result(0 to 7) <= b"01111101";
	when "10101110" =>
	result(0 to 7) <= b"01111110";
	when "10011111" =>
	result(0 to 7) <= b"01111111";
	when "11111101" =>
	result(0 to 7) <= b"10000000";
	when "00111001" =>
	result(0 to 7) <= b"10000001";
	when "01110010" =>
	result(0 to 7) <= b"10000010";
	when "11100100" =>
	result(0 to 7) <= b"10000011";
	when "00001011" =>
	result(0 to 7) <= b"10000100";
	when "00010110" =>
	result(0 to 7) <= b"10000101";
	when "00101100" =>
	result(0 to 7) <= b"10000110";
	when "01011000" =>
	result(0 to 7) <= b"10000111";
	when "10110000" =>
	result(0 to 7) <= b"10001000";
	when "10100011" =>
	result(0 to 7) <= b"10001001";
	when "10000101" =>
	result(0 to 7) <= b"10001010";
	when "11001001" =>
	result(0 to 7) <= b"10001011";
	when "01010001" =>
	result(0 to 7) <= b"10001100";
	when "10100010" =>
	result(0 to 7) <= b"10001101";
	when "10000111" =>
	result(0 to 7) <= b"10001110";
	when "11001101" =>
	result(0 to 7) <= b"10001111";
	when "01011001" =>
	result(0 to 7) <= b"10010000";
	when "10110010" =>
	result(0 to 7) <= b"10010001";
	when "10100111" =>
	result(0 to 7) <= b"10010010";
	when "10001101" =>
	result(0 to 7) <= b"10010011";
	when "11011001" =>
	result(0 to 7) <= b"10010100";
	when "01110001" =>
	result(0 to 7) <= b"10010101";
	when "11100010" =>
	result(0 to 7) <= b"10010110";
	when "00000111" =>
	result(0 to 7) <= b"10010111";
	when "00001110" =>
	result(0 to 7) <= b"10011000";
	when "00011100" =>
	result(0 to 7) <= b"10011001";
	when "00111000" =>
	result(0 to 7) <= b"10011010";
	when "01110000" =>
	result(0 to 7) <= b"10011011";
	when "11100000" =>
	result(0 to 7) <= b"10011100";
	when "00000011" =>
	result(0 to 7) <= b"10011101";
	when "00000110" =>
	result(0 to 7) <= b"10011110";
	when "00001100" =>
	result(0 to 7) <= b"10011111";
	when "00011000" =>
	result(0 to 7) <= b"10100000";
	when "00110000" =>
	result(0 to 7) <= b"10100001";
	when "01100000" =>
	result(0 to 7) <= b"10100010";
	when "11000000" =>
	result(0 to 7) <= b"10100011";
	when "01000011" =>
	result(0 to 7) <= b"10100100";
	when "10000110" =>
	result(0 to 7) <= b"10100101";
	when "11001111" =>
	result(0 to 7) <= b"10100110";
	when "01011101" =>
	result(0 to 7) <= b"10100111";
	when "10111010" =>
	result(0 to 7) <= b"10101000";
	when "10110111" =>
	result(0 to 7) <= b"10101001";
	when "10101101" =>
	result(0 to 7) <= b"10101010";
	when "10011001" =>
	result(0 to 7) <= b"10101011";
	when "11110001" =>
	result(0 to 7) <= b"10101100";
	when "00100001" =>
	result(0 to 7) <= b"10101101";
	when "01000010" =>
	result(0 to 7) <= b"10101110";
	when "10000100" =>
	result(0 to 7) <= b"10101111";
	when "11001011" =>
	result(0 to 7) <= b"10110000";
	when "01010101" =>
	result(0 to 7) <= b"10110001";
	when "10101010" =>
	result(0 to 7) <= b"10110010";
	when "10010111" =>
	result(0 to 7) <= b"10110011";
	when "11101101" =>
	result(0 to 7) <= b"10110100";
	when "00011001" =>
	result(0 to 7) <= b"10110101";
	when "00110010" =>
	result(0 to 7) <= b"10110110";
	when "01100100" =>
	result(0 to 7) <= b"10110111";
	when "11001000" =>
	result(0 to 7) <= b"10111000";
	when "01010011" =>
	result(0 to 7) <= b"10111001";
	when "10100110" =>
	result(0 to 7) <= b"10111010";
	when "10001111" =>
	result(0 to 7) <= b"10111011";
	when "11011101" =>
	result(0 to 7) <= b"10111100";
	when "01111001" =>
	result(0 to 7) <= b"10111101";
	when "11110010" =>
	result(0 to 7) <= b"10111110";
	when "00100111" =>
	result(0 to 7) <= b"10111111";
	when "01001110" =>
	result(0 to 7) <= b"11000000";
	when "10011100" =>
	result(0 to 7) <= b"11000001";
	when "11111011" =>
	result(0 to 7) <= b"11000010";
	when "00110101" =>
	result(0 to 7) <= b"11000011";
	when "01101010" =>
	result(0 to 7) <= b"11000100";
	when "11010100" =>
	result(0 to 7) <= b"11000101";
	when "01101011" =>
	result(0 to 7) <= b"11000110";
	when "11010110" =>
	result(0 to 7) <= b"11000111";
	when "01101111" =>
	result(0 to 7) <= b"11001000";
	when "11011110" =>
	result(0 to 7) <= b"11001001";
	when "01111111" =>
	result(0 to 7) <= b"11001010";
	when "11111110" =>
	result(0 to 7) <= b"11001011";
	when "00111111" =>
	result(0 to 7) <= b"11001100";
	when "01111110" =>
	result(0 to 7) <= b"11001101";
	when "11111100" =>
	result(0 to 7) <= b"11001110";
	when "00111011" =>
	result(0 to 7) <= b"11001111";
	when "01110110" =>
	result(0 to 7) <= b"11010000";
	when "11101100" =>
	result(0 to 7) <= b"11010001";
	when "00011011" =>
	result(0 to 7) <= b"11010010";
	when "00110110" =>
	result(0 to 7) <= b"11010011";
	when "01101100" =>
	result(0 to 7) <= b"11010100";
	when "11011000" =>
	result(0 to 7) <= b"11010101";
	when "01110011" =>
	result(0 to 7) <= b"11010110";
	when "11100110" =>
	result(0 to 7) <= b"11010111";
	when "00001111" =>
	result(0 to 7) <= b"11011000";
	when "00011110" =>
	result(0 to 7) <= b"11011001";
	when "00111100" =>
	result(0 to 7) <= b"11011010";
	when "01111000" =>
	result(0 to 7) <= b"11011011";
	when "11110000" =>
	result(0 to 7) <= b"11011100";
	when "00100011" =>
	result(0 to 7) <= b"11011101";
	when "01000110" =>
	result(0 to 7) <= b"11011110";
	when "10001100" =>
	result(0 to 7) <= b"11011111";
	when "11011011" =>
	result(0 to 7) <= b"11100000";
	when "01110101" =>
	result(0 to 7) <= b"11100001";
	when "11101010" =>
	result(0 to 7) <= b"11100010";
	when "00010111" =>
	result(0 to 7) <= b"11100011";
	when "00101110" =>
	result(0 to 7) <= b"11100100";
	when "01011100" =>
	result(0 to 7) <= b"11100101";
	when "10111000" =>
	result(0 to 7) <= b"11100110";
	when "10110011" =>
	result(0 to 7) <= b"11100111";
	when "10100101" =>
	result(0 to 7) <= b"11101000";
	when "10001001" =>
	result(0 to 7) <= b"11101001";
	when "11010001" =>
	result(0 to 7) <= b"11101010";
	when "01100001" =>
	result(0 to 7) <= b"11101011";
	when "11000010" =>
	result(0 to 7) <= b"11101100";
	when "01000111" =>
	result(0 to 7) <= b"11101101";
	when "10001110" =>
	result(0 to 7) <= b"11101110";
	when "11011111" =>
	result(0 to 7) <= b"11101111";
	when "01111101" =>
	result(0 to 7) <= b"11110000";
	when "11111010" =>
	result(0 to 7) <= b"11110001";
	when "00110111" =>
	result(0 to 7) <= b"11110010";
	when "01101110" =>
	result(0 to 7) <= b"11110011";
	when "11011100" =>
	result(0 to 7) <= b"11110100";
	when "01111011" =>
	result(0 to 7) <= b"11110101";
	when "11110110" =>
	result(0 to 7) <= b"11110110";
	when "00101111" =>
	result(0 to 7) <= b"11110111";
	when "01011110" =>
	result(0 to 7) <= b"11111000";
	when "10111100" =>
	result(0 to 7) <= b"11111001";
	when "10111011" =>
	result(0 to 7) <= b"11111010";
	when "10110101" =>
	result(0 to 7) <= b"11111011";
	when "10101001" =>
	result(0 to 7) <= b"11111100";
	when "10010001" =>
	result(0 to 7) <= b"11111101";
	when "11100001" =>
	result(0 to 7) <= b"11111110";

			    --when "00000001" => 
			    --   result(0) <= '1';
			    --   result(1) <= '1';
			    --   result(2) <= '1';
			    --   result(3) <= '1';
			    --   result(4) <= '1';
			    --   result(5) <= '1';
			    --   result(6) <= '1';
			    --   result(7) <= '1';
			    when others => null;
			end case;
	    end numToPower;

	    procedure powToNumber(signal powa: in unsigned(0 to 7); signal result: out unsigned(0 to 7)) is
	    begin
	    	case powa is
	    			when "00000000" =>
	result(0 to 7) <= b"00000001";
	when "00000001" =>
	result(0 to 7) <= b"00000010";
	when "00000010" =>
	result(0 to 7) <= b"00000100";
	when "00000011" =>
	result(0 to 7) <= b"00001000";
	when "00000100" =>
	result(0 to 7) <= b"00010000";
	when "00000101" =>
	result(0 to 7) <= b"00100000";
	when "00000110" =>
	result(0 to 7) <= b"01000000";
	when "00000111" =>
	result(0 to 7) <= b"10000000";
	when "00001000" =>
	result(0 to 7) <= b"11000011";
	when "00001001" =>
	result(0 to 7) <= b"01000101";
	when "00001010" =>
	result(0 to 7) <= b"10001010";
	when "00001011" =>
	result(0 to 7) <= b"11010111";
	when "00001100" =>
	result(0 to 7) <= b"01101101";
	when "00001101" =>
	result(0 to 7) <= b"11011010";
	when "00001110" =>
	result(0 to 7) <= b"01110111";
	when "00001111" =>
	result(0 to 7) <= b"11101110";
	when "00010000" =>
	result(0 to 7) <= b"00011111";
	when "00010001" =>
	result(0 to 7) <= b"00111110";
	when "00010010" =>
	result(0 to 7) <= b"01111100";
	when "00010011" =>
	result(0 to 7) <= b"11111000";
	when "00010100" =>
	result(0 to 7) <= b"00110011";
	when "00010101" =>
	result(0 to 7) <= b"01100110";
	when "00010110" =>
	result(0 to 7) <= b"11001100";
	when "00010111" =>
	result(0 to 7) <= b"01011011";
	when "00011000" =>
	result(0 to 7) <= b"10110110";
	when "00011001" =>
	result(0 to 7) <= b"10101111";
	when "00011010" =>
	result(0 to 7) <= b"10011101";
	when "00011011" =>
	result(0 to 7) <= b"11111001";
	when "00011100" =>
	result(0 to 7) <= b"00110001";
	when "00011101" =>
	result(0 to 7) <= b"01100010";
	when "00011110" =>
	result(0 to 7) <= b"11000100";
	when "00011111" =>
	result(0 to 7) <= b"01001011";
	when "00100000" =>
	result(0 to 7) <= b"10010110";
	when "00100001" =>
	result(0 to 7) <= b"11101111";
	when "00100010" =>
	result(0 to 7) <= b"00011101";
	when "00100011" =>
	result(0 to 7) <= b"00111010";
	when "00100100" =>
	result(0 to 7) <= b"01110100";
	when "00100101" =>
	result(0 to 7) <= b"11101000";
	when "00100110" =>
	result(0 to 7) <= b"00010011";
	when "00100111" =>
	result(0 to 7) <= b"00100110";
	when "00101000" =>
	result(0 to 7) <= b"01001100";
	when "00101001" =>
	result(0 to 7) <= b"10011000";
	when "00101010" =>
	result(0 to 7) <= b"11110011";
	when "00101011" =>
	result(0 to 7) <= b"00100101";
	when "00101100" =>
	result(0 to 7) <= b"01001010";
	when "00101101" =>
	result(0 to 7) <= b"10010100";
	when "00101110" =>
	result(0 to 7) <= b"11101011";
	when "00101111" =>
	result(0 to 7) <= b"00010101";
	when "00110000" =>
	result(0 to 7) <= b"00101010";
	when "00110001" =>
	result(0 to 7) <= b"01010100";
	when "00110010" =>
	result(0 to 7) <= b"10101000";
	when "00110011" =>
	result(0 to 7) <= b"10010011";
	when "00110100" =>
	result(0 to 7) <= b"11100101";
	when "00110101" =>
	result(0 to 7) <= b"00001001";
	when "00110110" =>
	result(0 to 7) <= b"00010010";
	when "00110111" =>
	result(0 to 7) <= b"00100100";
	when "00111000" =>
	result(0 to 7) <= b"01001000";
	when "00111001" =>
	result(0 to 7) <= b"10010000";
	when "00111010" =>
	result(0 to 7) <= b"11100011";
	when "00111011" =>
	result(0 to 7) <= b"00000101";
	when "00111100" =>
	result(0 to 7) <= b"00001010";
	when "00111101" =>
	result(0 to 7) <= b"00010100";
	when "00111110" =>
	result(0 to 7) <= b"00101000";
	when "00111111" =>
	result(0 to 7) <= b"01010000";
	when "01000000" =>
	result(0 to 7) <= b"10100000";
	when "01000001" =>
	result(0 to 7) <= b"10000011";
	when "01000010" =>
	result(0 to 7) <= b"11000101";
	when "01000011" =>
	result(0 to 7) <= b"01001001";
	when "01000100" =>
	result(0 to 7) <= b"10010010";
	when "01000101" =>
	result(0 to 7) <= b"11100111";
	when "01000110" =>
	result(0 to 7) <= b"00001101";
	when "01000111" =>
	result(0 to 7) <= b"00011010";
	when "01001000" =>
	result(0 to 7) <= b"00110100";
	when "01001001" =>
	result(0 to 7) <= b"01101000";
	when "01001010" =>
	result(0 to 7) <= b"11010000";
	when "01001011" =>
	result(0 to 7) <= b"01100011";
	when "01001100" =>
	result(0 to 7) <= b"11000110";
	when "01001101" =>
	result(0 to 7) <= b"01001111";
	when "01001110" =>
	result(0 to 7) <= b"10011110";
	when "01001111" =>
	result(0 to 7) <= b"11111111";
	when "01010000" =>
	result(0 to 7) <= b"00111101";
	when "01010001" =>
	result(0 to 7) <= b"01111010";
	when "01010010" =>
	result(0 to 7) <= b"11110100";
	when "01010011" =>
	result(0 to 7) <= b"00101011";
	when "01010100" =>
	result(0 to 7) <= b"01010110";
	when "01010101" =>
	result(0 to 7) <= b"10101100";
	when "01010110" =>
	result(0 to 7) <= b"10011011";
	when "01010111" =>
	result(0 to 7) <= b"11110101";
	when "01011000" =>
	result(0 to 7) <= b"00101001";
	when "01011001" =>
	result(0 to 7) <= b"01010010";
	when "01011010" =>
	result(0 to 7) <= b"10100100";
	when "01011011" =>
	result(0 to 7) <= b"10001011";
	when "01011100" =>
	result(0 to 7) <= b"11010101";
	when "01011101" =>
	result(0 to 7) <= b"01101001";
	when "01011110" =>
	result(0 to 7) <= b"11010010";
	when "01011111" =>
	result(0 to 7) <= b"01100111";
	when "01100000" =>
	result(0 to 7) <= b"11001110";
	when "01100001" =>
	result(0 to 7) <= b"01011111";
	when "01100010" =>
	result(0 to 7) <= b"10111110";
	when "01100011" =>
	result(0 to 7) <= b"10111111";
	when "01100100" =>
	result(0 to 7) <= b"10111101";
	when "01100101" =>
	result(0 to 7) <= b"10111001";
	when "01100110" =>
	result(0 to 7) <= b"10110001";
	when "01100111" =>
	result(0 to 7) <= b"10100001";
	when "01101000" =>
	result(0 to 7) <= b"10000001";
	when "01101001" =>
	result(0 to 7) <= b"11000001";
	when "01101010" =>
	result(0 to 7) <= b"01000001";
	when "01101011" =>
	result(0 to 7) <= b"10000010";
	when "01101100" =>
	result(0 to 7) <= b"11000111";
	when "01101101" =>
	result(0 to 7) <= b"01001101";
	when "01101110" =>
	result(0 to 7) <= b"10011010";
	when "01101111" =>
	result(0 to 7) <= b"11110111";
	when "01110000" =>
	result(0 to 7) <= b"00101101";
	when "01110001" =>
	result(0 to 7) <= b"01011010";
	when "01110010" =>
	result(0 to 7) <= b"10110100";
	when "01110011" =>
	result(0 to 7) <= b"10101011";
	when "01110100" =>
	result(0 to 7) <= b"10010101";
	when "01110101" =>
	result(0 to 7) <= b"11101001";
	when "01110110" =>
	result(0 to 7) <= b"00010001";
	when "01110111" =>
	result(0 to 7) <= b"00100010";
	when "01111000" =>
	result(0 to 7) <= b"01000100";
	when "01111001" =>
	result(0 to 7) <= b"10001000";
	when "01111010" =>
	result(0 to 7) <= b"11010011";
	when "01111011" =>
	result(0 to 7) <= b"01100101";
	when "01111100" =>
	result(0 to 7) <= b"11001010";
	when "01111101" =>
	result(0 to 7) <= b"01010111";
	when "01111110" =>
	result(0 to 7) <= b"10101110";
	when "01111111" =>
	result(0 to 7) <= b"10011111";
	when "10000000" =>
	result(0 to 7) <= b"11111101";
	when "10000001" =>
	result(0 to 7) <= b"00111001";
	when "10000010" =>
	result(0 to 7) <= b"01110010";
	when "10000011" =>
	result(0 to 7) <= b"11100100";
	when "10000100" =>
	result(0 to 7) <= b"00001011";
	when "10000101" =>
	result(0 to 7) <= b"00010110";
	when "10000110" =>
	result(0 to 7) <= b"00101100";
	when "10000111" =>
	result(0 to 7) <= b"01011000";
	when "10001000" =>
	result(0 to 7) <= b"10110000";
	when "10001001" =>
	result(0 to 7) <= b"10100011";
	when "10001010" =>
	result(0 to 7) <= b"10000101";
	when "10001011" =>
	result(0 to 7) <= b"11001001";
	when "10001100" =>
	result(0 to 7) <= b"01010001";
	when "10001101" =>
	result(0 to 7) <= b"10100010";
	when "10001110" =>
	result(0 to 7) <= b"10000111";
	when "10001111" =>
	result(0 to 7) <= b"11001101";
	when "10010000" =>
	result(0 to 7) <= b"01011001";
	when "10010001" =>
	result(0 to 7) <= b"10110010";
	when "10010010" =>
	result(0 to 7) <= b"10100111";
	when "10010011" =>
	result(0 to 7) <= b"10001101";
	when "10010100" =>
	result(0 to 7) <= b"11011001";
	when "10010101" =>
	result(0 to 7) <= b"01110001";
	when "10010110" =>
	result(0 to 7) <= b"11100010";
	when "10010111" =>
	result(0 to 7) <= b"00000111";
	when "10011000" =>
	result(0 to 7) <= b"00001110";
	when "10011001" =>
	result(0 to 7) <= b"00011100";
	when "10011010" =>
	result(0 to 7) <= b"00111000";
	when "10011011" =>
	result(0 to 7) <= b"01110000";
	when "10011100" =>
	result(0 to 7) <= b"11100000";
	when "10011101" =>
	result(0 to 7) <= b"00000011";
	when "10011110" =>
	result(0 to 7) <= b"00000110";
	when "10011111" =>
	result(0 to 7) <= b"00001100";
	when "10100000" =>
	result(0 to 7) <= b"00011000";
	when "10100001" =>
	result(0 to 7) <= b"00110000";
	when "10100010" =>
	result(0 to 7) <= b"01100000";
	when "10100011" =>
	result(0 to 7) <= b"11000000";
	when "10100100" =>
	result(0 to 7) <= b"01000011";
	when "10100101" =>
	result(0 to 7) <= b"10000110";
	when "10100110" =>
	result(0 to 7) <= b"11001111";
	when "10100111" =>
	result(0 to 7) <= b"01011101";
	when "10101000" =>
	result(0 to 7) <= b"10111010";
	when "10101001" =>
	result(0 to 7) <= b"10110111";
	when "10101010" =>
	result(0 to 7) <= b"10101101";
	when "10101011" =>
	result(0 to 7) <= b"10011001";
	when "10101100" =>
	result(0 to 7) <= b"11110001";
	when "10101101" =>
	result(0 to 7) <= b"00100001";
	when "10101110" =>
	result(0 to 7) <= b"01000010";
	when "10101111" =>
	result(0 to 7) <= b"10000100";
	when "10110000" =>
	result(0 to 7) <= b"11001011";
	when "10110001" =>
	result(0 to 7) <= b"01010101";
	when "10110010" =>
	result(0 to 7) <= b"10101010";
	when "10110011" =>
	result(0 to 7) <= b"10010111";
	when "10110100" =>
	result(0 to 7) <= b"11101101";
	when "10110101" =>
	result(0 to 7) <= b"00011001";
	when "10110110" =>
	result(0 to 7) <= b"00110010";
	when "10110111" =>
	result(0 to 7) <= b"01100100";
	when "10111000" =>
	result(0 to 7) <= b"11001000";
	when "10111001" =>
	result(0 to 7) <= b"01010011";
	when "10111010" =>
	result(0 to 7) <= b"10100110";
	when "10111011" =>
	result(0 to 7) <= b"10001111";
	when "10111100" =>
	result(0 to 7) <= b"11011101";
	when "10111101" =>
	result(0 to 7) <= b"01111001";
	when "10111110" =>
	result(0 to 7) <= b"11110010";
	when "10111111" =>
	result(0 to 7) <= b"00100111";
	when "11000000" =>
	result(0 to 7) <= b"01001110";
	when "11000001" =>
	result(0 to 7) <= b"10011100";
	when "11000010" =>
	result(0 to 7) <= b"11111011";
	when "11000011" =>
	result(0 to 7) <= b"00110101";
	when "11000100" =>
	result(0 to 7) <= b"01101010";
	when "11000101" =>
	result(0 to 7) <= b"11010100";
	when "11000110" =>
	result(0 to 7) <= b"01101011";
	when "11000111" =>
	result(0 to 7) <= b"11010110";
	when "11001000" =>
	result(0 to 7) <= b"01101111";
	when "11001001" =>
	result(0 to 7) <= b"11011110";
	when "11001010" =>
	result(0 to 7) <= b"01111111";
	when "11001011" =>
	result(0 to 7) <= b"11111110";
	when "11001100" =>
	result(0 to 7) <= b"00111111";
	when "11001101" =>
	result(0 to 7) <= b"01111110";
	when "11001110" =>
	result(0 to 7) <= b"11111100";
	when "11001111" =>
	result(0 to 7) <= b"00111011";
	when "11010000" =>
	result(0 to 7) <= b"01110110";
	when "11010001" =>
	result(0 to 7) <= b"11101100";
	when "11010010" =>
	result(0 to 7) <= b"00011011";
	when "11010011" =>
	result(0 to 7) <= b"00110110";
	when "11010100" =>
	result(0 to 7) <= b"01101100";
	when "11010101" =>
	result(0 to 7) <= b"11011000";
	when "11010110" =>
	result(0 to 7) <= b"01110011";
	when "11010111" =>
	result(0 to 7) <= b"11100110";
	when "11011000" =>
	result(0 to 7) <= b"00001111";
	when "11011001" =>
	result(0 to 7) <= b"00011110";
	when "11011010" =>
	result(0 to 7) <= b"00111100";
	when "11011011" =>
	result(0 to 7) <= b"01111000";
	when "11011100" =>
	result(0 to 7) <= b"11110000";
	when "11011101" =>
	result(0 to 7) <= b"00100011";
	when "11011110" =>
	result(0 to 7) <= b"01000110";
	when "11011111" =>
	result(0 to 7) <= b"10001100";
	when "11100000" =>
	result(0 to 7) <= b"11011011";
	when "11100001" =>
	result(0 to 7) <= b"01110101";
	when "11100010" =>
	result(0 to 7) <= b"11101010";
	when "11100011" =>
	result(0 to 7) <= b"00010111";
	when "11100100" =>
	result(0 to 7) <= b"00101110";
	when "11100101" =>
	result(0 to 7) <= b"01011100";
	when "11100110" =>
	result(0 to 7) <= b"10111000";
	when "11100111" =>
	result(0 to 7) <= b"10110011";
	when "11101000" =>
	result(0 to 7) <= b"10100101";
	when "11101001" =>
	result(0 to 7) <= b"10001001";
	when "11101010" =>
	result(0 to 7) <= b"11010001";
	when "11101011" =>
	result(0 to 7) <= b"01100001";
	when "11101100" =>
	result(0 to 7) <= b"11000010";
	when "11101101" =>
	result(0 to 7) <= b"01000111";
	when "11101110" =>
	result(0 to 7) <= b"10001110";
	when "11101111" =>
	result(0 to 7) <= b"11011111";
	when "11110000" =>
	result(0 to 7) <= b"01111101";
	when "11110001" =>
	result(0 to 7) <= b"11111010";
	when "11110010" =>
	result(0 to 7) <= b"00110111";
	when "11110011" =>
	result(0 to 7) <= b"01101110";
	when "11110100" =>
	result(0 to 7) <= b"11011100";
	when "11110101" =>
	result(0 to 7) <= b"01111011";
	when "11110110" =>
	result(0 to 7) <= b"11110110";
	when "11110111" =>
	result(0 to 7) <= b"00101111";
	when "11111000" =>
	result(0 to 7) <= b"01011110";
	when "11111001" =>
	result(0 to 7) <= b"10111100";
	when "11111010" =>
	result(0 to 7) <= b"10111011";
	when "11111011" =>
	result(0 to 7) <= b"10110101";
	when "11111100" =>
	result(0 to 7) <= b"10101001";
	when "11111101" =>
	result(0 to 7) <= b"10010001";
	when "11111110" =>
	result(0 to 7) <= b"11100001";
	when "11111111" =>
	result(0 to 7) <= b"00000001";

			    when others => null;
			end case;
	    end powToNumber;

	    -- икс функция
	    procedure xor16bit(signal firBlock, secBlock: in unsigned(0 to 15); signal result: out unsigned(0 to 15)) is
	    begin
	    	result(0)  <= firBlock(0)  xor secBlock(0);
	    	result(1)  <= firBlock(1)  xor secBlock(1);
	    	result(2)  <= firBlock(2)  xor secBlock(2);
	    	result(3)  <= firBlock(3)  xor secBlock(3);
	    	result(4)  <= firBlock(4)  xor secBlock(4);
	    	result(5)  <= firBlock(5)  xor secBlock(5);
	    	result(6)  <= firBlock(6)  xor secBlock(6);
	    	result(7)  <= firBlock(7)  xor secBlock(7);
	    	result(8)  <= firBlock(8)  xor secBlock(8);
	    	result(9)  <= firBlock(9)  xor secBlock(9);
	    	result(10) <= firBlock(10) xor secBlock(10);
	    	result(11) <= firBlock(11) xor secBlock(11);
	    	result(12) <= firBlock(12) xor secBlock(12);
	    	result(13) <= firBlock(13) xor secBlock(13);
	    	result(14) <= firBlock(14) xor secBlock(14);
	    	result(15) <= firBlock(15) xor secBlock(15);
	    end xor16bit;

	    --итерационная функция генерации раундого ключа
	    procedure keyGenRound(signal masterKey2, masterKey1, c1: in unsigned(0 to 15); signal secIterIn:out unsigned(0 to 15);
	    	signal firIterS1, firIterS2, firIterSum1, firIterSum2, firIterPow1, firIterPow2, firIterNum1, firIterNum2: inout unsigned(0 to 7);
	    	signal intCoef1, intCoef2:in integer; signal firIterRes, firIterXor: inout unsigned(0 to 15)) is
	    begin
	    	xor16bit(firBlock=>masterKey2, secBlock=>c1, result=>firIterXor);

			tableShift(inputPart=>firIterXor(0 to 7), result=>firIterS1);
			tableShift(inputPart=>firIterXor(8 to 15), result=>firIterS2);
			
			numToPower(numba=>firIterS1(0 to 7), result=>firIterPow1);
		 	numToPower(numba=>firIterS2(0 to 7), result=>firIterPow2);

		 	firIterSum1(0 to 7) <= to_unsigned(to_integer(firIterPow1) + intCoef1, 8);
		 	firIterSum2(0 to 7) <= to_unsigned(to_integer(firIterPow2) + intCoef2, 8);


			powToNumber(powa=>firIterSum1, result=>firIterNum1);
			powToNumber(powa=>firIterSum2, result=>firIterNum2);

			firIterRes(0)     <= firIterNum1(0) xor firIterNum2(0);
			firIterRes(1)     <= firIterNum1(1) xor firIterNum2(1);
			firIterRes(2)     <= firIterNum1(2) xor firIterNum2(2);
			firIterRes(3)     <= firIterNum1(3) xor firIterNum2(3);
			firIterRes(4)     <= firIterNum1(4) xor firIterNum2(4);
			firIterRes(5)     <= firIterNum1(5) xor firIterNum2(5);
			firIterRes(6)     <= firIterNum1(6) xor firIterNum2(6);
			firIterRes(7)     <= firIterNum1(7) xor firIterNum2(7);
			firIterRes(8)     <= firIterNum1(0);
			firIterRes(9)     <= firIterNum1(1);
			firIterRes(10)    <= firIterNum1(2);
			firIterRes(11)    <= firIterNum1(3);
			firIterRes(12)    <= firIterNum1(4);
			firIterRes(13)    <= firIterNum1(5);
			firIterRes(14)    <= firIterNum1(6);
			firIterRes(15)    <= firIterNum1(7);

			xor16bit(firBlock=>masterKey1, secBlock=>firIterRes, result=>secIterIn);
	    end keyGenRound;

	    --функция одного раунда шифрования текста
		procedure textBlockEncoding(signal inputBlockPo, keyPo: in unsigned(0 to 15); 
			signal workBlock: inout unsigned(0 to 15);
			signal temp, temp2, outUnsigned, outUnsignedD, testKey1, testKey2, testCoef1, testCoef1Tab, testCoef2, testCoef2Tab, firBlocNoCon, SecBlocNoCon, firBlocCon, SecBlocCon: inout unsigned(0 to 7);
			signal outputBlockPo: out unsigned(0 to 15)) is
		begin
			--x
				workBlock(0) <= InputBlockPo(0) xor keyPo(0);
		        workBlock(1) <= InputBlockPo(1) xor keyPo(1);
		        workBlock(2) <= InputBlockPo(2) xor keyPo(2);
		        workBlock(3) <= InputBlockPo(3) xor keyPo(3);
		        workBlock(4) <= InputBlockPo(4) xor keyPo(4);
		        workBlock(5) <= InputBlockPo(5) xor keyPo(5);
		        workBlock(6) <= InputBlockPo(6) xor keyPo(6);
		        workBlock(7) <= InputBlockPo(7) xor keyPo(7);
		        workBlock(8) <= InputBlockPo(8) xor keyPo(8);
		        workBlock(9) <= InputBlockPo(9) xor keyPo(9);
		        workBlock(10) <= InputBlockPo(10) xor keyPo(10);
		        workBlock(11) <= InputBlockPo(11) xor keyPo(11);
		        workBlock(12) <= InputBlockPo(12) xor keyPo(12);
		        workBlock(13) <= InputBlockPo(13) xor keyPo(13);
		        workBlock(14) <= InputBlockPo(14) xor keyPo(14);
		        workBlock(15) <= InputBlockPo(15) xor keyPo(15);

	        --s
		        temp(0) <= workBlock(0);
		        temp(1) <= workBlock(1);
		        temp(2) <= workBlock(2);
		        temp(3) <= workBlock(3);
		        temp(4) <= workBlock(4);
		        temp(5) <= workBlock(5);
		        temp(6) <= workBlock(6);
		        temp(7) <= workBlock(7);
				tableShift(inputPart=>temp, result=>outUnsigned);

		        temp2(0) <= workBlock(8);
		        temp2(1) <= workBlock(9);
		        temp2(2) <= workBlock(10);
		        temp2(3) <= workBlock(11);
		        temp2(4) <= workBlock(12);
		        temp2(5) <= workBlock(13);
		        temp2(6) <= workBlock(14);
		        temp2(7) <= workBlock(15);
		        tableShift(inputPart=>temp2, result=>outUnsignedD);

		    --l
		    	numToPower(numba=>outUnsigned(0 to 7), result=>testKey1);
		 		numToPower(numba=>outUnsignedD(0 to 7), result=>testKey2);
		 		numToPower(numba=>testCoef1, result=>testCoef1Tab);
		 		numToPower(numba=>testCoef2, result=>testCoef2Tab);

		 		firBlocNoCon(0 to 7) <= to_unsigned(to_integer(testKey1) + to_integer(testCoef1Tab), 8);
		 		SecBlocNoCon(0 to 7) <= to_unsigned(to_integer(testKey2) + to_integer(testCoef2Tab), 8);

		 		powToNumber(powa=>firBlocNoCon, result=>firBlocCon);
		 		powToNumber(powa=>SecBlocNoCon, result=>SecBlocCon);

		 		outputBlockPo(0)     <= firBlocCon(0) xor SecBlocCon(0);
				outputBlockPo(1)     <= firBlocCon(1) xor SecBlocCon(1);
				outputBlockPo(2)     <= firBlocCon(2) xor SecBlocCon(2);
				outputBlockPo(3)     <= firBlocCon(3) xor SecBlocCon(3);
				outputBlockPo(4)     <= firBlocCon(4) xor SecBlocCon(4);
				outputBlockPo(5)     <= firBlocCon(5) xor SecBlocCon(5);
				outputBlockPo(6)     <= firBlocCon(6) xor SecBlocCon(6);
				outputBlockPo(7)     <= firBlocCon(7) xor SecBlocCon(7);
				outputBlockPo(8 to 15) <= firBlocCon(0 to 7);
				--outputBlockPo(8)     <= firBlocCon(0);
				--outputBlockPo(9)     <= firBlocCon(1);
				--outputBlockPo(10)    <= firBlocCon(2);    
				--outputBlockPo(11)    <= firBlocCon(3);
				--outputBlockPo(12)    <= firBlocCon(4);
				--outputBlockPo(13)    <= firBlocCon(5);
				--outputBlockPo(14)    <= firBlocCon(6);
				--outputBlockPo(15)    <= firBlocCon(7);
		end textBlockEncoding;

	begin
	    signalForXor(0 to 7) <= "10010100";--148
	    signalForXor2(0 to 7) <= "00100000";--32

	    testCoef2 <= signalForXor;
	    testCoef1 <= signalForXor2;	

	    intCoef1 <= 249;
	    intCoef2 <= 122;

	     --constants to generate iterational keys
	    	c1 <= "0000000110010100";
			c2 <= "0000001011101011";
			c3 <= "0000001101111111";
			c4 <= "0000010000010101";
			c5 <= "0000010110000001";
			c6 <= "0000011011111110";
			c7 <= "0000011101101010";
			c8 <= "0000100000101010";

	    --master key input and split in half
		    masterKey1(0) <= keyPo(0);
		    masterKey1(1) <= keyPo(1);
		    masterKey1(2) <= keyPo(2);
		    masterKey1(3) <= keyPo(3);
		    masterKey1(4) <= keyPo(4);
		    masterKey1(5) <= keyPo(5);
		    masterKey1(6) <= keyPo(6);
		    masterKey1(7) <= keyPo(7);
		    masterKey1(8) <= keyPo(8);
		    masterKey1(9) <= keyPo(9);
		    masterKey1(10) <= keyPo(10);
		    masterKey1(11) <= keyPo(11);
		    masterKey1(12) <= keyPo(12);
		    masterKey1(13) <= keyPo(13);
		    masterKey1(14) <= keyPo(14);
		    masterKey1(15) <= keyPo(15);
		    masterKey2(0)  <= keyPo(16);
		    masterKey2(1)  <= keyPo(17);
		    masterKey2(2)  <= keyPo(18);
		    masterKey2(3)  <= keyPo(19);
		    masterKey2(4)  <= keyPo(20);
		    masterKey2(5)  <= keyPo(21);
		    masterKey2(6)  <= keyPo(22);
		    masterKey2(7)  <= keyPo(23);
		    masterKey2(8)  <= keyPo(24);
		    masterKey2(9)  <= keyPo(25);
		    masterKey2(10) <= keyPo(26);
		    masterKey2(11) <= keyPo(27);
		    masterKey2(12) <= keyPo(28);
		    masterKey2(13) <= keyPo(29);
		    masterKey2(14) <= keyPo(30);
		    masterKey2(15) <= keyPo(31);   

--		eight iterations of keygen function to calculate k3 k4
		    keyGenRound(masterKey2=>masterKey2, masterKey1=>masterKey1, c1=>c1, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>secIterIn, firIterS1=>firIterS1,
		     firIterS2=>firIterS2, firIterSum1=>firIterSum1, firIterSum2=>firIterSum2, firIterPow1=>firIterPow1, firIterPow2=>firIterPow2,
		      firIterNum1=>firIterNum1, firIterNum2=>firIterNum2, firIterRes=>firIterRes, firIterXor=>firIterXor);

		    keyGenRound(masterKey2=>secIterIn,masterKey1=>masterKey2, c1=>c2, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>thirIterIn, firIterS1=>secIterS1,
		     firIterS2=>secIterS2, firIterSum1=>secIterSum1, firIterSum2=>secIterSum2, firIterPow1=>secIterPow1, firIterPow2=>secIterPow2,
		      firIterNum1=>secIterNum1, firIterNum2=>secIterNum2, firIterRes=>secIterRes, firIterXor=>secIterXor);

		    keyGenRound(masterKey2=>thirIterIn, c1=>c3, masterKey1=>secIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>fouIterIn, firIterS1=>thirIterS1,
		     firIterS2=>thirIterS2, firIterSum1=>thirIterSum1, firIterSum2=>thirIterSum2, firIterPow1=>thirIterPow1, firIterPow2=>thirIterPow2,
		      firIterNum1=>thirIterNum1, firIterNum2=>thirIterNum2, firIterRes=>thirIterRes, firIterXor=>thirIterXor);

		    keyGenRound(masterKey2=>fouIterIn, c1=>c4,masterKey1=>thirIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>fifIterIn, firIterS1=>fouIterS1,
		     firIterS2=>fouIterS2, firIterSum1=>fouIterSum1, firIterSum2=>fouIterSum2, firIterPow1=>fouIterPow1, firIterPow2=>fouIterPow2,
		      firIterNum1=>fouIterNum1, firIterNum2=>fouIterNum2, firIterRes=>fouIterRes, firIterXor=>fouIterXor);

		    keyGenRound(masterKey2=>fifIterIn, c1=>c5,masterKey1=>fouIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>sixIterIn, firIterS1=>fifIterS1,
		     firIterS2=>fifIterS2, firIterSum1=>fifIterSum1, firIterSum2=>fifIterSum2, firIterPow1=>fifIterPow1, firIterPow2=>fifIterPow2,
		      firIterNum1=>fifIterNum1, firIterNum2=>fifIterNum2, firIterRes=>fifIterRes, firIterXor=>fifIterXor);

		    keyGenRound(masterKey2=>sixIterIn, c1=>c6,masterKey1=>fifIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>sevIterIn, firIterS1=>sixIterS1,
		     firIterS2=>sixIterS2, firIterSum1=>sixIterSum1, firIterSum2=>sixIterSum2, firIterPow1=>sixIterPow1, firIterPow2=>sixIterPow2,
		      firIterNum1=>sixIterNum1, firIterNum2=>sixIterNum2, firIterRes=>sixIterRes, firIterXor=>sixIterXor);

		    keyGenRound(masterKey2=>sevIterIn, c1=>c7,masterKey1=>sixIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>eigIterIn, firIterS1=>sevIterS1,
		     firIterS2=>sevIterS2, firIterSum1=>sevIterSum1, firIterSum2=>sevIterSum2, firIterPow1=>sevIterPow1, firIterPow2=>sevIterPow2,
		      firIterNum1=>sevIterNum1, firIterNum2=>sevIterNum2, firIterRes=>sevIterRes, firIterXor=>sevIterXor);

		    keyGenRound(masterKey2=>eigIterIn, c1=>c8,masterKey1=>sevIterIn, intCoef1=>intCoef1, intCoef2=>intCoef2, secIterIn=>ninIterIn, firIterS1=>eigIterS1,
		     firIterS2=>eigIterS2, firIterSum1=>eigIterSum1, firIterSum2=>eigIterSum2, firIterPow1=>eigIterPow1, firIterPow2=>eigIterPow2,
		      firIterNum1=>eigIterNum1, firIterNum2=>eigIterNum2, firIterRes=>eigIterRes, firIterXor=>eigIterXor);

	   
		--four iterations of encoding text
			textBlockEncoding(inputBlockPo=>inputBlockPo, keyPo=>masterKey1, workblock=>workblock, temp=>temp, temp2=>temp2, outUnsigned=>outUnsigned,
				outUnsignedD=>outUnsignedD, testKey1=>testKey1, testKey2=>testKey2, testCoef1=>testCoef1, testCoef1Tab=>testCoef1Tab, 
				testCoef2=>testCoef2, testCoef2Tab=>testCoef2Tab, firBlocNoCon=>firBlocNoCon, SecBlocNoCon=>SecBlocNoCon, firBlocCon=>firBlocCon,
				SecBlocCon=>SecBlocCon, outputBlockPo=>secinputBlockPo);

			textBlockEncoding(inputBlockPo=>secinputBlockPo, keyPo=>masterKey2, workblock=>secworkblock, temp=>sectemp, temp2=>sectemp2, outUnsigned=>secoutUnsigned,
				outUnsignedD=>secoutUnsignedD, testKey1=>sectestKey1, testKey2=>sectestKey2, testCoef1=>testCoef1, testCoef1Tab=>sectestCoef1Tab, 
				testCoef2=>testCoef2, testCoef2Tab=>sectestCoef2Tab, firBlocNoCon=>secfirBlocNoCon, SecBlocNoCon=>secSecBlocNoCon, firBlocCon=>secfirBlocCon,
				SecBlocCon=>secSecBlocCon, outputBlockPo=>thirinputBlockPo);

			textBlockEncoding(inputBlockPo=>thirinputBlockPo, keyPo=>eigIterIn, workblock=>thirworkblock, temp=>thirtemp, temp2=>thirtemp2, outUnsigned=>thiroutUnsigned,
				outUnsignedD=>thiroutUnsignedD, testKey1=>thirtestKey1, testKey2=>thirtestKey2, testCoef1=>testCoef1, testCoef1Tab=>thirtestCoef1Tab, 
				testCoef2=>testCoef2, testCoef2Tab=>thirtestCoef2Tab, firBlocNoCon=>thirfirBlocNoCon, SecBlocNoCon=>thirSecBlocNoCon, firBlocCon=>thirfirBlocCon,
				SecBlocCon=>thirSecBlocCon, outputBlockPo=>fouinputBlockPo);

			xor16bit(firBlock=>fouinputBlockPo, secBlock=>ninIterIn, result=>fououtputBlockPo);

		--ВЫВОД
	 		outputBlockPort(0)  <= fououtputBlockPo(0);
			outputBlockPort(1)  <= fououtputBlockPo(1);
			outputBlockPort(2)  <= fououtputBlockPo(2);
			outputBlockPort(3)  <= fououtputBlockPo(3);
			outputBlockPort(4)  <= fououtputBlockPo(4);
			outputBlockPort(5)  <= fououtputBlockPo(5);
			outputBlockPort(6)  <= fououtputBlockPo(6);
			outputBlockPort(7)  <= fououtputBlockPo(7);
			outputBlockPort(8)  <= fououtputBlockPo(8);
			outputBlockPort(9)  <= fououtputBlockPo(9);
			outputBlockPort(10) <= fououtputBlockPo(10);
			outputBlockPort(11) <= fououtputBlockPo(11);
			outputBlockPort(12) <= fououtputBlockPo(12);
			outputBlockPort(13) <= fououtputBlockPo(13);
			outputBlockPort(14) <= fououtputBlockPo(14);
			outputBlockPort(15) <= fououtputBlockPo(15);


	 		outputKeykPort(0)  <= secIterIn(0);
			outputKeykPort(1)  <= secIterIn(1);
			outputKeykPort(2)  <= secIterIn(2);
			outputKeykPort(3)  <= secIterIn(3);
			outputKeykPort(4)  <= secIterIn(4);
			outputKeykPort(5)  <= secIterIn(5);
			outputKeykPort(6)  <= secIterIn(6);
			outputKeykPort(7)  <= secIterIn(7);
			outputKeykPort(8)  <= secIterIn(8);
			outputKeykPort(9)  <= secIterIn(9);
			outputKeykPort(10) <= secIterIn(10);
			outputKeykPort(11) <= secIterIn(11);
			outputKeykPort(12) <= secIterIn(12);
			outputKeykPort(13) <= secIterIn(13);
			outputKeykPort(14) <= secIterIn(14);
			outputKeykPort(15) <= secIterIn(15);
	end Behavioral;