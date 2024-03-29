//Finalizado
module modulo_somador_subtrator_completo(m,a,b,Te,S,Ts);
	
	
	input m,a,b,Te;
	output S,Ts;
	wire nm,na,nb,NTe;
	wire [3:0] S_aux;
	wire [4:0] Ts_aux;
	
	not (nm, m);
	not (na, a);
	not (nb, b);
	not (NTe, Te);
	
	and_gate_3_inputs gate_1(.A(na),.B(nb),.C(Te),.S(S_aux[3]));
	and_gate_3_inputs gate_2(.A(na),.B(b),.C(NTe),.S(S_aux[2]));
	and_gate_3_inputs gate_3(.A(a),.B(nb),.C(NTe),.S(S_aux[1]));
	and_gate_3_inputs gate_4(.A(a),.B(b),.C(Te),.S(S_aux[0]));
	
	or_gate_4_inputs gate_5(.A(S_aux[3]),.B(S_aux[2]),.C(S_aux[1]),.D(S_aux[0]),.S(S));
	
	and_gate_2_inputs gate_6(.A(b),.B(Te),.S(Ts_aux[4]));
	and_gate_3_inputs gate_7(.A(nm),.B(a),.C(Te),.S(Ts_aux[3]));
	and_gate_3_inputs gate_8(.A(nm),.B(a),.C(b),.S(Ts_aux[2]));
	and_gate_3_inputs gate_9(.A(m),.B(na),.C(Te),.S(Ts_aux[1]));
	and_gate_3_inputs gate_10(.A(m),.B(na),.C(b),.S(Ts_aux[0]));
	
	or_gate_5_inputs gate_11(.A(Ts_aux[4]),.B(Ts_aux[3]),.C(Ts_aux[2]),.D(Ts_aux[1]),.E(Ts_aux[0]),.S(Ts));
	
	
endmodule 