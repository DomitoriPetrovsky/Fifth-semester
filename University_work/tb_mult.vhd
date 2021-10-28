library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_mult is
end tb_mult;


architecture beh of tb_mult is

    component mult_1 is
        generic(bitness : natural; int_part : natural);
        Port(A, B : in std_logic_vector(bitness-1 downto 0);
            C : out std_logic_vector(bitness-1 downto 0));
    end component mult_1;

    constant bits : natural := 5;
    constant int_part : natural := 2;

    signal A, B, C: std_logic_vector(bits-1 downto 0);
begin 

process
begin
    A <= "00100";
    B <= "00100";
    wait for 10 ns;

    A <= "00010";
    B <= "00010";
    wait for 10 ns;

    A <= "10010";
    B <= "10010";
    wait for 10 ns;

end process;

dot: mult_1 generic map(bits, int_part)
            port map(A, B, C);



end beh;