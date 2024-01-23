module modulo_comparador1bit(A,B , AeqBin , AltB, AeqB, AgtB);
input A, B, AeqBin;
output AltB, AeqB, AgtB; 
wire nA, nB, nAeqBin, lig_1, lig_2;

not(nAeqBin, AeqBin);
not(nA, A);
not(nB, B);

//AgtB
and_gate_3_inputs gate_1(.A(AeqBin),.B(A),.C(nB),.S(AgtB));


//AeqB
and_gate_3_inputs gate_2(.A(AeqBin),.B(nA),.C(nB),.S(lig_1));


and_gate_3_inputs gate_3(.A(AeqBin),.B(A),.C(B),.S(lig_2));


or_gate_2_inputs gate_4(.A(lig_1),.B(lig_2),.S(AeqB));


//AltB
and_gate_3_inputs gate_5(.A(AeqBin),.B(nA),.C(B),.S(AltB));


