
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ex2 is
	port (
		A, B : in std_logic;
		Y : out std_logic);
		
end ex2;

architecture Behavioral of ex2 is

begin
	
	Y <= (A and (Not B)) or ((Not A) and B) after 5 ns;
	
end Behavioral;