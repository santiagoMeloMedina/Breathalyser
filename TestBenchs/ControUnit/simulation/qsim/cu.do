onerror {quit -f}
vlib work
vlog -work work cu.vo
vlog -work work cu.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cu_vlg_vec_tst
vcd file -direction cu.msim.vcd
vcd add -internal cu_vlg_vec_tst/*
vcd add -internal cu_vlg_vec_tst/i1/*
add wave /*
run -all
