
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity add_2 is
	port (
		a, b, c_in: in bit;
		p , c_out: out bit);
		
end add_2;

architecture Behavioral of add_2 is

signal temp : bit_vector(4 downto 1);

begin
	
	temp(1) <= a xor b;
	temp(2) <= a and b;
	
	p <= temp(1) xor c_in;
	temp(3) <= c_in and temp(1);
	
	c_out <= temp(2) xor temp(3); 
	
end Behavioral;