module modulo_codificador_unidade_rolhas(reg_r, reg_ru);

input [6:0] reg_r;
output [3:0] reg_ru;

wire [6:0] Nreg_r;

wire [9:0] aux_reg_ru_1;
wire [12:0] aux_reg_ru_2;
wire [12:0] aux_reg_ru_3;

not (Nreg_r[6], reg_r[6]);
not (Nreg_r[5], reg_r[5]);
not (Nreg_r[4], reg_r[4]);
not (Nreg_r[3], reg_r[3]);
not (Nreg_r[2], reg_r[2]);
not (Nreg_r[1], reg_r[1]);
not (Nreg_r[0], reg_r[0]);

//reg_ru1 = a'b'c'de'f' + a'b'cd'e'f + a'b'cdef' + bc'd'ef + bcd'e'f' + bcde'f + ac'd'ef' + ac'def + acde'f' + abf
and (aux_reg_ru_1[9], Nreg_r[6], Nreg_r[5], Nreg_r[4], reg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_1[8], Nreg_r[6], Nreg_r[5], reg_r[4], Nreg_r[3], Nreg_r[2], reg_r[1]);
and (aux_reg_ru_1[7], Nreg_r[6], Nreg_r[5], reg_r[4], reg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_1[6], reg_r[5], Nreg_r[4], Nreg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_1[5], reg_r[5], reg_r[4], Nreg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_1[4], reg_r[5], reg_r[4], reg_r[3], Nreg_r[2], reg_r[1]);
and (aux_reg_ru_1[3], reg_r[6], Nreg_r[4], Nreg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_1[2], reg_r[6], Nreg_r[4], reg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_1[1], reg_r[6], reg_r[4], reg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_1[0], reg_r[6], reg_r[5], reg_r[1]);

or (reg_ru[3],aux_reg_ru_1[9], aux_reg_ru_1[8], aux_reg_ru_1[7], aux_reg_ru_1[6], aux_reg_ru_1[5], aux_reg_ru_1[4], aux_reg_ru_1[3], aux_reg_ru_1[2], aux_reg_ru_1[1], aux_reg_ru_1[0]);

//reg_ru2 = a'b'ce'f' + a'b'cde' + a'bc'd'e'f + bcd'ef + ac'def' + acd'e + acef + a'b'c'd'e + a'c'def + bc'ef' + a'cde'f' + ac'd'e'f' + ab'c'e'f
and (aux_reg_ru_2[12], Nreg_r[6], Nreg_r[5], reg_r[4], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_2[11], Nreg_r[6], Nreg_r[5], reg_r[4], reg_r[3], Nreg_r[2]);
and (aux_reg_ru_2[10], Nreg_r[6], reg_r[5], Nreg_r[4], Nreg_r[3], Nreg_r[2], reg_r[1]);
and (aux_reg_ru_2[9], reg_r[5], reg_r[4], Nreg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_2[8], reg_r[6], Nreg_r[4], reg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_2[7], reg_r[6], reg_r[4], Nreg_r[3], reg_r[2]);
and (aux_reg_ru_2[6], reg_r[6], reg_r[4], reg_r[2], reg_r[1]);
and (aux_reg_ru_2[5], Nreg_r[6], Nreg_r[5], Nreg_r[4], Nreg_r[3], reg_r[2]);
and (aux_reg_ru_2[4], Nreg_r[6], Nreg_r[4], reg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_2[3], reg_r[5], Nreg_r[4], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_2[2], Nreg_r[6], reg_r[4], reg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_2[1], reg_r[6], Nreg_r[4], Nreg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_2[0], reg_r[6], Nreg_r[5], Nreg_r[4], Nreg_r[2], reg_r[1]);

or (reg_ru[2], aux_reg_ru_2[12], aux_reg_ru_2[11], aux_reg_ru_2[10], aux_reg_ru_2[9], aux_reg_ru_2[8], aux_reg_ru_2[7], aux_reg_ru_2[6], aux_reg_ru_2[5], aux_reg_ru_2[4], aux_reg_ru_2[3], aux_reg_ru_2[2], aux_reg_ru_2[1], aux_reg_ru_2[0]);

//reg_ru3 = b'c'def' + a'b'cd'e'f' + a'b'cde'f + bc'd'f' + bc'df + bd'ef' + bcde'f' + bdef + ac'df' + adef' + a'b'c'd'f + b'cd'ef + ab'd'e'f

and (aux_reg_ru_3[12], Nreg_r[5], Nreg_r[4], reg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_3[11], Nreg_r[6], Nreg_r[5], reg_r[4], Nreg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_3[10], Nreg_r[6], Nreg_r[5], reg_r[4], reg_r[3], Nreg_r[2], reg_r[1]);
and (aux_reg_ru_3[9], reg_r[5], Nreg_r[4], Nreg_r[3], Nreg_r[1]);
and (aux_reg_ru_3[8], reg_r[5], Nreg_r[4], reg_r[3], reg_r[1]);
and (aux_reg_ru_3[7], reg_r[5], Nreg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_3[6], reg_r[5], reg_r[4], reg_r[3], Nreg_r[2], Nreg_r[1]);
and (aux_reg_ru_3[5], reg_r[5], reg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_3[4], reg_r[6], Nreg_r[4], reg_r[3], Nreg_r[1]);
and (aux_reg_ru_3[3], reg_r[6], reg_r[3], reg_r[2], Nreg_r[1]);
and (aux_reg_ru_3[2], Nreg_r[6], Nreg_r[5], Nreg_r[4], Nreg_r[3], reg_r[1]);
and (aux_reg_ru_3[1], Nreg_r[5], reg_r[4], Nreg_r[3], reg_r[2], reg_r[1]);
and (aux_reg_ru_3[0], reg_r[6], Nreg_r[5], Nreg_r[3], Nreg_r[2], reg_r[1]);

or (reg_ru[1], aux_reg_ru_3[12], aux_reg_ru_3[11], aux_reg_ru_3[10], aux_reg_ru_3[9], aux_reg_ru_3[8], aux_reg_ru_3[7], aux_reg_ru_3[6], aux_reg_ru_3[5], aux_reg_ru_3[4], aux_reg_ru_3[3], aux_reg_ru_3[2], aux_reg_ru_3[1], aux_reg_ru_3[0]);

//reg_ru4 = g

and (reg_ru[0], reg_r[0], 1'b1);


endmodule 











