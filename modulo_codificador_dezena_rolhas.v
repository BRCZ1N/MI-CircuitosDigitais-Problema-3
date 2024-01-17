module modulo_codificador_dezena_rolhas(REG_R, REG_RD);

input [6:0] REG_R;
output [3:0] REG_RD;

wire [6:0] NREG_R;

wire [1:0] aux_reg_rd1;
wire [2:0] aux_reg_rd2;
wire [4:0] aux_reg_rd3;
wire [11:0] aux_reg_rd4;

not (NREG_R[6], REG_R[6]);
not (NREG_R[5], REG_R[5]);
not (NREG_R[4], REG_R[4]);
not (NREG_R[3], REG_R[3]);
not (NREG_R[2], REG_R[2]);
not (NREG_R[1], REG_R[1]);
not (NREG_R[0], REG_R[0]);

//REG_RD1 = ac + ab
and (aux_reg_rd1[1], REG_R[6], REG_R[4]);
and (aux_reg_rd1[0], REG_R[6], REG_R[5]);

or (REG_RD[3], aux_reg_rd1[1], aux_reg_rd1[0]);

//REG_RD2 = bd + bc + ab'c'
and (aux_reg_rd2[2], REG_R[5], REG_R[3]);
and (aux_reg_rd2[1], REG_R[5], REG_R[4]);
and (aux_reg_rd2[0], REG_R[6], NREG_R[5], NREG_R[4]);

or (REG_RD[2], aux_reg_rd2[2], aux_reg_rd2[1], aux_reg_rd2[0]);

//REG_RD3 = a'b'ce + a'b'cd + a'bc'd' + ab'c' + a'cde
and (aux_reg_rd3[4], NREG_R[6], NREG_R[5], REG_R[4], REG_R[2]);
and (aux_reg_rd3[3], NREG_R[6], NREG_R[5], REG_R[4], REG_R[3]);
and (aux_reg_rd3[2], NREG_R[6], REG_R[5], NREG_R[4], NREG_R[3]);
and (aux_reg_rd3[1], REG_R[6], NREG_R[5], NREG_R[4]);
and (aux_reg_rd3[0], NREG_R[6], REG_R[4], REG_R[3], REG_R[2]);

or (REG_RD[1], aux_reg_rd3[4], aux_reg_rd3[3], aux_reg_rd3[2], aux_reg_rd3[1], aux_reg_rd3[0]);

//REG_RD4 = b'c'df + b'c'de + a'b'cd'e' + b'def + bc'd' + bd'e + bcde' + ac'ef + ac'd + adf + ade + a'cd'e'f 
and (aux_reg_rd4[11], NREG_R[5], NREG_R[4], REG_R[3], REG_R[1]);
and (aux_reg_rd4[10], NREG_R[5], NREG_R[4], REG_R[3], REG_R[2]);
and (aux_reg_rd4[9], NREG_R[6], NREG_R[5], REG_R[4], NREG_R[3], NREG_R[2]);
and (aux_reg_rd4[8], NREG_R[5], REG_R[3], REG_R[2], REG_R[1]);
and (aux_reg_rd4[7], REG_R[5], NREG_R[4], NREG_R[3]);
and (aux_reg_rd4[6], REG_R[5], NREG_R[3], REG_R[2]);
and (aux_reg_rd4[5], REG_R[5], REG_R[4], REG_R[3], NREG_R[2]);
and (aux_reg_rd4[4], REG_R[6], NREG_R[4], REG_R[2], REG_R[1]);
and (aux_reg_rd4[3], REG_R[6], NREG_R[4], REG_R[3]);
and (aux_reg_rd4[2], REG_R[6], REG_R[3], REG_R[1]);
and (aux_reg_rd4[1], REG_R[6], REG_R[3], REG_R[2]);
and (aux_reg_rd4[0], NREG_R[6], REG_R[4], NREG_R[3], NREG_R[2], REG_R[1]);

or (REG_RD[0], aux_reg_rd4[11], aux_reg_rd4[10], aux_reg_rd4[9], aux_reg_rd4[8], aux_reg_rd4[7], aux_reg_rd4[6], aux_reg_rd4[5], aux_reg_rd4[4], aux_reg_rd4[3], aux_reg_rd4[2], aux_reg_rd4[1], aux_reg_rd4[0]);


endmodule
