module modulo_valor_minimo(REG, MIN);


input[6:0]REG;
output MIN;


not(NREG[6], REG[6]);

not(NREG[5], REG[5]);

not(NREG[4], REG[4]);

not(NREG[3], REG[3]);

not(NREG[1], REG[1]);



and_gate_7_inputs gate_1(.A(NREG[6]),.B(NREG[5]),.C(NREG[4]),.D(NREG[3]),.E(NREG[2]),.F(NREG[1]),.G(NREG[0]),.S(MIN),);