library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.all;


entity SIMULATION_1 is
--  Port ( );
end SIMULATION_1;

architecture Behavioral of SIMULATION_1 is

    component main
        port(
            inputBlockPo: in std_logic_vector(0 to 15);
            leftKeyPo: in std_logic_vector(0 to 15);
            outputBlockPo: out std_logic_vector(0 to 15)
            );
    end component;
    
    signal inputBlock: std_logic_vector(0 to 15);
    signal outputBlock: std_logic_vector(0 to 15);
    signal leftKey: std_logic_vector(0 to 15);
    
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
    
begin
        UUT: main port map(
            inputBlockPo => inputBlock ,
            outputBlockPo => outputBlock,
            leftKeyPo => leftKey
        );
        
        process
        begin
        
        inputBlock <= x"ffff";
        leftKey <= std_logic_vector(to_unsigned(0, 16));
        
        wait for 100 ns;
      
        wait for 100 ns;
       
        leftKey  <= x"ffff";
        inputBlock <=  std_logic_vector(to_unsigned(0, 16));
        
        wait for 100 ns;

        end process;

end Behavioral;
