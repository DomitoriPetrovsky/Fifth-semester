----------------------------------------------------------------------------------
-- Company: BSUIR
-- Engineer: Petrovsky D.A
-- 
-- Module Name:    	top_function - Behavioral 
-- Project Name: 	Lab_2
-- Variant:			15
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_function is
	port (X1, X2, X3 , X4 : in std_logic;
			Y1, Y2, Y3, Y4 : out std_logic);
		
end top_function;

architecture Behavioral of top_function is


component ex2 is
	port (
		A, B : in std_logic;
		Y : out std_logic);
		
end component ex2;

component N is
	port (
		A: in std_logic;
		Y : out std_logic);
		
end component N;

component NO3A2 is
	port (
		A, B, C, D : in std_logic;
		Y : out std_logic);
		
end component NO3A2 ;

component NA2 is
	port (
		A, B: in std_logic;
		Y : out std_logic);
		
end component NA2;

component NA3O2 is
	port (
		A, B, C, D: in std_logic;
		Y : out std_logic);
		
end component NA3O2;

component NOA3 is
	port (
		A, B, C, D: in std_logic;
		Y : out std_logic);
		
end component NOA3;

component NAO2 is
	port (
		A, B, C: in std_logic;
		Y : out std_logic);
		
end component NAO2;

component NOAO2 is
	port (
		A, B, C, D : in std_logic;
		Y : out std_logic);
		
end component NOAO2 ;

component NO3 is
	port (
		A, B, C : in std_logic;
		Y : out std_logic);
		
end component NO3 ;

component VCC is
	port (Y : out std_logic);
		
end component VCC;

signal input : std_logic_vector(1 to 4);
signal output : std_logic_vector(1 to 4);

signal signals : std_logic_vector(1 to 14 );

begin
	input(1) <= X1;
	input(2) <= X2; 
	input(3) <= X3;
	input(4) <= X4;
	
	Y1 <= output(1);
	Y2 <= output(2); 
	Y3 <= output(3);
	Y4 <= output(4);
	
	
element_ex2:	ex2 	port map( A => input(3), B => input(2), Y => signals(1));
	
element_N_1:	N		port map(A => signals(1), Y => signals(2));
element_N_2:	N		port map(A => output(2), Y => signals(4));
element_N_3:	N		port map(A => signals(4), Y => signals(5));
element_N_4:	N		port map(A => signals(2), Y => signals(6));
element_N_5:	N		port map(A => input(1), Y => signals(3));

element_NO3A2:	NO3A2	port map (A => input(4), B => signals(5), C => signals(6), D => signals(3), Y => signals(8));

element_N_6:	N		port map(A => input(4), Y => signals(7));
element_N_7:	N		port map(A => input(2), Y => signals(9));
element_N_8:	N		port map(A => signals(2), Y => signals(14));

element_NA2:	NA2		port map(A => signals(3), B => input(4), Y => signals(10));

element_NA3O2:	NA3O2	port map(A => input(3), B => signals(4), C => input(1), D => signals(7), Y => signals(12));

element_NOA3:	NOA3	port map(A => signals(8), B => input(3), C => signals(3), D => input(1), Y => signals(11)); 

element_N_9:	N		port map(A => output(3), Y => signals(13));

element_VCC:	VCC		port map(Y => output(1));

element_NO3:	NO3		port map(A => signals(14), B => input(4), C => signals(3), Y => output(2));

elemtnt_NOAO2:	NOAO2	port map(A => signals(9), B => signals(12), C => input(3), D => signals(10), Y => output(3));

elemtnt_NAO2:	NAO2	port map(A => signals(11), B => input(1), C => signals(13), Y => output(4));

	
	
	
	
	
end Behavioral;