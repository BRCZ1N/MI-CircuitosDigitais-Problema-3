module modulo_codificador_dezena_rolhas(abcd, s);

input [6:0] abcd;
output [3:0] s;

wire [6:0] Nabcd;

wire [1:0] aux_a;
wire [2:0] aux_b;
wire [4:0] aux_c;
wire [12:0] aux_d;

not (Nabcd[6], abcd[6]);
not (Nabcd[5], abcd[5]);
not (Nabcd[4], abcd[4]);
not (Nabcd[3], abcd[3]);
not (Nabcd[2], abcd[2]);
not (Nabcd[1], abcd[1]);
not (Nabcd[0], abcd[0]);

//s1 = ac + ab
and (aux_a[1], abcd[6], abcd[4]);
and (aux_a[0], abcd[6], abcd[5]);

or (s[3], aux_a[1], aux_a[0]);

//s2 = bd + bc + ab'c'
and (aux_b[2], abcd[5], abcd[3]);
and (aux_b[1], abcd[5], abcd[4]);
and (aux_b[0], abcd[6], Nabcd[5], Nabcd[4]);

or (s[2], aux_b[2], aux_b[1], aux_b[0]);

//s3 = a'b'ce + a'b'cd + a'bc'd' + ab'c' + a'cde
and (aux_c[4], Nabcd[6], Nabcd[5], abcd[4], abcd[2]);
and (aux_c[3], Nabcd[6], Nabcd[5], abcd[4], abcd[3]);
and (aux_c[2], Nabcd[6], abcd[5], Nabcd[4], Nabcd[3]);
and (aux_c[1], abcd[6], Nabcd[5], Nabcd[4]);
and (aux_c[0], Nabcd[6], abcd[4], abcd[3], abcd[2]);

or (s[1], aux_c[4], aux_c[3], aux_c[2], aux_c[1], aux_c[0]);

//s4 = b'c'df + b'c'de + a'b'cd'e'f' + b'def + bc'd' + bd'e + bcde' + ac'ef + ac'd + adf + ade + a'b'cd'e'g' + bce'f
and (aux_d[12], Nabcd[5], Nabcd[4], abcd[3], abcd[1]);
and (aux_d[11], Nabcd[5], Nabcd[4], abcd[3], abcd[2]);
and (aux_d[10], Nabcd[6], Nabcd[5], abcd[4], Nabcd[3], Nabcd[2], Nabcd[1]);
and (aux_d[9], Nabcd[5], abcd[3], abcd[2], abcd[1]);
and (aux_d[8], abcd[5], Nabcd[4], Nabcd[3]);
and (aux_d[7], abcd[5], Nabcd[3], abcd[2]);
and (aux_d[6], abcd[5], abcd[4], abcd[3], Nabcd[2]);
and (aux_d[5], abcd[6], Nabcd[4], abcd[2], abcd[1]);
and (aux_d[4], abcd[6], Nabcd[4], abcd[3]);
and (aux_d[3], abcd[6], abcd[3], abcd[1]);
and (aux_d[2], abcd[6], abcd[3], abcd[2]);
and (aux_d[1], Nabcd[6], Nabcd[5], abcd[4], Nabcd[3], Nabcd[2], Nabcd[0]);
and (aux_d[0], abcd[5], abcd[4], Nabcd[2], abcd[1]);

or (s[0], aux_d[12], aux_d[11], aux_d[10], aux_d[9], aux_d[8], aux_d[7], aux_d[6], aux_d[5], aux_d[4], aux_d[3], aux_d[2], aux_d[1], aux_d[0]);


endmodule
