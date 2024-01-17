//Finalizado
module modulo_codificador_dezena_rolhas(reg_r, reg_rd);


	input [6:0] reg_r;
	output [3:0] reg_rd;

	wire [6:0] Nreg_r;

	wire [1:0] aux_reg_rd1;
	wire [2:0] aux_reg_rd2;
	wire [4:0] aux_reg_rd3;
	wire [11:0] aux_reg_rd4;

	not (Nreg_r[6], reg_r[6]);
	not (Nreg_r[5], reg_r[5]);
	not (Nreg_r[4], reg_r[4]);
	not (Nreg_r[3], reg_r[3]);
	not (Nreg_r[2], reg_r[2]);
	not (Nreg_r[1], reg_r[1]);
	not (Nreg_r[0], reg_r[0]);

	//reg_rd1 = ac + ab
	and (aux_reg_rd1[1], reg_r[6], reg_r[4]);
	and (aux_reg_rd1[0], reg_r[6], reg_r[5]);

	or (reg_rd[3], aux_reg_rd1[1], aux_reg_rd1[0]);

	//reg_rd2 = bd + bc + ab'c'
	and (aux_reg_rd2[2], reg_r[5], reg_r[3]);
	and (aux_reg_rd2[1], reg_r[5], reg_r[4]);
	and (aux_reg_rd2[0], reg_r[6], Nreg_r[5], Nreg_r[4]);

	or (reg_rd[2], aux_reg_rd2[2], aux_reg_rd2[1], aux_reg_rd2[0]);

	//reg_rd3 = a'b'ce + a'b'cd + a'bc'd' + ab'c' + a'cde
	and (aux_reg_rd3[4], Nreg_r[6], Nreg_r[5], reg_r[4], reg_r[2]);
	and (aux_reg_rd3[3], Nreg_r[6], Nreg_r[5], reg_r[4], reg_r[3]);
	and (aux_reg_rd3[2], Nreg_r[6], reg_r[5], Nreg_r[4], Nreg_r[3]);
	and (aux_reg_rd3[1], reg_r[6], Nreg_r[5], Nreg_r[4]);
	and (aux_reg_rd3[0], Nreg_r[6], reg_r[4], reg_r[3], reg_r[2]);

	or (reg_rd[1], aux_reg_rd3[4], aux_reg_rd3[3], aux_reg_rd3[2], aux_reg_rd3[1], aux_reg_rd3[0]);

	//reg_rd4 = b'c'df + b'c'de + a'b'cd'e' + b'def + bc'd' + bd'e + bcde' + ac'ef + ac'd + adf + ade + a'cd'e'f 
	and (aux_reg_rd4[11], Nreg_r[5], Nreg_r[4], reg_r[3], reg_r[1]);
	and (aux_reg_rd4[10], Nreg_r[5], Nreg_r[4], reg_r[3], reg_r[2]);
	and (aux_reg_rd4[9], Nreg_r[6], Nreg_r[5], reg_r[4], Nreg_r[3], Nreg_r[2]);
	and (aux_reg_rd4[8], Nreg_r[5], reg_r[3], reg_r[2], reg_r[1]);
	and (aux_reg_rd4[7], reg_r[5], Nreg_r[4], Nreg_r[3]);
	and (aux_reg_rd4[6], reg_r[5], Nreg_r[3], reg_r[2]);
	and (aux_reg_rd4[5], reg_r[5], reg_r[4], reg_r[3], Nreg_r[2]);
	and (aux_reg_rd4[4], reg_r[6], Nreg_r[4], reg_r[2], reg_r[1]);
	and (aux_reg_rd4[3], reg_r[6], Nreg_r[4], reg_r[3]);
	and (aux_reg_rd4[2], reg_r[6], reg_r[3], reg_r[1]);
	and (aux_reg_rd4[1], reg_r[6], reg_r[3], reg_r[2]);
	and (aux_reg_rd4[0], Nreg_r[6], reg_r[4], Nreg_r[3], Nreg_r[2], reg_r[1]);

	or (reg_rd[0], aux_reg_rd4[11], aux_reg_rd4[10], aux_reg_rd4[9], aux_reg_rd4[8], aux_reg_rd4[7], aux_reg_rd4[6], aux_reg_rd4[5], aux_reg_rd4[4], aux_reg_rd4[3], aux_reg_rd4[2], aux_reg_rd4[1], aux_reg_rd4[0]);


endmodule
