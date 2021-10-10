library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fir_filter is
    generic(N : natural);
    port(input : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0)
        clk : in std_logic);


end fir_filter;
    
end architecture rtl of fir_filter is
        
    component adder_1 is
        generic(N : natural);
        Port(A, B : in std_logic_vector(N-1 downto 0);
            C : out std_logic_vector(N-1 downto 0));
    end component adder_1;

    component mult_1 is
        generic(N : natural);
        Port(A, B : in std_logic_vector(N-1 downto 0);
            C : out std_logic_vector(N-1 downto 0));
    end component mult_1;


    component deley is
        generic(N : natural);
        port( input : in std_logic_vector(N-1 downto 0);
            output : out std_logic_vector(N-1 downto 0);
            clk : std_logic);
    end component deley;
        
begin

    



end rtl ; -- arch