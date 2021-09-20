
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NOR_1 is
	port (
		A, B: in std_logic;
		Y : out std_logic);
		
end NOR_1;

architecture Behavioral of NOR_1 is

begin
	
	Y <= (Not (A or B))  after 2 ns;
	
end Behavioral;