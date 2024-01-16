module modulo_verificador_ausencia_rolhas(reg_r, aus_rolhas);

input [6:0]reg_r;
output aus_rolhas;
wire [6:0] Nreg_r;

not(Nreg_r[6], reg_r[6]);

not(Nreg_r[5], reg_r[5]);

not(Nreg_r[4], reg_r[4]);

not(Nreg_r[3], reg_r[3]);

not(Nreg_r[2], reg_r[2]);

not(Nreg_r[1], reg_r[1]);

not(Nreg_r[0], reg_r[0]);

and_gate_7_inputs gate_1(.A(Nreg_r[6]),.B(Nreg_r[5]),.C(Nreg_r[4]),.D(Nreg_r[3]),.E(Nreg_r[2]),.F(Nreg_r[1]),.G(Nreg_r[0]),.S(aus_rolhas));

endmodule 