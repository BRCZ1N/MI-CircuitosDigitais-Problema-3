//Finalizado
module modulo_valor_transfer_rolhas(reg_r, transfer_rolhas);


	input [6:0]reg_r;
	output transfer_rolhas;
	wire [6:0] Nreg_r;
	wire [1:0] ands;


	and_gate_2_inputs gate_1(.A(reg_r[4]),.B(reg_r[3]),.S(ands[0]));

	and_gate_2_inputs gate_2(.A(reg_r[4]),.B(reg_r[2]),.S(ands[1]));

	or_gate_4_inputs gate_3(.A(ands[0]),.B(ands[1]),.C(reg_r[6]),.D(reg_r[5]),.S(transfer_rolhas));
	
endmodule 

	