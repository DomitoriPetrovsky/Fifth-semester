
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity logic_element is
	port (
		x: in bit_vector(2 downto 1);
		y : out bit_vector(2 downto 1));
		
end logic_element;

architecture Behavioral of logic_element is

begin
	
	y(1) <= x(1) xor x(2);
	y(2) <= x(1) or x(2);
	
end Behavioral;