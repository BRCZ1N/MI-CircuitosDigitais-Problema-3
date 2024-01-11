module modulo_codificador_contador4bitsU(input_sel,out);

	input [3:0] input_sel;
	output [3:0]out;
	
	
	
	
	not(Ninput_sel[2], input_sel[2])
	not(Ninput_sel[0], input_sel[0])
	
	
	
	and_gate_2_inputs gate_1(.A(input_sel[0]),.B(Ninput_sel[2]),.S(out[3]));
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(input_sel[1]),.S(out[2]));
	
	and_gate_2_inputs gate_1(.A(Ninput_sel[0]),.B(input_sel[2]),.S(out[1]));
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(input_sel[3]),.S(out[0]));
endmodule
