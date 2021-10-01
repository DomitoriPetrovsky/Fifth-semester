vlib work
vcom *.vhd
vsim work.moor

add wave -r /*
set i 0;
while {$i <= 5} {
force -deposit /clk '0'
force -deposit /Z Z2
run 5 ns;
force -deposit /clk '1'
run 5 ns;
incr i
}

set i 0;
while {$i <= 2} {
force -deposit /clk '0'
force -deposit /Z Z1
run 5 ns;
force -deposit /clk '1'
run 5 ns;
incr i
}

set i 0;
while {$i <= 2} {
force -deposit /clk '0'
force -deposit /Z Z2
run 5 ns;
force -deposit /clk '1'
run 5 ns;
incr i
}

force -deposit /Z Z3
run 40 ns;
force -deposit /Z Z2
run 40 ns;



