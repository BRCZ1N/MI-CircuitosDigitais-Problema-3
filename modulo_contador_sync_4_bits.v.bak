module modulo_contador_sync_4_bits(input_primeiro_ff, clr, clk, q);
	
	input clk, clr, input_primeiro_ff;
	output [3:0] q;
	wire [1:0] ff_inputs;
	
	modulo_ff_t ff_1(.t(input_primeiro_ff),.clk(clk),.clr(clr),.q(q[0]));
	modulo_ff_t ff_2(.t(q[0]),.clk(clk),.clr(clr),.q(q[1]));
	
	and(ff_inputs[0], q[1],q[0]);
	
	modulo_ff_t ff_3(.t(ff_inputs[0]),.clk(clk),.clr(clr),.q(q[2]));
	
	and(ff_inputs[1], ff_inputs[0], q[2]);
	
	modulo_ff_t ff_4(.t(ff_inputs[1]),.clk(clk),.clr(clr),.q(q[3]));
	
endmodule
