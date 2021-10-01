package automat_states is
  
  constant N : natural := 15;
  --
  --mas of natural 
  --
  type func_1_in is array (0 to N) of natural;
 
  type func_1_return is array (0 to 3) of natural;
  --
  --first elemtnt  - MAX, second  - MIN, and others is positions!
  --
  
  type func_2_in is array (0 to N, 0 to N) of natural;
  
  type func_2_return is array (0 to 3) of natural;
  
  
end automat_states;
 
package body automat_states is

	function func_1 (mas : func_1_in) return func_1_return is
	variable temp : func_1_return;
	begin 
		temp (0) := mas(0);
		temp (1) := mas(0);
		temp (2) := 0;
		temp (3) := 0;
		
		for I in 1 to N loop 

				if (temp(0) < mas(I)) then 
					
					temp(0) := mas(I);
					temp(2) := I;
				elsif (temp(1) > mas(I)) then
				
					temp(1) := mas(I);
					temp(3) := I;
				
				end if;
	
		end loop;
	
	return temp;
	
	end function func_1;
	
--------------------------------------------------
	
	function func_2 (mas : func_2_in; colum_num : natural) return func_2_return is
	variable temp : func_2_return;
	begin 
		temp (0) := mas(0, colum_num);
		temp (1) := 0;
		
		
		for I in 1 to N loop 

				if (temp(0) > mas(I, colum_num)) then 
					
					temp(0) := mas(I, colum_num);
					temp(1) := I;
			
				end if;
	
		end loop;
	
	return temp;
	
	end function func_2;
--------------------------------------------------
	procedure proc_1
				(mas : in func_1_in;
		signal	 MAX : out natural;
		signal	MiN : out natural;
		signal	max_pos : out natural;
		signal	min_pos : out natural) is
				
		variable temp_max, temp_min, temp_max_pos, temp_min_pos : natural;
	begin
		temp_max := mas(0);
		temp_min := mas(0);
		temp_max_pos := 0;
		temp_min_pos := 0;
		
		for I in 1 to N loop 

				if (temp_max < mas(I)) then 
					
					temp_max := mas(I);
					temp_max_pos := I;
				elsif (temp_min > mas(I)) then
				
					temp_min := mas(I);
					temp_min_pos := I;
				
				end if;
	
		end loop;
		
		MAX <= temp_max;
		MIN <= temp_min;
		max_pos <= temp_max_pos;
		min_pos <= temp_min_pos;
		
	end proc_1;

---------------------------------------------------
procedure proc_1
				(mas : in func_2_in;
				colum_num : in natural;
		signal	MiN : out natural;
		signal	min_pos : out natural) is
				
		variable temp_min, temp_min_pos : natural;
	begin
		temp_min := mas(0, colum_num );
		temp_min_pos := 0;
		
		for I in 1 to N loop 

				for I in 1 to N loop 

				if (temp_min > mas(I, colum_num)) then 
					
					temp_min := mas(I, colum_num);
					temp_min_pos := I;
			
				end if;
	
		end loop;
	
		end loop;
		
		MIN <= temp_min;
		min_pos <= temp_min_pos;
		
	end proc_1;

  
end automat_states;