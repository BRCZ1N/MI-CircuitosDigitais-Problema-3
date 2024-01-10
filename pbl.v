module pbl(start_stop,pg,ch,cq,clock_50mhz,m,ve,al,ev,mef_estado,Nout_7seg,Nac_7segmentos,op_c_deboucing,op_deboucing);
	
	input start_stop,pg,ch,cq,clock_50mhz,op_c_deboucing,op_deboucing;
	output m,ve,al,ev;
	output [1:0] mef_estado;
	output [6:0] Nout_7seg;
	output [3:0] Nac_7segmentos;
	wire clk_div, sinal_duzias_reset, conta_duzias, sinal_dezenas_duzias_reset_aux,sinal_dezenas_duzias_reset, op_arimetica;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias,display_in,ac_7segmentos;
	wire [6:0] rolhas_entrada, buffer_entrada, buffer_saida, buffer_entrada_aux,out_7seg;
	wire [5:0] transporte_aux_somadores_subtratores_completo;
	wire [1:0] sel_mux_e,sel_mux_display;
	
	not(Nac_7segmentos[3],ac_7segmentos[3]);
	not(Nac_7segmentos[2],ac_7segmentos[2]);
	not(Nac_7segmentos[1],ac_7segmentos[1]);
	not(Nac_7segmentos[0],ac_7segmentos[0]);
	not(Nout_7seg[6],out_7seg[6]);
	not(Nout_7seg[5],out_7seg[5]);
	not(Nout_7seg[4],out_7seg[4]);
	not(Nout_7seg[3],out_7seg[3]);
	not(Nout_7seg[2],out_7seg[2]);
	not(Nout_7seg[1],out_7seg[1]);
	not(Nout_7seg[0],out_7seg[0]);
	
	
	modulo_divisor_frequencia divisor_f(.clk(clock_50mhz),.clr(1'b0),.clk_div(clk_div));
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(),.eb(sinal_duzias_reset),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs gate_1(.A(ve),.B(cq),.S(conta_duzias));
	
	modulo_contador_sync_4_bits contador_duzias(.input_primeiro_ff(conta_duzias),.clr(sinal_duzias_reset),.clk(clk_div),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias_reset));
	
	modulo_contador_sync_4_bits contador_dezenas_duzias(.input_primeiro_ff(sinal_duzias_reset),.clr(sinal_dezenas_duzias_reset),.clk(clk_div),.q(out_4_bits_dezena_duzias));
	modulo_reset_contador_dd reset_2(.cdd(out_4_bits_dezena_duzias), .rst_cdd(sinal_dezenas_duzias_reset_aux));
	
	or_gate_2_inputs gate_2(.A(start_stop),.B(sinal_dezenas_duzias_reset_aux),.S(sinal_dezenas_duzias_reset));
	
	//Circuito de contagem de rolhas
	
	modulo_contador_sync_7_bits contador_entrada_rolhas(.clr(1'b0),.clk(op_c_deboucing),.q(rolhas_entrada));
	
	modulo_seletor_permissoes seletor_1(.ve(ve),.min_r(),.op(op_deboucing),.sel_perm(sel_mux_e));
	
	modulo_mux4_1 mux_1(.A(1'b0),.B(rolhas_entrada[6]),.C(1'b0),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[6]));
	modulo_mux4_1 mux_2(.A(1'b0),.B(rolhas_entrada[5]),.C(1'b0),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[5]));
	modulo_mux4_1 mux_3(.A(1'b0),.B(rolhas_entrada[4]),.C(1'b1),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[4]));
	modulo_mux4_1 mux_4(.A(1'b0),.B(rolhas_entrada[3]),.C(1'b0),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[3]));
	modulo_mux4_1 mux_5(.A(1'b0),.B(rolhas_entrada[2]),.C(1'b1),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[2]));
	modulo_mux4_1 mux_6(.A(1'b0),.B(rolhas_entrada[1]),.C(1'b0),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[1]));
	modulo_mux4_1 mux_7(.A(1'b1),.B(rolhas_entrada[0]),.C(1'b0),.D(1'b0),.input_sel(sel_mux_e),.out(buffer_entrada_aux[0]));
	
	modulo_seletor_operacao_aritmetica(.smx(sel_mux_e),.operacao_a(op_arimetica));
	
	modulo_somador_subtrator_completo somador_subtrator_1(.m(op_arimetica),.a(buffer_saida[6]),.b(buffer_entrada_aux[6]),.Te(1'b0),.S(buffer_entrada[6]),.Ts(transporte_aux_somadores_subtratores_completo[5]));
	modulo_somador_subtrator_completo somador_subtrator_2(.m(op_arimetica),.a(buffer_saida[5]),.b(buffer_entrada_aux[5]),.Te(transporte_aux_somadores_subtratores_completo[5]),.S(buffer_entrada[5]),.Ts(transporte_aux_somadores_subtratores_completo[4]));
	modulo_somador_subtrator_completo somador_subtrator_3(.m(op_arimetica),.a(buffer_saida[4]),.b(buffer_entrada_aux[4]),.Te(transporte_aux_somadores_subtratores_completo[4]),.S(buffer_entrada[4]),.Ts(transporte_aux_somadores_subtratores_completo[3]));
	modulo_somador_subtrator_completo somador_subtrator_4(.m(op_arimetica),.a(buffer_saida[3]),.b(buffer_entrada_aux[3]),.Te(transporte_aux_somadores_subtratores_completo[3]),.S(buffer_entrada[3]),.Ts(transporte_aux_somadores_subtratores_completo[2]));
	modulo_somador_subtrator_completo somador_subtrator_5(.m(op_arimetica),.a(buffer_saida[2]),.b(buffer_entrada_aux[2]),.Te(transporte_aux_somadores_subtratores_completo[2]),.S(buffer_entrada[2]),.Ts(transporte_aux_somadores_subtratores_completo[1]));
	modulo_somador_subtrator_completo somador_subtrator_6(.m(op_arimetica),.a(buffer_saida[1]),.b(buffer_entrada_aux[1]),.Te(transporte_aux_somadores_subtratores_completo[1]),.S(buffer_entrada[1]),.Ts(transporte_aux_somadores_subtratores_completo[0]));
	modulo_somador_subtrator_completo somador_subtrator_7(.m(op_arimetica),.a(buffer_saida[0]),.b(buffer_entrada_aux[0]),.Te(transporte_aux_somadores_subtratores_completo[0]),.S(buffer_entrada[0]),.Ts();
	
	modulo_registrador_rolhas buffer_rolhas(.m_in(buffer_entrada),.clk(clk_div),.clr(1'b0),.enable(start_stop),.m_out(buffer_saida));
	
	modulo_contador_sync_2_bits contador_display(.clr(1'b0),.clk(clk_div),.q(sel_mux_display));
	
	modulo_mux4_1 mux_8(.A(),.B(),.C(),.D(),.input_sel(sel_mux_display),.out(display_in[3]));
	modulo_mux4_1 mux_9(.A(),.B(),.C(),.D(),.input_sel(sel_mux_display),.out(display_in[2]));
	modulo_mux4_1 mux_10(.A(),.B(),.C(),.D(),.input_sel(sel_mux_display),.out(display_in[1]));
	modulo_mux4_1 mux_11(.A(),.B(),.C(),.D(),.input_sel(sel_mux_display),.out(display_in[0]));
	
	modulo_demux1_4(.A(1'b1),.input_sel(sel_mux_display),.out(ac_7segmentos));

	decodificadorBCD_7Segmentos bcd_1(.ABCD(display_in),.ABCDEFG(out_7seg));
	
	
endmodule 