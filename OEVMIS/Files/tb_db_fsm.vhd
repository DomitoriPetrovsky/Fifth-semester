
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_db_fsm is		
end tb_db_fsm;

architecture Behavioral of tb_db_fsm is

    component db_fsm is
        port( clk, reset : in std_logic;
            sw : in std_logic;
            db : out std_logic
            );
    end component db_fsm;
    
    
    signal clk : std_logic;
    signal sw : std_logic;
    signal db : std_logic;

begin



    cl: process
	begin
	    clk<= '0';
	    wait for 5 ns;
	    clk <= '1';
	    wait for 5 ns;
	end process;
	
    process
        begin 
        sw <= '0';
        wait for 5 ms;
        sw <=  '1' ;
        wait for 1 ms;
        sw <=  '0' ;
        wait for 1 ms;
        sw <=  '1' ;
        wait for 1 ms;
        sw <=  '0' ;
        wait for 1 ms;
        sw <=  '1' ;
        wait for 1 ms;
        sw <=  '0' ;
        wait for 1 ms;

        sw <=  '1' ;
        wait for 20 ms;

        sw <=  '0' ;
        wait for 1 ms;
        sw <=  '1' ;
        wait for 1 ms;
        sw <=  '0' ;
        wait for 1 ms;
        sw <=  '1' ;
        wait for 1 ms;
        sw <=  '0' ;
        wait for 1 ms;
        wait;

    end process;

dut : db_fsm port map(clk => clk, 
                        reset => '0',
                        sw => sw,
                        db => db);

end Behavioral;