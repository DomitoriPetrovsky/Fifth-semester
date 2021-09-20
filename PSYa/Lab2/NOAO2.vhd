
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NOAO2 is
	port (
		A, B, C, D : in std_logic;
		Y : out std_logic);
		
end NOAO2 ;

architecture Behavioral of NOAO2 is

begin
	
	Y <= not(A or (B and (C or D))) after 4 ns;
	
end Behavioral;