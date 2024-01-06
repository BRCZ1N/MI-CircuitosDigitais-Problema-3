module modulo_MEF_Enchimento_Vedacao(enable,pg,ch,ro,eb,clk,m,ve,al,ev,q0,q1);

	input enable,pg,ch,ro,eb,clk;
	output m,ve,al,ev,q0,q1;
	wire Nq1,Nq0,j1,k1,j0,k0,Nch,Npg,Nro,Neb;
	wire [1:0] j0_aux, ev_aux;
	
	not(Nch,ch);
	not(Npg,pg);
	not(Nro,ro);
	not(Neb,eb);
	
	
	//j1
	
	and_gate_2_inputs gate_1(.A(q0),.B(ch),.S(j1));
	
	//k1
	
	modulo_ff_jk jk_1(.clk(clk),.rst(),.enable(),.j(j1),.k(q0),.q(q1),.q_bar(Nq1));
	
	//j0
	
	and_gate_3_inputs gate_2(.A(Nq1),.B(pg),.C(Neb),.S(j0_aux[1]));
	and_gate_2_inputs gate_3(.A(q1),.B(ro),.S(j0_aux[0]));
	
	or_gate_2_inputs gate_4(.A(j0_aux[1]),.B(j0_aux[0]),.S(j0));
	
	//k0
	
	or_gate_2_inputs gate_5(.A(ch),.B(q1),.S(k0));
	
	modulo_ff_jk jk_2(.clk(clk),.rst(),.enable(),.j(j0),.k(k0),.q(q0), .q_bar(Nq0));
	
	
	and_gate_4_inputs gate_6(.A(Nq1),.B(Nq0),.C(pg),.D(Neb),.S(ev_aux[1]));
	
	and_gate_3_inputs gate_7(.A(Nq1),.B(q0),.C(Nch),.S(ev_aux[0]));
	
	or_gate_3_inputs gate_8(.A(ev_aux[1]),.B(ev_aux[0]),.S(ev));
		
	and_gate_3_inputs gate_9(.A(q1),.B(Nq0),.C(Nro),.S(al));
	
	and_gate_3_inputs gate_10(.A(q1),.B(Nq0),.C(ro),.S(ve));
	
	and_gate_4_inputs gate_11(.A(Nq1),.B(Nq0),.C(Npg),.D(Neb),.S(m));

endmodule 