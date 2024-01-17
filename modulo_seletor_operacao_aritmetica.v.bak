module modulo_seletor_operacao_aritmetica(smx,operacao_a);
	
	input [1:0] smx;
	output operacao_a;
	wire [1:0] Nsmx;
	
	not (Nsmx[1], smx[1]);
	not (Nsmx[0], smx[0]);
	
	//OPERACAO_A(SMX1, SMX2) = SMX1'SMX2'
	
	and_gate_2_inputs gate_1(.A(Nsmx[1]),.B(Nsmx[1]),.S(operacao_a));
	
	
endmodule 