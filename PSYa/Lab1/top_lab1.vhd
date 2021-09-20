----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:26 09/01/2021 
-- Design Name: 
-- Module Name:    top_lab1 - Behavioral 
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


entity top_lab1 is
	port(
		x : in std_logic_vector(1 to 4);
		y : out std_logic_vector(1 to 3)
		);
	
end top_lab1;

architecture Behavioral of top_lab1 is

begin
	y(1) <= x(1) or (x(2) and x(3) and x(4)) or (x(2) and (not x(3)) and (not x(4)));
	y(2) <= x(2) and ( x(1) or x(3) or x(4));
	y(3) <= x(4) xor x(2) xor (x(1) and x(2) and x(3) and x(4));
	
end Behavioral;

