module modulo_codificador_dezena_garrafas(cdd,cdfd);

	input [3:0] cdd;
	output [3:0]cdfd;

	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(cdfd[3]));
	
	and_gate_2_inputs gate_2(.A(1'b0),.B(1'b0),.S(cdfd[2]));
	
	and_gate_2_inputs gate_3(.A(1'b0),.B(1'b0),.S(cdfd[1]));
	
	and_gate_2_inputs gate_4(.A(cdd[3]),.B(cdd[1]),.S(cdfd[0]));
	
endmodule
