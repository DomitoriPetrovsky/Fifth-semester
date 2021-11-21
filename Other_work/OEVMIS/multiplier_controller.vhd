library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity multiplier_controller is
    port (
        clk     : in std_logic;
        start    : in std_logic;
        ready    : out std_logic;
        y1, y2, y3 :  out std_logic
        
    );
end multiplier_controller;


architecture rtl of multiplier_controller is

    signal rg_start : std_logic;
    signal rg_ready : std_logic := '1';
    --signal y1, y2, y3 : std_logic := '0';
    signal fl : std_logic;
    signal counter, temp_counter : natural;
begin

	ready <= rg_ready;
	rg_start <= start;
	
    process(clk)
    begin
        if (rising_edge(clk)) then 
             if (rising_edge(start)) then
                fl <= '1';
                rg_ready <= '0';
            end if;
            if counter = 1 then 
                y1 <= '1';
                y2 <= '0';
                y3 <= '0';
            elsif ((counter > 1) and (counter < 8)) then 
                y1 <= '0';
                y2 <= '1';
            elsif counter = 8 then 
                y2 <= '0';
                y3 <= '1';
                fl <= '0';
                rg_ready <= '1';
            else 
                y1 <= '0';
                y2 <= '0';
                y3 <= '0';
            end if;

        end if;

    end process;
    

    process(clk)
    begin
        if rising_edge(clk) then 
            if (fl = '1') then 
                if (counter = 9) then 
                    counter <= natural(0);
                else 
                    counter <= temp_counter;
                end if;
            end if;
        end if;
    end process;

    
    temp_counter <= counter + natural(1);



end rtl;