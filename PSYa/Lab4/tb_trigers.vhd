
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_trigers is
end tb_trigers;

architecture Behavioral of tb_trigers is

component RS_triger_structure is
	port (
		R, S: in std_logic;
		NQ : out std_logic);
		
end component RS_triger_structure;

component RS_triger_algoritm is
	port (
		R, S: in std_logic;
		NQ : out std_logic);
		
end component RS_triger_algoritm;

signal nq_1, nq_2, nq_3 : std_logic;
signal r, s : std_logic;

begin
	
	
	process
	begin 
	
	r <= '1';
	s <= '0';
	wait for 10 ns;
	
	
	r <= '0';
	s <= '0';
	wait for 10 ns;
	
	r <= '0';
	s <= '1';
	wait for 10 ns;
	
	r <= '0';
	s <= '0';
	wait for 10 ns;
	
	r <= '1';
	s <= '1';
	wait for 10 ns;
	
	r <= '0';
	s <= '0';
	wait for 10 ns;
	
	r <= '0';
	s <= '1';
	wait for 10 ns;
	
	wait;
	
	
	end process;
	
	
	
	
struct:	RS_triger_structure
		port map (R => r, S => s, NQ => nq_1);

algoritm_full: RS_triger_algoritm
		port map (R => r, S => s, NQ => nq_2);

algoritm_partial: RS_triger_algoritm
		port map (R => r, S => s, NQ => nq_3);

	
	
end Behavioral;



configuration config_trigers of tb_trigers is
	for Behavioral 
		for algoritm_full: RS_triger_algoritm 
			use entity work.RS_triger_algoritm(full_description);
		end for;
		
		for algoritm_partial: RS_triger_algoritm 
			use entity work.RS_triger_algoritm (partial_description);
		end for;

	end for;
	
end config_trigers;