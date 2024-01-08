module cod_7segments(A, B, C, D, a, b, c, d, e, f, g);
input A, B, C, D;
output a, b, c, d, e, f, g;

wire AnB00, AnBD00, ABn00, ABnCn00, AnBn00, AnBn01, AnBnDn00, AnBnC00, AnBD_or_ABnCn00, AnBnDn_or_AnBnC00,//Saida a(00)
AnBn10, AnCn10, AnCnDn10, AnC10, AnCD10, BnCn10, AnBn_or_AnCnDn10, AnCD_or_BnCn10,//Saida b (10)
Cn_or_D20, B_or_A20,//Saida c (20)
AnBnC30, AnBn30, AnBCnD30, AnB30, CnD30, AnCDn30, AnC30, BnCnDn30, BnCn30, AnBnC_or_AnBCnD30, AnCDn_or_BnCnDn30,//Saida d (30)
AnCDn40, BnCnDn4, BnCn40, AnC40,//Saida e (40)
AnB50, AnBCn50, AnDnB50, AnD50, ABnCn50, ABn50, AnCnDn50, AnCn50, AnBCn50_or_AnDnB50, ABnCn50_or_AnCnDn50,//Saida f (50)
AnBnC60, AnBn60, AnBCn60, AnB60, ABnCn60, ABn60, AnCDn60, AnC60, AnBnC60_or_AnBCn60, ABnCn60_or_AnCDn60;//Saida v (60)
		
not (An, A);
not (Bn, B);
not (Cn, C);
not (Dn, D);

//Saida a = A'BD + AB'C' + A'B'D' + A'B'C
and (AnB00, An, B);
and (AnBD00, AnB00, D);
and (ABn00, A, Bn);
and (ABnCn00, ABn00, Cn);
and (AnBn00, An, Bn);
and (AnBnDn00, AnBn00, Dn);
and (AnBn01, An, Bn);
and (AnBnC00, AnBn01, C);

or (AnBD_or_ABnCn01, AnBD01, ABnCn01);
or (AnBnDn_or_AnBnC01, AnBnDn01, AnBnDn01);
or (a, AnBD_or_ABnCn01, AnBnDn_or_AnBnC01);

//Saida b = A'B' + A'C'D' + A'CD + B'C'
and (AnBn10, An, Bn);
and (AnCn10, An, Cn);
and (AnCnDn10, AnCn10, Dn);
and (AnC10, An, C);
and (AnCD10, AnC10, D);
and (BnCn10, Bn, Cn);

or (AnBn03_or_AnCnDn10, AnBn10, AnCnDn10);
or (AnCD_or_BnCn10, AnCD10, BnCn10);
or (b, AnBn03_or_AnCnDn10, AnCD_or_BnCn10);

//Saida c = C' + D + B + A
or (Cn_or_D20, Cn, D);
or (B_or_A20, B, A);
or (c, Cn_or_D20, B_or_A20);

//Saida  d = A'B'C + A'BC'D + A'CD' + B'C'D'
and (AnBn30, An, Bn);
and (AnBnC30, AnBn30, C);

and (AnB30, An, B);
and (CnD30, Cn, D);
and (AnBCnD30, AnB30, CnD30);

and (AnC30, An, C);
and (AnCDn30, AnC30, Dn);

and (BnCn30, Bn, Cn);
and (BnCnDn30, BnCn30, Dn);

or (AnBnC_or_AnBCnD30, AnBnC30, AnBCnD30);
or (AnCDn_or_BnCnDn30, AnCDn30, BnCnDn30);
or (d, AnBnC_or_AnBCnD30, AnCDn_or_BnCnDn30);

// Saida e =  A'CD' + B'C'D'
and (AnC40, An, C);
and (AnCDn40, AnC40, Dn);
and (BnCn40, Bn, Cn);
and (BnCnDn40, BnCn40, Dn);

or (e, AnCDn40, BnCnDn40);

// Saida f = A'BC' + A'BD' + AB'C' + A'C'D'
and (AnB50, An, B);
and (AnBCn50, AnB50, Cn);

and (AnD50, An, D);
and (AnDnB50, AnD50, B);

and (ABn50, A, Bn);
and (ABnCn50, ABn50, Cn);

and (AnCn50, An, Cn);
and (AnCnDn50, AnCn50, Dn);

or (AnBCn50_or_AnDnB50, AnBCn50, AnDnB50);
or (ABnCn50_or_AnCnDn50 ,ABnCn50, AnCnDn50);
or (f, AnBCn50_or_AnDnB50, ABnCn50_or_AnCnDn50);

// Saida g = A'B'C + A'BC' + AB'C' + A'CD'
and (AnBn60, An, Bn);
and (AnBnC60, AnBn60, C);

and (AnB60, An, B);
and (AnBCn60, AnB60, Cn);

and (ABn60, A, Bn);
and (ABnCn60, ABn60, Cn);

and (AnC60, An, C);
and (AnCDn60, AnC60, Dn);

or (AnBnC60_or_AnBCn60, AnBnC60, AnBCn60);
or (ABnCn60_or_AnCDn60, ABnCn60, AnCDn60);
or (g, AnBnC60_or_AnBCn60, ABnCn60_or_AnCDn60);

endmodule 















