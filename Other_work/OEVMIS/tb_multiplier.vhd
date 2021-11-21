library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_multiplier is
end entity;



architecture beh of tb_multiplier is

    component multiplier is
    port (
        clk   : in std_logic;
        din_1, din_2 : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(15 downto 0);
        start : in std_logic;
        ready : out std_logic
        
    );
end component multiplier;

    signal clk : std_logic;
    signal in_1, in_2 , const: std_logic_vector(7 downto 0);
    signal out_1 : std_logic_vector(15 downto 0);
    signal start, ready : std_logic;
begin


    const <= "00000010";

    process
    begin 
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
            in_1 <=  "00010000";
            in_2 <=  "00000010";

    process 
    begin	
			start <= '0';
			wait for 50 ns;
            start <= '1';
            wait for 30 ns;
            start <= '0';
			wait;

           --in_1 <= std_logic_vector(unsigned(in_1) + unsigned(const));
        
    end process;

    dut: multiplier port map(clk => clk, din_1 => in_1, din_2 => in_2, dout => out_1, start => start, ready => ready );
 
end beh;