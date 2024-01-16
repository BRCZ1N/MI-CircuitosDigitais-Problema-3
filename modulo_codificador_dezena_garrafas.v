module modulo_codificador_dezena_garrafas(cdd,cdf);

	input [3:0] cdd;
	output [3:0]cdf;

	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(cdf[3]));
	
	and_gate_2_inputs gate_2(.A(1'b0),.B(1'b0),.S(cdf[2]));
	
	and_gate_2_inputs gate_3(.A(1'b0),.B(1'b0),.S(cdf[1]));
	
	and_gate_2_inputs gate_4(.A(cdd[3]),.B(cdd[1]),.S(cdf[0]));
	
endmodule
