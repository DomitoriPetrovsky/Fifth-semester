library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity multiplier_operating is
    port (
        clk     : in std_logic;
        din_1, din_2    : in std_logic_vector(7 downto 0);
        dout    : out std_logic_vector(15 downto 0);
        y1, y2, y3 :  in std_logic
        
    );
end multiplier_operating;

architecture rtl of multiplier_operating is

    signal rg_multiplier : std_logic_vector( 6 downto 0); --множитель
    signal rg_multiplicative : std_logic_vector(13 downto 0); -- множимое 
    signal rg_summ : std_logic_vector(13 downto 0);
    signal rg_sign : std_logic;
begin

    process(clk)
    begin
        if (rising_edge(clk)) then 
            if (y1 = '1') then 
                rg_multiplier <= din_1(6 downto 0);
                rg_multiplicative(13 downto 7) <= din_2(6 downto 0);
                rg_multiplicative(6 downto 0) <= (others => '0');
                rg_sign <=  din_1(7) xor din_2(7);

                rg_summ <= (others => '0');
            end if;
            if (y2 = '1') then 
                rg_multiplicative <= '0' & rg_multiplicative(13 downto 1);
                rg_multiplier <= rg_multiplier(5 downto 0) & '0';

                if (rg_multiplier(6) = '1') then 
                    rg_summ <= std_logic_vector(unsigned(rg_summ) + unsigned(rg_multiplicative));
                end if;
            end if;

            if (y3 = '1') then 
                dout(15 downto 14) <= rg_sign & rg_sign;
                dout(13 downto 0) <= rg_summ;

            end if;

        end if;
    end process;





end rtl;