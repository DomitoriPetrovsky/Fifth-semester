
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity scheme_element is
	port (
		scheme_in : in bit_vector(6 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(4 downto 1));
		
end scheme_element;

architecture Behavioral of scheme_element is

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


signal temp_add_in_1_b, temp_add_in_2_b: bit_vector(2 downto 1);
signal temp_add_in_1_a, temp_add_in_2_a: bit_vector(2 downto 1);
signal temp_add_out_1, temp_add_out_2 : bit_vector(3 downto 1);

signal temp_log_out_1, temp_log_out_2 : bit_vector(2 downto 1);
signal temp_log_in_1, temp_log_in_2 : bit_vector(2 downto 1);

begin
	
	temp_add_in_1_b <= c_in(2) & scheme_in(6);
	temp_add_in_2_b <= temp_add_out_1(3) & scheme_in(3);
	
	temp_add_in_1_a <= scheme_in(5 downto 4);
	temp_add_in_2_a <= scheme_in(2 downto 1);
	
	temp_log_in_1 <= temp_add_out_1(2) & c_in(1);
	temp_log_in_2 <= temp_add_out_2(2) & temp_log_out_1(1);
	
	c_out <= temp_add_out_2(3) & temp_log_out_2(1);
	
	scheme_out <= temp_add_out_1(1) & temp_log_out_1(2) & temp_add_out_2(1) & temp_log_out_2(2);
	
	

element_add_1: adder_2 
	port  map(a => temp_add_in_1_a, 
			b => temp_add_in_1_b,
			p => temp_add_out_1);
			
element_add_2: adder_2 
	port  map(a => temp_add_in_2_a, 
			b => temp_add_in_2_b,
			p => temp_add_out_2);
	
element_log_1: logic_element
	port map(x => temp_log_in_1, 
			y => temp_log_out_1);
			
element_log_2: logic_element
	port map(x => temp_log_in_2, 
			y => temp_log_out_2);

	
	
end Behavioral;