module modulo_valor_minimo(REG, MIN);

input [6:0]REG;
output MIN;
wire [6:0] NREG;
wire [1:0] ands;

not(NREG[6], REG[6]);

not(NREG[5], REG[5]);

not(NREG[4], REG[4]);

not(NREG[3], REG[3]);

not(NREG[1], REG[1]);

and_gate_5_inputs gate_1(.A(NREG[6]),.B(NREG[5]),.C(NREG[4]),.D(NREG[3]),.E(NREG[2]),.S(ands[0]));


and_gate_5_inputs gate_2(.A(NREG[6]),.B(NREG[5]),.C(NREG[4]),.D(NREG[3]),.E(NREG[1]),.S(ands[1]));


or_gate_2_inputs gate_3(.A(ands[0]),.B(ands[1]),.S(MIN));


endmodule 