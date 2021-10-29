
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NOR_1 is
	generic (deley_a : time := 5 ns;
			deley_b : time := 1 ns);
	port (
		A, B: in std_logic;
		Y : out std_logic);
		
end NOR_1;

architecture Behavioral of NOR_1 is

	signal temp_a, temp_b : std_logic;
	
begin
	
	temp_a <= A after deley_a;
	temp_b <= B after deley_b;
	
	Y <= (Not (temp_a or temp_b))  after 2 ns;
	
end Behavioral;