module schemeA01_LAB_5(E,S);

input E;
output S;
wire w1,w2,w3;

nand(w1,E,E);

nand(w2,w1,w1);

nand(w3,w2,w2);

nand(S,w3,w3);

endmodule

