module modulo_mux4_1(input_sel,out);

	input [3:0] input_sel;
	output [3:0]out;
	
	
	

	
	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(out[3]));
	
	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(out[2]));
	
	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(out[1]));
	
	and_gate_2_inputs gate_1(.A(input_sel[0]),.B(input_sel[2]),.S(out[0]));
endmodule
