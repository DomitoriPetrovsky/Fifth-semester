
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity INV is
	port (
		A: in std_logic;
		Y : out std_logic);
		
end INV;

architecture Behavioral of INV is

begin
	
	Y <= (Not A)  after 2 ns;
	
end Behavioral;