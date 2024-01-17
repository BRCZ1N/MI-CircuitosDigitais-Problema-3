module modulo_decodificadorBCD_7Segmentos(ABCD, ABCDEFGDP);

input [3:0] ABCD;
output [7:0] ABCDEFGDP;
wire [3:0] NABCD;
wire [1:0] aux_A,aux_B; 
wire [3:0] aux_D,aux_F;
wire [2:0] aux_E,aux_G;
		
not (NABCD[3], ABCD[3]);
not (NABCD[2], ABCD[2]);
not (NABCD[1], ABCD[1]);
not (NABCD[0], ABCD[0]);

//Saida A = A + C + BD + B'D'

and_gate_2_inputs gate_1(.A(ABCD[2]),.B(ABCD[0]),.S(aux_A[1]));
and_gate_2_inputs gate_2(.A(NABCD[2]),.B(NABCD[0]),.S(aux_A[0]));
		
or_gate_4_inputs gate_3(.A(ABCD[3]),.B(ABCD[1]),.C(aux_A[1]),.D(aux_A[0]),.S(ABCDEFGDP[7]));
	

//Saida B = B' + CD + C'D' 

and_gate_2_inputs gate_4(.A(ABCD[1]),.B(ABCD[0]),.S(aux_B[1]));
and_gate_2_inputs gate_5(.A(NABCD[1]),.B(NABCD[0]),.S(aux_B[0]));
		
or_gate_3_inputs gate_6(.A(NABCD[2]),.B(aux_B[1]),.C(aux_B[0]),.S(ABCDEFGDP[6]));


//Saida C = B + C' + D

		
or_gate_3_inputs gate_7(.A(ABCD[2]),.B(NABCD[1]),.C(ABCD[0]),.S(ABCDEFGDP[5]));


//Saida D = A + B'D' + CB' + CD'+ BC'D

and_gate_2_inputs gate_8(.A(NABCD[2]),.B(NABCD[0]),.S(aux_D[3]));
and_gate_2_inputs gate_9(.A(ABCD[1]),.B(NABCD[2]),.S(aux_D[2]));
and_gate_2_inputs gate_10(.A(ABCD[1]),.B(NABCD[0]),.S(aux_D[1]));
and_gate_3_inputs gate_11(.A(ABCD[2]),.B(NABCD[1]),.C(ABCD[0]),.S(aux_D[0]));
		
or_gate_5_inputs gate_12(.A(ABCD[3]),.B(aux_D[3]),.C(aux_D[2]),.D(aux_D[1]),.E(aux_D[0]),.S(ABCDEFGDP[4]));


// Saida E =  B'D'+ CD'

and_gate_2_inputs gate_13(.A(NABCD[2]),.B(NABCD[0]),.S(aux_E[1]));
and_gate_2_inputs gate_14(.A(ABCD[1]),.B(NABCD[0]),.S(aux_E[0]));

or_gate_2_inputs gate_15(.A(aux_E[1]),.B(aux_E[0]),.S(ABCDEFGDP[3]));


// Saida F = A + C'D' + C'B + BD'

and_gate_2_inputs gate_16(.A(NABCD[1]),.B(NABCD[0]),.S(aux_F[2]));
and_gate_2_inputs gate_17(.A(NABCD[1]),.B(ABCD[2]),.S(aux_F[1]));
and_gate_2_inputs gate_18(.A(ABCD[2]),.B(NABCD[0]),.S(aux_F[0]));

or_gate_4_inputs gate_19(.A(ABCD[3]),.B(aux_F[2]),.C(aux_F[1]),.D(aux_F[0]),.S(ABCDEFGDP[2]));


// Saida G = A + BC' + B'C + BD'

and_gate_2_inputs gate_20(.A(ABCD[2]),.B(NABCD[1]),.S(aux_G[2]));
and_gate_2_inputs gate_21(.A(NABCD[2]),.B(ABCD[1]),.S(aux_G[1]));
and_gate_2_inputs gate_22(.A(ABCD[2]),.B(NABCD[0]),.S(aux_G[0]));

or_gate_4_inputs gate_23(.A(ABCD[3]),.B(aux_G[2]),.C(aux_G[1]),.D(aux_G[0]),.S(ABCDEFGDP[1]));

// Saida DP = 1

and_gate_2_inputs gate_24(.A(1'b1),.B(1'b1),.S(ABCDEFGDP[0]));

endmodule 















