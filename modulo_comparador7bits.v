module modulo_comparador7bits(A,B,AltB_out, AeqB_out, AgtB_out);
input [6:0]A,B;
output AltB_out, AeqB_out, AgtB_out; 
wire [6:0]AgtB,AltB,AeqB;		
wire[5:0]AeqBin;


modulo_comparador1bit comparador_1(.A(A[6]),.B(B[6]),.AeqBin(1'b1),.AltB(AltB[6]),.AeqB(AeqBin[5]),.AgtB(AgtB[6]));

modulo_comparador1bit comparador_2(.A(A[5]),.B(B[5]),.AeqBin(AeqBin[5]),.AltB(AltB[5]),.AeqB(AeqBin[4]),.AgtB(AgtB[5]));

modulo_comparador1bit comparador_3(.A(A[4]),.B(B[4]),.AeqBin(AeqBin[4]),.AltB(AltB[4]),.AeqB(AeqBin[3]),.AgtB(AgtB[4]));

modulo_comparador1bit comparador_4(.A(A[3]),.B(B[3]),.AeqBin(AeqBin[3]),.AltB(AltB[3]),.AeqB(AeqBin[2]),.AgtB(AgtB[3]));

modulo_comparador1bit comparador_5(.A(A[2]),.B(B[2]),.AeqBin(AeqBin[2]),.AltB(AltB[2]),.AeqB(AeqBin[1]),.AgtB(AgtB[2]));

modulo_comparador1bit comparador_6(.A(A[1]),.B(B[1]),.AeqBin(AeqBin[1]),.AltB(AltB[1]),.AeqB(AeqBin[0]),.AgtB(AgtB[1]));

modulo_comparador1bit comparador_7(.A(A[0]),.B(B[0]),.AeqBin(AeqBin[0]),.AltB(AltB[0]),.AeqB(AeqB_out),.AgtB(AgtB[0]));


or_gate_7_inputs gate_1 (.A(AgtB[6]),.B(AgtB[5]),.C(AgtB[4]),.D(AgtB[3]),.E(AgtB[2]),.F(AgtB[1]),.G(AgtB[0]),.S(AgtB_out));


or_gate_7_inputs gate_2 (.A(AltB[6]),.B(AltB[5]),.C(AltB[4]),.D(AltB[3]),.E(AltB[2]),.F(AltB[1]),.G(AltB[0]),.S(AltB_out));

endmodule 