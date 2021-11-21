
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Tb is
end Tb;


architecture beh of Tb is

	component fir_filter is
		generic(bitness : natural:= 16;
				filter_order : natural := 5);
		port(input : in std_logic_vector(bitness-1 downto 0);
			output : out std_logic_vector(bitness-1 downto 0);
	--        B_coef : in std_logic_vector(filter_order*bitnes-1 downto 0);
			clk : in std_logic);
	end component fir_filter;

constant N   : natural := 16;
signal in_1  : std_logic_vector(N-1 downto 0):= (others => '0'); 
signal out_1 : std_logic_vector(N-1 downto 0);
signal clk   : std_logic;
signal flag  : std_logic := '0';
begin 

filtr: fir_filter generic map(16, 5)
				port  map(input => in_1,
							output => out_1,
							clk => clk);


cl: process
	begin 
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;

end process;

process(clk)
begin
	if (rising_edge(clk)) then 
		if flag = '0' then 
			in_1(N-1) <= '0';
			in_1(N-2 downto 0) <= (others => '1');
			flag <= '1';
		else 	
			in_1 <= (others => '0');
		end if;

	end if;
end process;



end beh;
