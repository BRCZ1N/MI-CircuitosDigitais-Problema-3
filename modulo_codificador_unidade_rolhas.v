module modulo_codificador_unidade_rolhas(int, s);
input [6:0] int;
output  [3:0]s;

wire [6:0] Nint;

wire [13:0] aux_a;
wire [10:0] aux_b;
wire [9:0] aux_c;

not (Nint[6], int[6]);
not (Nint[5], int[5]);
not (Nint[4], int[4]);
not (Nint[3], int[3]);
not (Nint[2], int[2]);
not (Nint[1], int[1]);
not (Nint[0], int[0]);

//s3 = a'b'de'f'g' + a'b'cde' + a'bc'd'e'f + bc'de + bcd'ef + ac'def' + acef + a'b'c'd'e + a'b'c'ef + a'b'cd'f' + a'cde'f' + ac'd'e'f' + ab'c'e'f + b'cd'ef'
and (aux_a[13], Nint[6], Nint[5], int[3], Nint[2], Nint[1], Nint[0]);
and (aux_a[12], Nint[6], Nint[5], int[4], int[3], Nint[2]);
and (aux_a[11], Nint[6], int[5], Nint[4], Nint[3], Nint[2], int[1]);
and (aux_a[10], int[5], Nint[4], int[3], int[2]);
and (aux_a[9], int[5], int[4], Nint[3], int[2], int[1]);
and (aux_a[8], int[6], Nint[4], int[3], int[2], Nint[1]);
and (aux_a[7], int[6], int[4], int[2], int[1]);
and (aux_a[6], Nint[6], Nint[5], Nint[4], Nint[3], int[2]);
and (aux_a[5], Nint[6], Nint[5], Nint[4], int[2], int[1]);
and (aux_a[4], Nint[6], Nint[5], int[4], Nint[3], Nint[1]);
and (aux_a[3], Nint[6], int[4], int[3], Nint[2], Nint[1]);
and (aux_a[2], int[6], Nint[4], Nint[3], Nint[2], Nint[1]);
and (aux_a[1], int[6], Nint[5], Nint[4], Nint[2], int[1]);
and (aux_a[0], Nint[5], int[4], Nint[3], int[2], Nint[1]);
or (s[3], aux_a[13], aux_a[12], aux_a[11], aux_a[10], aux_a[9], aux_a[8], aux_a[7], aux_a[6], aux_a[5], aux_a[4], aux_a[3], aux_a[2], aux_a[1], aux_a[0]);

//s2 = b'c'def' + a'cd'e'f' + a'b'cde'f + bd'f' + bc'df + bdef + ac'df' + adef' + a'b'c'd'f + b'cd'ef + ab'd'e'f
and (aux_b[10], Nint[5], Nint[4], int[3], int[2], Nint[1]);
and (aux_b[9], Nint[6], int[4], Nint[3], Nint[2], Nint[1]);
and (aux_b[8], Nint[6], Nint[5], int[4], int[3], Nint[2], int[1]);
and (aux_b[7], int[5], Nint[3], Nint[1]);
and (aux_b[6], int[5], Nint[4], int[3], int[1]);
and (aux_b[5], int[5], int[3], int[2], int[1]);
and (aux_b[4], int[6], Nint[4], int[3], Nint[1]);
and (aux_b[3], int[6], int[3], int[2], Nint[1]);
and (aux_b[2], Nint[6], Nint[5], Nint[4], Nint[3], int[1]);
and (aux_b[1], Nint[5], int[4], Nint[3], int[2], int[1]);
and (aux_b[0], int[6], Nint[5], Nint[3], Nint[2], int[1]);
or (s[2], aux_b[10], aux_b[9], aux_b[8], aux_b[7], aux_b[6], aux_b[5], aux_b[4], aux_b[3], aux_b[2], aux_b[1], aux_b[0]);

//s1 = a'b'c'de'f' + a'b'cd'e'f + a'b'cdef' + bc'd'ef + bcd'e'f' + bcde'f + ac'd'ef' + ac'def + acde'f' + abf
and (aux_c[9], Nint[6], Nint[5], Nint[4], int[3], Nint[2], Nint[1]);
and (aux_c[8], Nint[6], Nint[5], int[4], Nint[3], Nint[2], int[1]);
and (aux_c[7], Nint[6], Nint[5], int[4], int[3], int[2], Nint[1]);
and (aux_c[6], int[5], Nint[4], Nint[3], int[2], int[1]);
and (aux_c[5], int[5], int[4], Nint[3], Nint[2], Nint[1]);
and (aux_c[4], int[5], int[4], int[3], Nint[2], int[1]);
and (aux_c[3], int[6], Nint[4], Nint[3], int[2], Nint[1]);
and (aux_c[2], int[6], Nint[4], int[3], int[2], int[1]);
and (aux_c[1], int[6], int[4], int[3], Nint[2], Nint[1]);
and (aux_c[0], int[6], int[5], int[1]);
or (s[1], aux_c[9], aux_c[8], aux_c[7], aux_c[6], aux_c[5], aux_c[4], aux_c[3], aux_c[2], aux_c[1], aux_c[0]);
  
//s0 = g
and (s[0], int[0]);

endmodule 












