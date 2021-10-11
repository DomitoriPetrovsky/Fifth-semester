
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_std.all;

entity multiplier is 
    generic( N : natural );
    port (
            input_1 : std_logic_vector(N-1 downto 0);
            input_2 : std_logic_vector(N-1 downto 0);
            REQUEST : in std_logic;
            CLK : in std_logic;
            DONE : out std_logic;
            output_1 : out std_logic_vector(N*2-1 downto 0)
        );
end multiplier;


architecture rtl of multiplier is 

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
            cm_result : out std_logic;
            DONE : out std_logic
        );
end component multiplier_controller;



signal	cm_start : std_logic;
signal	cm_process : std_logic;
signal	cm_result : std_logic;
--signal	clk : std_logic;
signal	result : std_logic_vector(N*2-1 downto 0) :=(others => '0') ;
--signal  request : std_logic;

begin 

output_1 <= result;

dut_1	: multiplier_operaiting
		generic map (N)
		port map (mn => input_1,
					mt => input_2,
					cm_start => cm_start,
					cm_process => cm_process,
					cm_result => cm_result,
					clk => clk,
					do => result);

dut_2	: multiplier_controller
		generic map (N)
		port map(REQUEST => request, 
				CLK => clk, 
				cm_start => cm_start, 
				cm_process => cm_process, 
				cm_result => cm_result, 
                DONE => DONE);



end rtl;