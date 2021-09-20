
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity add_1 is
	port (
		a, b: in bit;
		p, c : out bit);
		
end add_1;

architecture Behavioral of add_1 is


begin
	
	p <= a xor b;
	c <= a and b;
	
	
end Behavioral;