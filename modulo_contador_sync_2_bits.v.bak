module modulo_contador_sync_2_bits(clr, clk, q);

	input clk,clr;
	output [1:0] q;
	
	modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr),.q(q[0]));
	
	modulo_ff_t ff_2(.t(q[0]),.clk(clk),.clr(clr),.q(q[1]));

endmodule 
