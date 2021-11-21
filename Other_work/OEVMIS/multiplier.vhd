library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    port (
        clk   : in std_logic;
        din_1, din_2 : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(15 downto 0);
        start : in std_logic;
        ready : out std_logic
        
    );
end entity;

architecture rtl of multiplier is

component multiplier_controller is
    port (
        clk     : in std_logic;
        start    : in std_logic;
        ready    : out std_logic;
        y1, y2, y3 :  out std_logic 
        
    );
end component multiplier_controller;

component multiplier_operating is
    port (
        clk     : in std_logic;
        din_1, din_2    : in std_logic_vector(7 downto 0);
        dout    : out std_logic_vector(15 downto 0);
        y1, y2, y3 :  in std_logic
        
    );
end component multiplier_operating;

    signal y1, y2, y3 : std_logic;

begin

dut1: multiplier_controller port map(clk => clk, start => start, ready => ready, y1 =>y1, y2 =>y2, y3 => y3);


dut2: multiplier_operating port map(clk => clk, din_1 => din_1, din_2 => din_2, dout => dout, y1 => y1, y2 =>y2 , y3 => y3);
    

end architecture;