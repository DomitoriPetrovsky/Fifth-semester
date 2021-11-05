library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fir_filter is
    generic(bitness : natural:= 16;
            filter_order : natural := 5);
    port(input : in std_logic_vector(bitness-1 downto 0);
        output : out std_logic_vector(bitness-1 downto 0);
--        B_coef : in std_logic_vector(filter_order*bitnes-1 downto 0);
        clk : in std_logic);


end fir_filter;
    
architecture rtl of fir_filter is
        
    component adder_1 is
        generic(N : natural);
        Port(A, B : in std_logic_vector(N-1 downto 0);
            C : out std_logic_vector(N-1 downto 0));
    end component adder_1;

    component mult_1 is
        generic(bitness : natural;
			int_part : natural);
        Port(A, B : in std_logic_vector(bitness-1 downto 0);
            C : out std_logic_vector(bitness-1 downto 0));
    end component mult_1;

    component deley is
        generic(N : natural);
        port( input : in std_logic_vector(N-1 downto 0);
            output : out std_logic_vector(N-1 downto 0);
            clk : std_logic);
    end component deley;
        
    type wires is array (filter_order downto 0) of std_logic_vector(bitness-1 downto 0);

    signal z_out : wires;
    signal mult_out: wires;
    signal add_out : wires;
    signal b_cof : wires;

begin

    b_cof(0) <= "0000001110101100"; --  vhdl2008 fixed_pkg
    b_cof(1) <= "0001001001001110"; -- 
    b_cof(2) <= "0010101000000111";
    b_cof(3) <= "0010101000000111";
    b_cof(4) <= "0001001001001110";
    b_cof(5) <= "0000001110101100";


    z_out(0) <= input;

    add_out(0) <= mult_out(0);

    output <= add_out(filter_order);

-- wav matlab audioread,
-- mono wav
-- pcm16,
-- tb vhdl readline
-- writeline
-- audiowrite wav 

mult0_0:   mult_1  generic map(bitness)
            port map(   A => Z_out(0),
                        B => B_cof(0),
                        C => mult_out(0)); 


gen: for I in 0 to filter_order-1 generate -- if)))

del:    deley   generic map(bitness)
                port map(   input => z_out(I) , 
                            output => z_out(I+1), 
                            clk => clk);


mult:   mult_1  generic map(bitness)
                port map(   A => Z_out(I+1),
                            B => B_cof(I+1),
                            C => mult_out(I+1));

add:    adder_1   generic map(bitness)
                port map(   A => add_out(I),
                            B => mult_out(I+1),
                            C => add_out(I+1));


    end generate gen;









end rtl ; -- arch