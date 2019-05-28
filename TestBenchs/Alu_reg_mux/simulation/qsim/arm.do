onerror {quit -f}
vlib work
vlog -work work arm.vo
vlog -work work arm.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.arm_vlg_vec_tst
vcd file -direction arm.msim.vcd
vcd add -internal arm_vlg_vec_tst/*
vcd add -internal arm_vlg_vec_tst/i1/*
add wave /*
run -all
