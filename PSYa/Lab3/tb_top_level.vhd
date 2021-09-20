
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_top_level is
		
end tb_top_level;

architecture Behavioral of tb_top_level is

component top_level is
	port (
		top_level_in : in bit_vector(12 downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		top_level_out : out bit_vector(8 downto 1));
		
end component top_level;

component top_level_generate is
	generic (N : natural);
	port (
		scheme_in: in bit_vector(3*N downto 1);
		c_in : in bit_vector (2 downto 1);
		c_out: out bit_vector(2 downto 1);
		scheme_out : out bit_vector(2*N downto 1));
		
end component top_level_generate;


signal input : bit_vector(12 downto 1);
signal output_1, output_2 : bit_vector(8 downto 1);
signal c_in, c_out_1, c_out_2 : bit_vector(2 downto 1);

begin
	
dut_1	: top_level 
		port map (top_level_in => input,
					c_in => c_in,
					c_out => c_out_1,
					top_level_out => output_1);
					
dut_2	: top_level_generate 
		generic map(N => 4)
		port map (scheme_in => input,
					c_in => c_in,
					c_out => c_out_2,
					scheme_out => output_2);					
					
	
	input <= "110010111000";
	c_in <= "00";
	
	
	
	
end Behavioral;