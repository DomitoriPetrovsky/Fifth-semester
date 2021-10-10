
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mult_1 is
	generic(N : natural);
	Port(A, B : in std_logic_vector(N-1 downto 0);
		C : out std_logic_vector(N-1 downto 0));
end mult_1;


architecture beh of mult_1 is


begin 

u0: process(A, B)

	variable mult : signed(2*N-1 downto 0);
	
	begin
	
		mult := signed(A)*signed(B);
			
		C <= std_logic_vector(mult(2*N-2 downto N-1));

end process;

end beh;
