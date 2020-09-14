library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.all;


entity SIMULATION_1 is
--  Port ( );
end SIMULATION_1;

architecture Behavioral of SIMULATION_1 is

    component main
        port(
            inputBlock: in std_logic_vector(127 downto 0);
            leftKey: in std_logic_vector(127 downto 0);
            outputBlock: out std_logic_vector(127 downto 0)
            );
    end component;
    
    signal inputBlock: std_logic_vector(127 downto 0);
    signal outputBlock: std_logic_vector(127 downto 0);
    signal leftKey: std_logic_vector(127 downto 0);
    signal workBlock: std_logic_vector(127 downto 0);
    signal eightBitBlock: integer;
    signal temp: unsigned(0 to 7);
    
begin
        UUT: main port map(
            inputBlock => inputBlock,
            outputBlock => outputBlock,
            leftKey => leftKey
        );
        
        process
        begin
        
        inputBlock <= x"ffffffffffffffffffffffffffffffff";
        leftKey <= std_logic_vector(to_unsigned(0, 128));
        
        wait for 50 ns;
        wait for 500 ns;
        wait for 500 ns;
        
        --inputBlock <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
       -- leftKey <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        
        wait for 100 ns;
        wait for 500 ns;
        wait for 500 ns;
        
        leftKey  <= x"ffffffffffffffffffffffffffffffff";
        --"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        inputBlock <=  std_logic_vector(to_unsigned(0, 128));
        --"11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
        
        wait for 100 ns;
        wait for 500 ns;
        wait for 500 ns;
        
        end process;

end Behavioral;
