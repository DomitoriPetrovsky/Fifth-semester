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
        
        
    type data_buf is array (natural range <> ) of std_logic_vector(IWL - 1 downto 0);

    signal buf_line_x : data_buf(0 to order) := (others => (others => '0'));
    signal buf_line_y : data_buf(0 to order-1) := (others => (others => '0'));
    signal temp_out : std_logic_vector(CWL - 1 downto 0);

begin

    buf_line_proc_x: PROCESS (clk, reset)
    begin 
        if reset = '1' then 
            buf_line_x <= (others => (others => '0'));
        elsif rising_edge(clk) then 
            if ce = '1' then 
                buf_line_x(0)(IWL-2 downto 0) <= din(IWL - 2 downto 0);
                buf_line_x(0)(CWL) <= din(IWL-1);

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
        variable add_temp :  signed (CWL*2-1 downto 0);
        variable mult_temp: signed (CWL*2-1 downto 0);

    begin 
        add_temp <= (others => '0');
        FOR i IN 0 TO order LOOP
            mul_temp := signed(buf_line_x(i)) * coeffs_B(i);
            add_temp := add_temp + mul_temp;
        END LOOP;

        FOR i IN 0 TO order-1 LOOP
            mul_temp := signed(buf_line_y(i)) * coeffs_A(i+1);
            add_temp := add_temp + mul_temp;
        END LOOP;
        
        temp_out(CWL-1) <= add_temp(CWL*2-1);
        temp_out(CWL-2 downto 0) <= add_temp(CWL+IWL-1 downto IWL);

    end process;

    dout(IWL-1) <=temp_out(CWL-1); 
    dout(IWL-2 downto 0) <= temp_out(IWL-2 downto 0);

end rtl ; -- arch