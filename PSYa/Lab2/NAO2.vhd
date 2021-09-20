
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NAO2 is
	port (
		A, B, C: in std_logic;
		Y : out std_logic);
		
end NAO2;

architecture Behavioral of NAO2 is

begin
	
	Y <= Not (A and (B or C ))  after 3 ns;
	
end Behavioral;