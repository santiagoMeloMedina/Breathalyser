onerror {quit -f}
vlib work
vlog -work work am.vo
vlog -work work am.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.am_vlg_vec_tst
vcd file -direction am.msim.vcd
vcd add -internal am_vlg_vec_tst/*
vcd add -internal am_vlg_vec_tst/i1/*
add wave /*
run -all
