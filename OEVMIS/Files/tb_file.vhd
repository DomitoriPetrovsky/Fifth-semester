
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_file is		
end tb_file;

architecture Behavioral of tb_file is

component multiplier_operaiting is
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
		
end component multiplier_operaiting;

component multiplier_controller is 
    generic( N : natural );
    port (
            REQUEST : in std_logic;
            CLK : in std_logic;
            cm_start : out std_logic; 
            cm_process: out std_logic; 
            cm_result : out std_logic
        );
end component multiplier_controller;



constant N : natural := 8;
signal mn : std_logic_vector(N-1 downto 0);
signal	mt : std_logic_vector(N-1 downto 0);
signal	cm_start : std_logic;
signal	cm_process : std_logic;
signal	cm_result : std_logic;
signal	clk : std_logic;
signal	do : std_logic_vector(N*2-1 downto 0);
signal request : std_logic;
begin
	
cl: process
	begin
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	
	end process;
	
pr:	process
	begin 
	request <= '0';
	wait for 21 ns;
	request <= '1';
	wait for 18 ns;
	request <= '0'; 
	wait;
--	cm_start <= '0';
--	cm_process <= '0';
--	cm_result <= '0';
--	wait for 10 ns;
--	
--	cm_start <='1' ;
---	wait for 20 ns;
--	
--	cm_start <= '0';
--	cm_process <= '1';
--	wait for 70 ns;
--	
--
--	cm_process <= '0';
--	cm_result <= '1';
--	wait for 10 ns;
--	
--	cm_result <= '0';
--	
--	wait;
--
	end process;
	
	mn <= "00000010";
	mt <= "00000010";
	
	
dut_1	: multiplier_operaiting
		generic map (N)
		port map (mn => mn,
					mt => mt,
					cm_start => cm_start,
					cm_process => cm_process,
					cm_result => cm_result,
					clk => clk,
					do => do);

dut_2	: multiplier_controller
		generic map (N)
		port map(REQUEST => request, 
				CLK => clk, 
				cm_start => cm_start, 
				cm_process => cm_process, 
				cm_result => cm_result);
					
			
					
	
	
	
	
	
end Behavioral;