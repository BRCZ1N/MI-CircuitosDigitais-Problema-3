//Finalizado
module modulo_codificador_unidade_garrafas(cdd,cdfu);


	input [3:0] cdd;
	output [3:0] cdfu;
	wire [3:0] Ncdd;

	not(Ncdd[3], cdd[3]);
	not(Ncdd[2], cdd[2]);
	not(Ncdd[1], cdd[1]);
	not(Ncdd[0], cdd[0]);
	
	and_gate_2_inputs gate_1(.A(cdd[3]),.B(Ncdd[1]),.S(cdfu[3]));
	
	and_gate_2_inputs gate_2(.A(1'b1),.B(cdd[2]),.S(cdfu[2]));
	
	and_gate_2_inputs gate_3(.A(Ncdd[3]),.B(cdd[1]),.S(cdfu[1]));
	
	and_gate_2_inputs gate_4(.A(1'b1),.B(cdd[0]),.S(cdfu[0]));
	
	
endmodule
