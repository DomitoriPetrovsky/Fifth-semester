
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.automat_states.all;

entity tb_moor is
end tb_moor;

architecture Behavioral of tb_moor is

component  moor is
	port (
		clk : in std_logic;
		Z: in fsm_in_type;
		W : out fsm_out_type);
		
end component moor;

signal clk : std_logic;
signal Z:  fsm_in_type;
signal	W :  fsm_out_type;

begin
	
	
	process
	begin 
	
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	
	end process;
	

	process
	begin 
	
	z <= z1;
	wait for 10 ns;
	z <= z2;
	wait for 10 ns;
	z <= z1;
	wait for 10 ns;
	z <= z3;
	wait for 10 ns;
	z <= z2;
	wait for 10 ns;
	z <= z2;
	wait for 10 ns;
	z <= z1;
	wait for 10 ns;
	z <= z1;
	wait for 10 ns;
	z <= z3;
	wait for 10 ns;
	z <= z1;
	
	wait;
	
	
	end process;

	
	
struct:	moor
		port map (Z =>z, w => w, clk => clk);



	
	
end Behavioral;