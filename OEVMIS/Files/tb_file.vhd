
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_file is		
end tb_file;

architecture Behavioral of tb_file is

component multiplier is 
    generic( N : natural );
    port (
            input_1 : std_logic_vector(N-1 downto 0);
            input_2 : std_logic_vector(N-1 downto 0);
            REQUEST : in std_logic;
            CLK : in std_logic;
            DONE : out std_logic;
            output_1 : out std_logic_vector(N*2-1 downto 0)
        );
end component multiplier;



constant N : natural := 8;
signal  mn : std_logic_vector(N-1 downto 0);
signal	mt : std_logic_vector(N-1 downto 0);
signal	Result : std_logic_vector(N*2-1 downto 0);
signal	clk : std_logic;
signal	done : std_logic;
signal  request : std_logic;

begin
	
cl: process
	begin
	clk<= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
	
	end process;
	
pr:	process
	begin 
	request <= '0';

	mn <= "00000010";
	mt <= "00000010";
	
	wait for 21 ns;
	request <= '1';
	wait for 18 ns;
	request <= '0';
	wait for 150 ns;

	mn <= "10000011";
	mt <= "10000100";
	
	wait for 10 ns;
	request <= '1';
	wait for 18 ns;
	request <= '0'; 

	wait;

	end process;
	

	
	
dut	: multiplier
		generic map (N)
		port map (input_1 => mn,
					input_2 => mt,
					clk => clk,
					output_1 => Result,
					DONE => done,
					request => request);

	
	
end Behavioral;