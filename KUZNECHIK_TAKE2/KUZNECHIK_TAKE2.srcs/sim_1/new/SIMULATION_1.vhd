library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.all;


entity SIMULATION_1 is
--  Port ( );
end SIMULATION_1;

architecture Behavioral of SIMULATION_1 is

    component main
        port(
            inputBlockPo: in unsigned(0 to 15);
            keyPo: in unsigned(0 to 31);
            outputBlockPort: out unsigned(0 to 15)
            );
    end component;
    
    signal inputBlock: unsigned(0 to 15);
    signal outputBlock: unsigned(0 to 15);
    signal leftKey: unsigned(0 to 31);
    
begin
        UUT: main port map(
            inputBlockPo => inputBlock ,
            outputBlockPort => outputBlock,
            KeyPo => leftKey
        );
        
        process
        begin
        
        inputBlock <= x"ffff";
        leftKey <= to_unsigned(0, 32);
        
        wait for 100 ns;
      
        wait for 100 ns;
       
        leftKey  <= x"ffffffff";
        inputBlock <=  to_unsigned(0, 16);
        
        wait for 100 ns;

        end process;

end Behavioral;
