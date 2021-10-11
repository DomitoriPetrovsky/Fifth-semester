
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_std.all;

entity multiplier_controller is 
    generic( N : natural );
    port (
            REQUEST : in std_logic;
            CLK : in std_logic;
            cm_start : out std_logic; 
            cm_process: out std_logic; 
            cm_result : out std_logic;
            DONE : out std_logic
        );
end multiplier_controller;


architecture rtl of multiplier_controller is 

    signal rg_done : std_logic := '1';
    signal fl_request : std_logic;
    signal counter : natural range 0 to N+3;
    signal temp_counter : natural range 0 to N+3;

begin

    process(clk, REQUEST)
    begin 
        if (rising_edge(REQUEST)) then
            fl_request <= '1';
            rg_done <= '0';
        end if;

        if (rising_edge(clk)) then 
            if counter = 1 then 

                cm_start <= '1';
                cm_process <= '0';
                cm_result <= '0';

            elsif ((counter > 1) and (counter < N)) then 

                cm_start <= '0';
                cm_process <= '1';

            elsif counter = N then 

                cm_process <= '0';
                cm_result <= '1';
                fl_request <= '0';
                rg_done <= '1';

            else 
                cm_start <= '0';
                cm_process <= '0';
                cm_result <= '0';
                

            end if;

        end if;
    end process;
    
    DONE <= rg_done;

    process(clk)
    begin
        if rising_edge(clk) then 
            if (fl_request = '1') then 
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