//Remover
module modulo_seletor_load_principal(ve,min_r,load,sel_op_a_mx);
	
	
	input ve,min_r;
	output load, sel_op_a_mx;
	
	or_gate_2_inputs gate_1(.A(min_r),.B(ve),.S(load));
	and_gate_2_inputs gate_2(.A(1'b1),.B(ve),.S(sel_op_a_mx));
	
	
endmodule 