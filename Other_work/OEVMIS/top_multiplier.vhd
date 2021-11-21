library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--btn(0) - ввод множимого
--btn(1) - ввод множителя
--btn(2) - выполнение операции
--btn(3) - 0 показаны малдшие разряды, 1 старшие 

entity top_multiplier is
port(
    CLK : in tsd_logic;
    
    BTN : in std_logic_vector(3 downto 0); 
    LED : out std_logic_vector(7 downto 0);
    SW : in std_logic_vector(7 downto 0)
);

end entity;



architecture beh of top_multiplier is

    component multiplier is
    port (
        clk   : in std_logic;
        din_1, din_2 : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(15 downto 0);
        start : in std_logic;
        ready : out std_logic
        
    );
end component multiplier;

    signal clk : std_logic;
    signal in_1, in_2: std_logic_vector(7 downto 0) := (others => '0');
    signal out_1 : std_logic_vector(15 downto 0);
    signal ready : std_logic;
begin

    process (clk) -- ввод результата
    begin
        if(rising_edge(clk)) then
            if (ready = '1') then 
                if(BTN(0) = '1') then 
                    in_1 <=  SW;
                end if;
                if(BTN(1) = '1') then 
                    in_2 <=  SW;
                end if;
            end if;
        end if;
    end process;
    
    process (clk) -- вывод результата
    begin
        if(rising_edge(clk)) then           
            if(BTN(3) = '0') then 
                LED <=  out_1(15 downto 8);
            end if;
            if(BTN(3) = '1') then 
                LED <=  out_1(7 downto 0);
            end if;
        end if;
    end process;


    dut: multiplier port map(clk => clk, din_1 => in_1, din_2 => in_2, dout => out_1, start => BTN(2), ready => ready );
 
end beh;