
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NA3O2 is
	port (
		A, B, C, D: in std_logic;
		Y : out std_logic);
		
end NA3O2;

architecture Behavioral of NA3O2 is

begin
	
	Y <= Not (A and B and (C or D))  after 4 ns;
	
end Behavioral;