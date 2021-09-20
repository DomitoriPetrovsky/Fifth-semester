
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_level is
	port (
		top_level_in : in bit_vector(12 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		top_level_out : out bit_vector(8 downto 1));
		
end top_level;

architecture Behavioral of top_level is

component scheme_element is
	port (
		scheme_in : in bit_vector(6 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(4 downto 1));
		
end component scheme_element;

signal temp : bit_vector(2 downto 1);

begin
	
	
element_1 : scheme_element 
		port map (scheme_in => top_level_in (12 downto 7),
				c_in => c_in,
				c_out => temp,
				scheme_out => top_level_out(8 downto 5));

element_2 : scheme_element 
		port map (scheme_in => top_level_in (6 downto 1),
				c_in => temp,
				c_out => c_out,
				scheme_out => top_level_out(4 downto 1));
	
	
	
end Behavioral;