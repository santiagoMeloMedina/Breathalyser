onerror {quit -f}
vlib work
vlog -work work pc_memory_control_tb.vo
vlog -work work pc_memory_control_tb.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.pc_memory_control_tb_vlg_vec_tst
vcd file -direction pc_memory_control_tb.msim.vcd
vcd add -internal pc_memory_control_tb_vlg_vec_tst/*
vcd add -internal pc_memory_control_tb_vlg_vec_tst/i1/*
add wave /*
run -all
