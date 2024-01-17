module modulo_codificador_unidade_rolhas(REG_R, REG_RU);
input [6:0] REG_R;
output [3:0] REG_RU;

wire [6:0] NREG_R;

wire [9:0] aux_reg_ru_1;
wire [12:0] aux_reg_ru_2;
wire [12:0] aux_reg_ru_3;

not (NREG_R[6], REG_R[6]);
not (NREG_R[5], REG_R[5]);
not (NREG_R[4], REG_R[4]);
not (NREG_R[3], REG_R[3]);
not (NREG_R[2], REG_R[2]);
not (NREG_R[1], REG_R[1]);
not (NREG_R[0], REG_R[0]);

//REG_RU1 = a'b'c'de'f' + a'b'cd'e'f + a'b'cdef' + bc'd'ef + bcd'e'f' + bcde'f + ac'd'ef' + ac'def + acde'f' + abf
and (aux_reg_ru_1[9], NREG_R[6], NREG_R[5], NREG_R[4], REG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_1[8], NREG_R[6], NREG_R[5], REG_R[4], NREG_R[3], NREG_R[2], REG_R[1]);
and (aux_reg_ru_1[7], NREG_R[6], NREG_R[5], REG_R[4], REG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_1[6], REG_R[5], NREG_R[4], NREG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_1[5], REG_R[5], REG_R[4], NREG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_1[4], REG_R[5], REG_R[4], REG_R[3], NREG_R[2], REG_R[1]);
and (aux_reg_ru_1[3], REG_R[6], NREG_R[4], NREG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_1[2], REG_R[6], NREG_R[4], REG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_1[1], REG_R[6], REG_R[4], REG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_1[0], REG_R[6], REG_R[5], REG_R[1]);

or (REG_RU[3],aux_reg_ru_1[9], aux_reg_ru_1[8], aux_reg_ru_1[7], aux_reg_ru_1[6], aux_reg_ru_1[5], aux_reg_ru_1[4], aux_reg_ru_1[3], aux_reg_ru_1[2], aux_reg_ru_1[1], aux_reg_ru_1[0]);

//REG_RU2 = a'b'ce'f' + a'b'cde' + a'bc'd'e'f + bcd'ef + ac'def' + acd'e + acef + a'b'c'd'e + a'c'def + bc'ef' + a'cde'f' + ac'd'e'f' + ab'c'e'f
and (aux_reg_ru_2[12], NREG_R[6], NREG_R[5], REG_R[4], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_2[11], NREG_R[6], NREG_R[5], REG_R[4], REG_R[3], NREG_R[2]);
and (aux_reg_ru_2[10], NREG_R[6], REG_R[5], NREG_R[4], NREG_R[3], NREG_R[2], REG_R[1]);
and (aux_reg_ru_2[9], REG_R[5], REG_R[4], NREG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_2[8], REG_R[6], NREG_R[4], REG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_2[7], REG_R[6], REG_R[4], NREG_R[3], REG_R[2]);
and (aux_reg_ru_2[6], REG_R[6], REG_R[4], REG_R[2], REG_R[1]);
and (aux_reg_ru_2[5], NREG_R[6], NREG_R[5], NREG_R[4], NREG_R[3], REG_R[2]);
and (aux_reg_ru_2[4], NREG_R[6], NREG_R[4], REG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_2[3], REG_R[5], NREG_R[4], REG_R[2], NREG_R[1]);
and (aux_reg_ru_2[2], NREG_R[6], REG_R[4], REG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_2[1], REG_R[6], NREG_R[4], NREG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_2[0], REG_R[6], NREG_R[5], NREG_R[4], NREG_R[2], REG_R[1]);

or (REG_RU[2], aux_reg_ru_2[12], aux_reg_ru_2[11], aux_reg_ru_2[10], aux_reg_ru_2[9], aux_reg_ru_2[8], aux_reg_ru_2[7], aux_reg_ru_2[6], aux_reg_ru_2[5], aux_reg_ru_2[4], aux_reg_ru_2[3], aux_reg_ru_2[2], aux_reg_ru_2[1], aux_reg_ru_2[0]);

//REG_RU3 = b'c'def' + a'b'cd'e'f' + a'b'cde'f + bc'd'f' + bc'df + bd'ef' + bcde'f' + bdef + ac'df' + adef' + a'b'c'd'f + b'cd'ef + ab'd'e'f

and (aux_reg_ru_3[12], NREG_R[5], NREG_R[4], REG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_3[11], NREG_R[6], NREG_R[5], REG_R[4], NREG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_3[10], NREG_R[6], NREG_R[5], REG_R[4], REG_R[3], NREG_R[2], REG_R[1]);
and (aux_reg_ru_3[9], REG_R[5], NREG_R[4], NREG_R[3], NREG_R[1]);
and (aux_reg_ru_3[8], REG_R[5], NREG_R[4], REG_R[3], REG_R[1]);
and (aux_reg_ru_3[7], REG_R[5], NREG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_3[6], REG_R[5], REG_R[4], REG_R[3], NREG_R[2], NREG_R[1]);
and (aux_reg_ru_3[5], REG_R[5], REG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_3[4], REG_R[6], NREG_R[4], REG_R[3], NREG_R[1]);
and (aux_reg_ru_3[3], REG_R[6], REG_R[3], REG_R[2], NREG_R[1]);
and (aux_reg_ru_3[2], NREG_R[6], NREG_R[5], NREG_R[4], NREG_R[3], REG_R[1]);
and (aux_reg_ru_3[1], NREG_R[5], REG_R[4], NREG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_ru_3[0], REG_R[6], NREG_R[5], NREG_R[3], NREG_R[2], REG_R[1]);

or (REG_RU[1], aux_reg_ru_3[12], aux_reg_ru_3[11], aux_reg_ru_3[10], aux_reg_ru_3[9], aux_reg_ru_3[8], aux_reg_ru_3[7], aux_reg_ru_3[6], aux_reg_ru_3[5], aux_reg_ru_3[4], aux_reg_ru_3[3], aux_reg_ru_3[2], aux_reg_ru_3[1], aux_reg_ru_3[0]);

//REG_RU4 = g

and (REG_RU[0], REG_R[0], 1'b1);


endmodule 











