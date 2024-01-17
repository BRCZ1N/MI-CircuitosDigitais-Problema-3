module modulo_count_superior99(reg_data, min_signal);

input [6:0]reg_data;
output min_signal;
wire [6:0] Nreg_data;
wire [2:0] ands;


and_gate_3_inputs gate_1(.A(reg_data[0]),.B(reg_data[1]),.C(reg_data[4]),.S(ands[0]));

and_gate_3_inputs gate_2(.A(reg_data[0]),.B(reg_data[1]),.C(reg_data[3]),.S(ands[1]));

and_gate_3_inputs gate_3(.A(reg_data[0]),.B(reg_data[1]),.C(reg_data[2]),.S(ands[2]));


or_gate_3_inputs gate_4(.A(ands[0]),.B(ands[1]),.C(ands[2]),.S(min_signal));

endmodule 