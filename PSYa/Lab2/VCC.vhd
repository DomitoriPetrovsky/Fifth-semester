
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity VCC is
	port (Y : out std_logic);
		
end VCC;

architecture Behavioral of VCC is

begin
	
	Y <= '1'  after 1 ns;
	
end Behavioral;