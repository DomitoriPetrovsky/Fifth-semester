----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:35 09/01/2021 
-- Design Name: 
-- Module Name:    test_top_lab1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity test_top_lab1 is
end test_top_lab1;

architecture Behavioral of test_top_lab1 is

component top_lab1 is
	port(
		x : in std_logic_vector(1 to 4);
		y : out std_logic_vector(1 to 3));	
end component top_lab1;

signal input : unsigned(1 to 4) := "0000";
signal output : std_logic_vector(1 to 3);

begin

process
	begin 
		wait for 10 ns;
		input <= input + 1;
end process;

nun: top_lab1 port map( std_logic_vector(input) , output);

end Behavioral;

