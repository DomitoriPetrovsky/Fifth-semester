
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NO3A2 is
	port (
		A, B, C, D : in std_logic;
		Y : out std_logic);
		
end NO3A2 ;

architecture Behavioral of NO3A2 is

begin
	
	Y <= not(A or B or (D and C)) after 5 ns;
	
end Behavioral;