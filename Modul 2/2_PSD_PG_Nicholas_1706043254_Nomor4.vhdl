library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity counterupdown is
    Port ( CLK : in  std_logic;
           LED : out  std_logic_vector (7 downto 0);
           DIR : in  std_logic);    
end counterupdown;

architecture fungsi of counterupdown is
    signal clk_div : std_logic_vector (3 downto 0) := X"0";
    signal count   : std_logic_vector (7 downto 0) := X"00";
begin

    process (CLK)
    begin
        if (CLK'Event and CLK = '1') then
            clk_div <= clk_div + '1';
        end if;
    end process;
    
    process (clk_div(3), DIR)
    begin
        if (clk_div(3)'Event and clk_div(3) = '1') then
            if (DIR = '1') then
                count <= count + '1';   
            elsif (DIR = '0') then
                count <= count - '1';   
            end if;
        end if;
    end process;
    
    LED <= not count;
    
end fungsi;