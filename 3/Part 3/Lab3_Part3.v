module Lab3_Part3(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
	wire D,clk,Qm,Qs,Qbar;
	
	assign D = SW[0];
	assign clk = SW[1];
	assign LEDG[2] = Qm;
	assign LEDG[1] = Qs;
	assign LEDG[0] = Qbar;
	
	d_flip_flop d0 (D,~clk,Qm);
	d_flip_flop d1 (Qm,clk,Qs,Qbar);
	
	assign LEDR = SW;
endmodule

module d_flip_flop(D,clk,Q,Qbar);
	input D,clk;
	output Q,Qbar;
	
	wire R,S,R_g,S_g;
	
	assign S = D;
	assign R = ~D;	
	assign R_g = R & clk;
	assign S_g = S & clk;
	assign Q = ~(R_g | Qbar);
	assign Qbar = ~(S_g | Q);
endmodule
