library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_multiplier is
end entity;




architecture beh of tb_multiplier is

    signal y1, y2, y3 : std_logic;
	signal clk : std_logic;
	signal in_1, in_2 : std_logic_vector(7 downto 0);
	signal out_1 : std_logic_vector(15 downto 0);

begin

	in_1 <= "00010000";
	in_2 <= "00000010";

	process
    begin 
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
	
	
	
	process
	begin
		wait for 10 ns;
		y1 <= '0';
		y2 <= '0';
		y3 <= '0';
		
		wait for 90 ns;
		y1 <= '1';
		wait for 20 ns;
		y1 <= '0';
		y2 <= '1';
		wait for 220 ns;
		y2 <= '0';
		y3 <= '1';
		wait for 20 ns;
		y3 <= '0';
		
		wait;
	end process


dut2: multiplier_operating port map(clk => clk, din_1 => in_1, din_2 => in_2, dout => out_1, y1 => y1, y2 =>y2 , y3 => y3);



end beh;