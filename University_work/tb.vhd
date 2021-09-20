
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Tb is
end Tb;


architecture beh of Tb is

component adder_1 is
	generic(N : natural);
	Port(A, B : in std_logic_vector(N-1 downto 0);
		C : out std_logic_vector(N-1 downto 0));
end component adder_1;

component mult_1 is
	generic(N : natural);
	Port(A, B : in std_logic_vector(N-1 downto 0);
		C : out std_logic_vector(N-1 downto 0));
end component mult_1;

constant N : natural := 4;
signal a, b, add_res, mult_res : std_logic_vector(N-1 downto 0);

begin 

add: adder_1 generic map(N)
			port map(A, B, add_res);
mult: mult_1 generic map(N) 
			port map(A, B, mult_res);



u0: process
	begin 
	--представим что это дроби))))
	a <= "0001"; --		+0.125
	b <= "0001"; --		+0.125
	wait for 5 ns;
	a <= "1100"; --		-0.5
	b <= "1100"; --		-0.5
	wait for 5 ns;
	a <= "1100"; --		-0.5
	b <= "0100"; --		+0.5
	wait for 5 ns;
	a <= "1111"; --		-0.875
	b <= "0111"; --		+0.875
	wait for 5 ns;
	wait;
end process;

end beh;
