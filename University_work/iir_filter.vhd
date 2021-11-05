library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY WORK;
use work.iir_config.all;

entity iir_filter is
    generic(
        IWL : natural;
        order : natural;
        CWL : natural 
    );
    port(
        din : in std_logic_vector(IWL-1 downto 0);
        dout : out std_logic_vector(IWL-1 downto 0);
        coeffs_B : in VECTOR_OF_STD_L_V;
        coeffs_A : in VECTOR_OF_STD_L_V;
        reset : in std_logic;
        ce : in std_logic;
        clk : in std_logic
    );


end iir_filter;
    
architecture rtl of iir_filter is
        
        
    type data_buf is array (natural range <> ) of std_logic_vector(CWL-1 downto 0);

    signal buf_line_x : data_buf(0 to order) := (others => (others => '0'));
    signal buf_line_y : data_buf(0 to order) := (others => (others => '0'));
    signal temp_out : std_logic_vector(CWL-1 downto 0);

begin

    buf_line_proc_x: PROCESS (clk, reset)
    begin 
        if reset = '1' then 
            buf_line_x <= (others => (others => '0'));
        elsif rising_edge(clk) then 
            if ce = '1' then
				buf_line_x(0)(CWL-1) <= din(IWL-1);
				buf_line_x(0)(CWL-1 downto IWL-1) <= (others => '0');
                buf_line_x(0)(IWL-2 downto 0) <= din(IWL-2 downto 0);

                buf_line_x(1 to order) <= buf_line_x (0 to order-1); 
            end if;
        end if;

    end process;
    
    buf_line_proc_y: PROCESS (clk, reset)
    begin 
        if reset = '1' then 
            buf_line_y <= (others => (others => '0'));
        elsif rising_edge(clk) then 
            if ce = '1' then 
                buf_line_y(0) <= temp_out;

                buf_line_y(1 to order-1) <= buf_line_y (0 to order-2); 
            end if;
        end if;

    end process;


    sum_proc : process ( buf_line_x, buf_line_y )
        variable add_temp : signed (CWL*2-1 downto 0);
        variable mult_temp: signed (CWL*2-1 downto 0);
		
		variable round : signed (CWL*2-1 downto 0);
		variable overfilling : signed (CWL-IWL downto 1) := (others => '0');
    begin 
		round(CWL*2-1 downto IWL-1) := (others => '0');
		round(IWL-2) := '1';
		round(IWL-3 downto 0) := (others => '0');
        add_temp := (others => '0');
        FOR i IN 0 TO order LOOP
            mult_temp := signed(buf_line_x(i)) * signed(coeffs_B(i));
            add_temp := add_temp + mult_temp;
        END LOOP;

        FOR i IN 0 TO order-1 LOOP
            mult_temp := signed(buf_line_y(i)) * signed(coeffs_A(i+1));
            add_temp := add_temp + mult_temp;
        END LOOP;
        --
		--
		--
		--
		add_temp := add_temp + round;
		--
		--
		--
		--
		if(add_temp(CWL*2-1) = not(add_temp(CWL*2-2))) then 
		
			temp_out <= (others => add_temp(CWL*2-1) );
		
		elsif ((add_temp(CWL*2-3 downto IWL+CWL) /= overfilling) or (add_temp(CWL*2-3 downto IWL+CWL) /= not(overfilling))) then 
			
			temp_out <= (others => add_temp(CWL*2-1) );
			
		else 
			temp_out(CWL-1) <= std_logic(add_temp(CWL*2-1));
			temp_out(CWL-2 downto 0) <= std_logic_vector(add_temp(CWL+IWL-3 downto IWL-1));
		
		end if;
        --temp_out(CWL-1) <= std_logic(add_temp(CWL*2-1));
        --temp_out(CWL-2 downto 0) <= std_logic_vector(add_temp(CWL+IWL-3 downto IWL-1));
		-- IWL 16  = CWL 20
		--temp_out(CWL-1 down to 0) <= std_logic_vector(add_temp(CWL-1, CWL+IWL-2 downto IWL));
    end process;

    dout(IWL-1) <=temp_out(CWL-1); 
    dout(IWL-2 downto 0) <= temp_out(IWL-2 downto 0);

end rtl ; -- arch