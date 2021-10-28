library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity deley is
    generic(N : natural);
    port( input : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0);
        clk : std_logic);
end deley;


architecture rtl of deley is
    signal reg: std_logic_vector(N-1 downto 0):= (others => '0');
begin 
    process(clk)
    begin 
        if (rising_edge(clk)) then 
            reg <= input;
        end if;


    end process;

output <= reg;
end rtl;