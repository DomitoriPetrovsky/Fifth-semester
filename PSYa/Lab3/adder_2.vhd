
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity adder_2 is
	port (
		a, b: in bit_vector(2 downto 1);
		p : out bit_vector(3 downto 1));
		
end adder_2;

architecture Behavioral of adder_2 is

component add_1 is
	port (
		a, b: in bit;
		p, c : out bit);
		
end component add_1;

component add_2 is
	port (
		a, b, c_in: in bit;
		p , c_out: out bit);
		
end component add_2;



signal c : bit;

begin
	
element_add_1 : add_1 port map (a =>a(1) , b =>b(1) , p =>p(1) , c =>c );
	
element_add_2 : add_2 port map (a => a(2), b => b(2), p => p(2), c_in => c, c_out => p(3));
	
end Behavioral;