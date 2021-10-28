library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

LIBRARY WORK;
use work.iir_config.all;



entity tb_iir is 
end tb_iir;

architecture rtl of tb_iir is

component iir_filter is
    generic(
        IWL : natural;
        order : natural;
        CWL : natural 
    );
    port(
        din : in std_logic_vector(IIR_IWL-1 downto 0);
        dout : out std_logic_vector(IIR_IWL-1 downto 0);
        coeffs_B : in VECTOR_OF_STD_L_V;
        coeffs_A : in VECTOR_OF_STD_L_V;
        reset : in std_logic;
        ce : in std_logic;
        clk : in std_logic
    );


end component iir_filter;

signal clk : std_logic;
signal input, output : std_logic_vector(IIR_IWL-1 downto 0) := (others => '0');
signal flag : std_logic := '0';

begin



    cl : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1'
        wait for 10 ns;
    end process;
    
    sig: process (clk)
    
    begin
        if rising_edge(clk) then
            if flag ='0' then 
                input(IIR_WL-2 downto 0) <= (others => '1');            
            else 
                input <= (others => '0');
            end if;
        end if;
    end process;





    iif: iif_filter generic map(IIR_IWL, IIR_ORDER, IIR_CWL)
                    port map(
                        din => input,
                        dout => output;
                        coeffs_B => COEFFS_B,
                        coeffs_A => COEFFS_A,
                        reset => '0',
                        ce => '1',
                        clk => clk
                        );
end architecture rtl;