vlog -work work C:/Users/Eric/Dropbox/School/4th Year 1st Semester/Digital Systems Implementation (ECE 4740)/Labs/3/Part 1/simulation/modelsim/Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Lab3_Part1_vlg_vec_tst
onerror {resume}
add wave {Lab3_Part1_vlg_vec_tst/i1/KEY[0]}
add wave {Lab3_Part1_vlg_vec_tst/i1/LEDG[0]}
add wave {Lab3_Part1_vlg_vec_tst/i1/LEDG[1]}
add wave {Lab3_Part1_vlg_vec_tst/i1/SW[0]}
add wave {Lab3_Part1_vlg_vec_tst/i1/SW[1]}
run -all
