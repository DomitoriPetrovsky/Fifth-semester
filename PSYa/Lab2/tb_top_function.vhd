
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_top_function is
		
end tb_top_function;

architecture Behavioral of tb_top_function is

component top_function is
	port (X1, X2, X3 , X4 : in std_logic;
			Y1, Y2, Y3, Y4 : out std_logic);
		
end component top_function;

signal input : std_logic_vector(1 to 4);
signal output : std_logic_vector(1 to 4);

begin
	
	process
	begin
	
	input <= "0000";
	wait for 200 ns;
	input <= "1111";
	wait for 200 ns;
	wait;
	end process;
	
	
	
nun: top_function port map(input(1),input(2),input(3),input(4),
							output(1),output(2),output(3),output(4));
	
	
	
end Behavioral;