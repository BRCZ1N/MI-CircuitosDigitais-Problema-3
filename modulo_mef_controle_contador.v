//Finalizado
module modulo_mef_controle_contador(enable,Load_Reg,EmptyBuffer,clk,Enable_C,Load_C,Clear_Reg,q1,q0);


	input enable,Load_Reg,EmptyBuffer,clk;
	output Enable_C,Load_C, Clear_Reg,q1,q0;
	wire Nq1,Nq0,j1,j0,k0, NLoad_Reg, NEmptyBuffer;
	wire [1:0] j0_aux;
	
	not(NLoad_Reg,Load_Reg);
	not(NEmptyBuffer,EmptyBuffer);
	
	//j1	
	
	and_gate_2_inputs gate_1(.A(q0),.B(Load_Reg),.S(j1));
	
	//k1
	
	modulo_ff_jk jk_1(.clk(clk),.rst(),.enable(enable),.j(j1),.k(q0),.q(q1),.q_bar(Nq1));
	
	//j0
	
	and_gate_2_inputs gate_2(.A(Nq1),.B(Load_Reg),.S(j0_aux[1]));
	and_gate_2_inputs gate_3(.A(Load_Reg),.B(EmptyBuffer),.S(j0_aux[0]));
	or_gate_2_inputs gate_4(.A(j0_aux[1]),.B(j0_aux[0]),.S(j0));
	
	//k0
	
	and_gate_2_inputs gate_5(.A(1'b1),.B(1'b1),.S(k0));
	
	modulo_ff_jk jk_2(.clk(clk),.rst(),.enable(enable),.j(j0),.k(k0),.q(q0), .q_bar(Nq0));
	
	and_gate_2_inputs gate_6(.A(q1),.B(Nq0),.S(Enable_C));
		
	and_gate_2_inputs gate_7(.A(Nq1),.B(q0),.S(Load_C));
	
	and_gate_2_inputs gate_8(.A(q1),.B(q0),.S(Clear_Reg));
	
	
endmodule 