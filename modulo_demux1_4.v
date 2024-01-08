module modulo_demux1_4(A,input_sel,out);

	input A;
	input [1:0]input_sel;
	output [3:0]out;
	wire  [1:0] Ninput_sel;
	
	not(Ninput_sel[0],input_sel[0]);
	not(Ninput_sel[1],input_sel[1]);

	and_gate_3_inputs gate_1(.A(Ninput_sel[1]),.B(Ninput_sel[0]),.C(A),.S(out[3]),);
	and_gate_3_inputs gate_2(.A(Ninput_sel[1]),.B(input_sel[0]),.C(A),.S(out[2]),);
	and_gate_3_inputs gate_3(.A(input_sel[1]),.B(Ninput_sel[0]),.C(A),.S(out[1]),);
	and_gate_3_inputs gate_4(.A(input_sel[1]),.B(input_sel[0]),.C(A),.S(out[0]),);
	
endmodule 