
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_std.all;



entity multiplier_operaiting is
	generic(N  : natural); 
	port (
		mn : in std_logic_vector(N-1 downto 0);
		mt : in std_logic_vector(N-1 downto 0);
		cm_start : in std_logic;
		cm_process : in std_logic;
		cm_result : in std_logic;
		clk : in std_logic;
		do : out std_logic_vector(N*2-1 downto 0)
		);
		
end multiplier_operaiting;

architecture rtl of multiplier_operaiting is
signal rg_mn : std_logic_vector(N-2 downto 0);
signal rg_mt : std_logic_vector(N*2-3 downto 0);
signal rg_zn : std_logic;
signal rg_sum : std_logic_vector(N*2-3 downto 0);
signal temp_sum : std_logic_vector(N*2-3 downto 0);


begin
	
load_rg_mn_and_shift: process(clk)
		begin 	
			if(rising_edge(clk)) then
				if (cm_start = '1') then 
				
					rg_mn <= mn(N-2 downto 0);
					
				elsif (cm_process = '1') then 
					rg_mn <= '0' & rg_mn(N-2 downto 1) ;
				end if;
			end if;
		end process ;

load_rg_mt_and_shift: process(clk)
		begin 	
			if(rising_edge(clk)) then
				if (cm_start = '1') then 
				
					rg_mt(N*2-3 downto N-1) <= (others => '0');
					rg_mt(N-2 downto 0) <= mt(N-2 downto 0);
					
				elsif (cm_process = '1') then 
					rg_mt <= rg_mt(N*2-4 downto 0) & '0';
				end if;
			end if;
		end process ;

	
end_of_proc: process(clk)
		begin 	
			if(rising_edge(clk)) then
				if (cm_result = '1') then
					
					do(N*2-1) <= rg_zn;
					do(N*2-2) <= rg_zn;
					do(N*2-3 downto 0) <= rg_sum;
					
				end if;
			end if;
		end process ;
		
		

			

proc_sum : process(clk)
			begin 
				if(rising_edge(clk)) then
					if (cm_start = '1') then 

						rg_zn <= mt(N-1) xor mn(N-1);
						rg_sum <= (others => '0');
					
					elsif (cm_process = '1') then 
					
						if (rg_mn(0) = '1') then 
						
							rg_sum <= temp_sum;
							
						end if;
					elsif (cm_result = '1') then
					
						do(N*2-1) <= rg_zn;
						do(N*2-2) <= rg_zn;
						do(N*2-3 downto 0) <= rg_sum;
					
					end if;	
					
				end if;
		
			end process ;
	
	temp_sum <= std_logic_vector(unsigned(rg_sum) + unsigned(rg_mt)); ----------
	
end rtl;