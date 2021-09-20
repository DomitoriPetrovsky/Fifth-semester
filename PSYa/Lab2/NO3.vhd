
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NO3 is
	port (
		A, B, C : in std_logic;
		Y : out std_logic);
		
end NO3 ;

architecture Behavioral of NO3 is

begin
	
	Y <= not(A or B or C) after 4 ns;
	
end Behavioral;