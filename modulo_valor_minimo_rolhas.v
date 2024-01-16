module modulo_valor_minimo_rolhas(reg_data, min_signal);

input [6:0]reg_data;
output min_signal;
wire [6:0] Nreg_data;
wire [1:0] ands;

not(Nreg_data[6], reg_data[6]);

not(Nreg_data[5], reg_data[5]);

not(Nreg_data[4], reg_data[4]);

not(Nreg_data[3], reg_data[3]);

not(Nreg_data[2], reg_data[2]);

not(Nreg_data[1], reg_data[1]);

and_gate_5_inputs gate_1(.A(Nreg_data[6]),.B(Nreg_data[5]),.C(Nreg_data[4]),.D(Nreg_data[3]),.E(Nreg_data[2]),.S(ands[0]));

and_gate_5_inputs gate_2(.A(Nreg_data[6]),.B(Nreg_data[5]),.C(Nreg_data[4]),.D(Nreg_data[3]),.E(Nreg_data[1]),.S(ands[1]));

or_gate_2_inputs gate_3(.A(ands[0]),.B(ands[1]),.S(min_signal));

endmodule 