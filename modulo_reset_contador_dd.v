module modulo_reset_contador_dd(cdd, rst_cdd);
	
	input [3:0] cdd;
	output rst_cdd;
	
	and_gate_2_inputs gate_1(.A(cdd[3]),.B(cdd[1]),.S(rst_cdd));
	
endmodule 