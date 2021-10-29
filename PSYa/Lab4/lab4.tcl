vlib work
vcom *.vhd
vsim work.moor

add wave -r /*
set i 0;
while {$i <= 5} {
force  /clk '0'
force  /Z Z2
run 5 ns;
force  /clk '1'
run 5 ns;
incr i
}

set i 0;
while {$i <= 2} {
force  /clk '0'
force  /Z Z1
run 5 ns;
force  /clk '1'
run 5 ns;
incr i
}

set i 0;
while {$i <= 2} {
force  /clk '0'
force  /Z Z2
run 5 ns;
force  /clk '1'
run 5 ns;
incr i
}

force  /Z Z3
run 40 ns;
force  /Z Z2
run 40 ns;



