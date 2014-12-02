module Lab5_Part4(SW,LEDR,KEY,CLOCK_50);
	input [3:0] KEY;
	input CLOCK_50;
	input [2:0] SW;
	output [17:0] LEDR;
	
	wire [2:0] letter;
	wire clk;
	
	reg light;
	
	integer length,cntr;
	
	assign letter = SW[2:0];
	assign clk = ~KEY[2];
	assign LEDR[0] = light;
	
	always @ (posedge clk) begin
		case(letter)
			3'b000: begin
						light = 1;
						#50000000000000000000000000 light = 0;
					end
			3'b001:light = 0;
			3'b010:;
			3'b011:;
			3'b100:;
			3'b101:;
			3'b110:;
			3'b111:;
		endcase
	end
	
	/*always @ (posedge CLOCK_50) begin
		cntr <= cntr + 1;
		
		if(cntr == length) begin
			light = 0;
			cntr <= 0;
		end
	end*/
	
	assign LEDR[0] = light;
endmodule
