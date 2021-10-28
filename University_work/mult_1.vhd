
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mult_1 is
	generic(bitness : natural;
			int_part : natural);
	Port(A, B : in std_logic_vector(bitness-1 downto 0);
		C : out std_logic_vector(bitness-1 downto 0));
end mult_1;


architecture beh of mult_1 is

signal temp1 : std_logic_vector(2*bitness-1 downto 0);
signal temp2 :  std_logic_vector(bitness-1 downto 0);
begin 
temp2(bitness-1) <= temp1(2*bitness-1);
temp2(bitness-2 downto 0) <= temp1((2*bitness-int_part-3) downto (bitness-int_part-1)) ;
C <= temp2;


u0: process(A, B)

	variable mult : signed(2*bitness-1 downto 0);
	
	begin
	
		mult := signed(A)*signed(B);
			
		temp1 <= std_logic_vector(mult);

end process;

end beh;
