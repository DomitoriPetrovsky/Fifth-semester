
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RS_triger_structure is
	port (
		R, S: in std_logic;
		NQ : out std_logic);
		
end RS_triger_structure;

architecture Behavioral of RS_triger_structure is

component INV is
	port (
		A: in std_logic;
		Y : out std_logic);
		
end component INV;

component NOR_1 is
	port (
		A, B: in std_logic;
		Y : out std_logic);
		
end component NOR_1;


signal wires : std_logic_vector(1 downto 0);

begin
	
element_nor_1: NOR_1 generic map( 1 ns, 2 ns)
					port map(A => S, B => wires(1), Y => wires(0));
element_nor_2: NOR_1 generic map (3 ns, 4 ns)
					port map(A => R, B => wires(0), Y => wires(1));

element_inv: INV port map(A => wires(1), Y => NQ );
	
end Behavioral;