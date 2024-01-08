module pbl(start_stop,pg,ch,ro,cq,clock_50mhz,m,ve,al,ev,mef_estado);
	
	
	input start_stop,pg,ch,ro,cq,clock_50mhz;
	output m,ve,al,ev;
	output [1:0] mef_estado;
	wire clk_div, sinal_duzias, conta_duzias;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias;
	
	modulo_divisor_frequencia(.clk(clock_50mhz),.clr(1'b0),.clk_div(clk_div));
	
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(),.eb(sinal_duzias),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs(.A(ve),.B(cq),.S(conta_duzias));
	modulo_contador_sync_4_bits contador_duzias(.input_primeiro_ff(conta_duzias),.clr(1'b0),.clk(clk_div),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias));
	modulo_contador_sync_4_bits contador_dezenas_duzias(.input_primeiro_ff(sinal_duzias),.clr(1'b0),.clk(clk_div),.q(out_4_bits_dezena_duzias));
	
	//Circuito de contagem de rolhas
	
	
	
endmodule 