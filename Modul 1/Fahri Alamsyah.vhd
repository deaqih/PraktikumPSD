library IEEE;
use IEEE.std_logic_1164.all;

entity kombinasi is
port (
	A, B, C, D : in std_logic_vector(3 downto 0);
	SEL :in std_logic_vector(3 downto 0);
	O : out std_logic_vector(3 downto 0);
	BCD : in std_logic_vector (3 downto 0);
	Seven_Segment : out std_logic_vector (6 downto 0));
end kombinasi;


architecture mux_4to1 of kombinasi is
begin
	O <= A when (SEL = "0011") else
	B when (SEL = "0010") else
	C when (SEL = "0001") else
	D when (SEL = "0000") else
	"0000";
  
end mux_4to1;


architecture bcd_ke7segmen of kombinasi is
begin

process(BCD)
begin


	case BCD is
	when "0000" => Seven_Segment <= "0000001"; ---0
	when "0001" => Seven_Segment <= "1001111"; ---1
	when "0010" => Seven_Segment <= "0010010"; ---2
	when "0011" => Seven_Segment <= "0000110"; ---3
	when others => Seven_Segment <= "1111111"; ---null
	end case;
 
 
end process;
end bcd_ke7segmen;
