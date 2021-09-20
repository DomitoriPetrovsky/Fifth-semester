
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.automat_states.all;

entity moor is
	port (
		clk : in std_logic;
		Z: in fsm_in_type;
		W : out fsm_out_type);
		
end moor;

architecture rtl of moor is

type automat_st is (a1, a2, a3);
signal state : automat_st;
signal next_state : automat_st := a1;

begin
	
	process(state , Z)
	begin 
	
	if (state = a1) then 
		case Z is 
			when z1 =>
				next_state <= a1;
			when z2 =>
				next_state <= a3;
			when z3 =>
				next_state <= a2;
		end case;
	
	elsif (state = a2) then 
		case Z is 
			when z1 =>
				next_state <= a1;
			when z2 =>
				next_state <= a1;
			when z3 =>
				next_state <= a2;
			end case;
	
	elsif (state = a3) then
		case Z is 
			when z1 =>
				next_state <= a2;
			when z2 =>
				next_state <= a2;
			when z3 =>
				next_state <= a3;
			end case;
	end if;	
	
	end process;
	
	process(clk)
	begin 
		if rising_edge(clk) then 
			
			state <= next_state;
		
		end if;
	
	
	end process;
	
	W <= w2 when (state = a1) else 
		w3 when (state = a2) else 
		w1 when (state = a3) else o;
	
	
	
end rtl;