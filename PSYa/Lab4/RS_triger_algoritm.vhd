
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RS_triger_algoritm is
	port (
		R, S: in std_logic;
		NQ : out std_logic);
		
end RS_triger_algoritm;

architecture partial_description of RS_triger_algoritm is

signal value : std_logic;

begin
	
	NQ <= value;
	
	process
	begin
	
		wait for 6 ns;
		
		if (R = '1') then
		
			value <= '1';
		
		elsif (S = '1' and R = '0') then
			
			value <= '0';
			
		end if;
	
	
	end process;
	
end partial_description;




architecture full_description of RS_triger_algoritm is

signal value : std_logic;

begin
	
	NQ <= value;
	
	process
	begin
		wait for 6 ns;
		
		if (R = '1' and (S = '1' or S ='0')) then
		
			value <= '1';
		
		elsif (S = '1' and R = '0') then
			
			value <= '0';
			
		elsif (R = '0' and S = '0') then
		
			value <= value;
		
		end if;
	
	
	end process;
	
end full_description;