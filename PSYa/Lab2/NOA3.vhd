
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NOA3 is
	port (
		A, B, C, D: in std_logic;
		Y : out std_logic);
		
end NOA3;

architecture Behavioral of NOA3 is

begin
	
	Y <= Not (A or (B and C and D))  after 5 ns;
	
end Behavioral;