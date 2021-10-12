library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_std.all;

library work;
use work.data_types.all;

entity tb_lab5 is 
end tb_lab5;

architecture beh of tb_lab5 is 

signal f1_in : func_1_in := (others => 0);
signal f1_out : func_1_return;
signal f1_max, f1_min, f1_max_pos, f1_min_pos : natural; 



signal f2_in : func_2_in ;
signal f2_out : func_2_return;
signal f2_colum_num : natural;
signal f2_min, f2_min_pos : natural;


signal p1_max, p1_min, p1_max_pos, p1_min_pos : natural;

signal p2_min, p2_min_pos : natural;


begin 

process
begin 
    f1_in <= (0,1,2,3,4,5,6,7); -- 7, 1
    wait for 10 ns;
    f1_in <= (5, 8, 2, 17, 25, 19, 31, 1); -- 31, 1
    wait for 10 ns;
    f1_in <= (13, 25, 8, 30, 11, 2, 5, 17); --30, 2
    wait for 10 ns;
    f1_in <= (7, 10, 21, 5, 6, 29, 17, 10); -- 29, 10
    wait for 10 ns;
    f1_in <= (21, 17, 24, 9, 6, 1, 3, 11);-- 24, 1
    wait for 10 ns;
    f1_in <= (1, 27, 4, 12, 26, 31, 3, 5);--31, 1
    wait for 10 ns;
    f1_in <= (20, 10, 17, 27, 30, 6, 6, 26);--30, 6
    wait for 10 ns;
    f1_in <= (8, 6, 1, 3, 13, 10, 24, 12); -- 24, 1
    wait for 10 ns;

    wait;
end process;


f1_out <= func_1(f1_in);

f1_max <= f1_out(0);
f1_min <= f1_out(1);
f1_max_pos <= f1_out(2);
f1_min_pos <= f1_out(3);

process
begin 

    f2_in <= ((0, 1, 2, 3, 4, 5, 6, 7),
            (5, 8, 2, 17, 25, 19, 31, 1),
            (13, 25, 8, 30, 11, 2, 5, 17),
            (7, 10, 21, 5, 6, 29, 17, 10),
            (21, 17, 24, 9, 6, 1, 3, 11),
            (1, 27, 4, 12, 26, 31, 3, 5),
            (20, 10, 17, 27, 30, 6, 6, 26),
            (8, 6, 1, 3, 13, 10, 24, 12));
    f2_colum_num <= 3;
    wait for 50 ns;
    f2_colum_num <= 2;
    wait;
end process;


f2_out <= func_2(f2_in, f2_colum_num) ;

f2_min <= f2_out(0);
f2_min_pos <= f2_out(1);

proc_1(f1_in, p1_max, p1_min, p1_max_pos, p1_min_pos);
proc_2(f2_in, f2_colum_num, p2_min, p2_min_pos);

end beh;