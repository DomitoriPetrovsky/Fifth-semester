
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity scheme_element_to_generate is
	port (
		scheme_in : in bit_vector(3 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(2 downto 1));
		
end scheme_element_to_generate;

architecture Behavioral of scheme_element_to_generate is

component adder_2 is
	port (
		a, b: in bit_vector(2 downto 1);
		p : out bit_vector(3 downto 1));
		
end component adder_2;

component logic_element is
	port (
		x: in bit_vector(2 downto 1);
		y : out bit_vector(2 downto 1));
		
end component logic_element;


signal temp_add_in_b: bit_vector(2 downto 1);
signal temp_add_in_a: bit_vector(2 downto 1);
signal temp_add_out : bit_vector(3 downto 1);

signal temp_log_out : bit_vector(2 downto 1);
signal temp_log_in  : bit_vector(2 downto 1);

begin
	
	temp_add_in_b <= c_in(2) & scheme_in(3);
	temp_add_in_a <= scheme_in(2 downto 1);
	
	temp_log_in <= temp_add_out(2) & c_in(1);
	
	c_out <= temp_add_out(3) & temp_log_out(1);
	
	scheme_out <= temp_add_out(1) & temp_log_out(2);
	
	

element_add: adder_2 
	port  map(a => temp_add_in_a, 
			b => temp_add_in_b,
			p => temp_add_out);
	
element_log: logic_element
	port map(x => temp_log_in, 
			y => temp_log_out);
			
	
end Behavioral;