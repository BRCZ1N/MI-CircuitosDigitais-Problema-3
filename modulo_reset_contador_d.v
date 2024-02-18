//Finalizado
module modulo_reset_contador_d(cd, rst_cd);
	
	
	input [3:0] cd;
	output rst_cd;
	wire [3:0] Ncd;
	
	not(Ncd[1],cd[1]);
	not(Ncd[0],cd[0]);
	
	
	and_gate_4_inputs gate_1(.A(cd[3]),.B(cd[2]),.C(Ncd[1]),.D(cd[0]),.S(rst_cd));
	
	
endmodule 