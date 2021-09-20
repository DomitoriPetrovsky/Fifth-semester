
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity N is
	port (
		A: in std_logic;
		Y : out std_logic);
		
end N;

architecture Behavioral of N is

begin
	
	Y <= (Not A)  after 1 ns;
	
end Behavioral;