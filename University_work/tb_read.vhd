
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library STD;
use std.textio.all;

entity tb_read is
end tb_read;


architecture beh of tb_read is

	signal value1_std_logic_8_bit, value2_std_logic_8_bit : std_logic_vector(7 downto 0);
	SIGNAL output : std_logic_vector(15 downto 0);
	signal clk   : std_logic;
	signal signal_good : boolean;


begin 
process
begin 
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 5 ns;
end process;




	p_read : process(clk)
	--------------------------------------------------------------------------------------------------
		constant NUM_COL                : integer := 2;   -- number of column of file
		type t_integer_array       is array(integer range <> )  of integer;
		file test_vector                : text open read_mode is "file_name.txt";
		variable row                    : line;
		--variable v_data_read            : t_integer_array(1 to NUM_COL);
		variable v_data_read            : bit_vector(15 downto 0);
		variable v_data_row_counter     : integer := 0;
		variable GOOD : boolean;
	begin
  
--		if(rstb='0') then
--			v_data_row_counter     := 0;
--			v_data_read            := (others=> -1);
--			i_op1                  <= (others=>'0');
--			i_op2                  <= (others=>'0');
	------------------------------------
		--els
		if(rising_edge(clk)) then
    
--			if(ena = '1') then  -- external enable signal
    
	-- read from input file in "row" variable
			if(not endfile(test_vector)) then
				v_data_row_counter := v_data_row_counter + 1;
				readline(test_vector,row);
			end if;
    
    -- read integer number from "row" variable in integer array
	--		for kk in 1 to NUM_COL loop
				
				HREAD(row,v_data_read, good);
	--		end loop;
			--value1_std_logic_8_bit    <= conv_std_logic_vector(v_data_read(1),8);
			--value2_std_logic_8_bit    <= conv_std_logic_vector(v_data_read(2),8);
--			end if;
			output <= to_stdlogicvector(v_data_read);
			signal_good <= good;
		end if;
	end process p_read;

end beh;
