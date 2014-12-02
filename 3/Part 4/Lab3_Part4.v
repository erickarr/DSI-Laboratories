module Lab3_Part4(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
	wire clk,D,Qa,Qb,Qc;
	
	assign clk = SW[1];
	assign D = SW[0];
	assign LEDG[2] = Qa;
	assign LEDG[1] = Qb;
	assign LEDG[0] = Qc;
	
	d_latch d0 (D,clk,Qa);
	d_latch_posedge d1(D,clk,Qb);
	d_latch_negedge d2(D,clk,Qc);
	
	assign LEDR = SW;
endmodule

module d_latch (D,clk,Q);
	input D,clk;
	output reg Q;
	
	always @ (clk)
		if(clk)
			Q = D;

endmodule

module d_latch_posedge(D,clk,Q);
	input D,clk;
	output reg Q;
	
	always @ (posedge clk) begin
		Q = D;
	end
endmodule

module d_latch_negedge(D,clk,Q);
	input D,clk;
	output reg Q;
	
	always @ (negedge clk) begin
		Q = D;
	end
endmodule

