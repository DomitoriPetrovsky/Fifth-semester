

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity adder_1 is
	generic(N : natural);
	Port(A, B : in std_logic_vector(N-1 downto 0);
		C : out std_logic_vector(N-1 downto 0));
end adder_1;


architecture beh of adder_1 is


begin 

u0: process(A, B)

	variable sum_sat : signed(N-1 downto 0);
	variable sum : signed(N downto 0);

	begin
		sum_sat := (others => '0');
		sum := resize(signed(A), N+1)  +resize(signed(B), N+1);
		
		if sum(N) /= sum_sat(N-1) then
			sum_sat(N-1) := sum(N);
			sum_sat(N-2 downto 0) := (others => sum(N-1));
		else
			sum_sat := sum(N-1 downto 0);
		end if;
			
		C <= std_logic_vector(sum_sat);

end process;

end beh;

