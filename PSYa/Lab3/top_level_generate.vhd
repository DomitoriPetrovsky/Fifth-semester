
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_level_generate is
	generic (N : natural);
	port (
		scheme_in: in bit_vector(3*N downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(2*N downto 1));
		
end top_level_generate;

architecture Behavioral of top_level_generate is

component scheme_element_to_generate is
	port (
		scheme_in : in bit_vector(3 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(2 downto 1));
		
end component scheme_element_to_generate;

signal wires : bit_vector(2 * (N+1) downto 1);

begin
	
	
gen_reg:
	for I in N downto 1 generate
	
	element: scheme_element_to_generate
			port map (scheme_in => scheme_in(3*I downto 3*I-2),
				c_in => wires(2*(I+1) downto 2*(I+1)-1), 
				c_out => wires(2*I downto 2*I-1), 
				scheme_out => scheme_out(2*I downto 2*I-1));
	
	
	end generate gen_reg;
	
	wires(2*(N + 1) downto 2*(N + 1)-1 ) <= c_in;
	c_out <= wires(2 downto 1);
	
	
	
	
	
end Behavioral;