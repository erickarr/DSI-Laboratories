transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Eric/Dropbox/School/4th\ Year\ 1st\ Semester/Digital\ Systems\ Implementation\ (ECE\ 4740)/Labs/4/Lab4_Part3 {C:/Users/Eric/Dropbox/School/4th Year 1st Semester/Digital Systems Implementation (ECE 4740)/Labs/4/Lab4_Part3/Lab4_Part3.v}

