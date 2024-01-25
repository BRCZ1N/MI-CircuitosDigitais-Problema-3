////Finalizado
module modulo_mux4_1(A,B,C,D,input_sel,out);


	input A,B,C,D;
	input [1:0] input_sel;
	output out;
	wire [3:0] gate_wire_and;
	wire [1:0] Ninput_sel, gate_wire_or;
	
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	and_gate_3_inputs gate_1(.A(A),.B(Ninput_sel[1]),.C(Ninput_sel[0]),.S(gate_wire_and[3]));
	and_gate_3_inputs gate_2(.A(B),.B(Ninput_sel[1]),.C(input_sel[0]),.S(gate_wire_and[2]));
	and_gate_3_inputs gate_3(.A(C),.B(input_sel[1]),.C(Ninput_sel[0]),.S(gate_wire_and[1]));
	and_gate_3_inputs gate_4(.A(D),.B(input_sel[1]),.C(input_sel[0]),.S(gate_wire_and[0]));
	

	or_gate_4_inputs gate_5(.A(gate_wire_and[3]),.B(gate_wire_and[2]),.C(gate_wire_and[1]),.D(gate_wire_and[0]),.S(out),);
	

endmodule
