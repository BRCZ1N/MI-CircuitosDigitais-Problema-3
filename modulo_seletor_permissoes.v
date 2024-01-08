module modulo_seletor_permissoes(ve,min_r,op,sel_perm);
	
	input ve,min_r,op;
	output [1:0] sel_perm;
	wire nve,nmin_r,nop;
	wire [1:0] sel_mux_e1_aux;
	
	not (nve, ve);
	not (nmin_r, min_r);
	not (nop, op);
	
	//SEL_MUX_E1(VE, MIN_R, OP) = VE'OP' + VE'MIN_R
	
	and_gate_2_inputs gate_1(.A(nve),.B(nop),.S(sel_mux_e1_aux[1]));
	and_gate_2_inputs gate_2(.A(nve),.B(min_r),.S(sel_mux_e1_aux[0]));
	
	or_gate_2_inputs gate_3(.A(sel_mux_e1_aux[1]),.B(sel_mux_e1_aux[0]),.S(sel_perm[1]));
	
	//SEL_MUX_E2(VE, MIN_R, OP) = VE'MIN_R'
	
	and_gate_2_inputs gate_4(.A(nve),.B(nmin_r),.S(sel_perm[0]));
	
	
endmodule 