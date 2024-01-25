//Finalizado
module pbl(start_stop,pg,ch,cq,clock_50mhz,m,ve,al,Nal,ev,mef_estado,Nout_7seg,Nac_7segmentos,op_c_deboucing,op_deboucing,test_buffer_entrada,test_buffer_saida,test_perm_input,test_signal_min_rolhas,test_out_range_buffer,test_op_aritmetica);
	
	input start_stop,pg,ch,cq,clock_50mhz,op_c_deboucing,op_deboucing;
	output m,ve,al,ev,Nal;
	output [1:0] mef_estado;
	output [7:0] Nout_7seg;
	output [3:0] Nac_7segmentos;
	wire load_input, clk_div, op_aritmetica, out_range_buffer, sinal_duzias_reset, conta_duzias, sinal_dezenas_duzias_reset_aux,sinal_dezenas_duzias_reset, op_arimetica, signal_min_rolhas, ro;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias,display_in,ac_7segmentos, codificacao_4bits_d_garrafas, codificacao_4bits_u_garrafas, codificacao_4bits_d_rolhas,codificacao_4bits_u_rolhas;
	wire [6:0] rolhas_entrada, buffer_entrada, buffer_saida, buffer_entrada_aux, buffer_entrada_sum;
	wire [7:0] out_7seg;
	wire [5:0] transporte_aux_somadores_subtratores_completo;
	wire [1:0] sel_mux_display, sel_mux_e, perm_input;
	output [6:0] test_buffer_entrada;
	output [6:0] test_buffer_saida;
	output [1:0] test_perm_input;
	output test_signal_min_rolhas,test_out_range_buffer, test_op_aritmetica; 
	
	assign test_op_aritmetica = op_aritmetica;
	
	assign test_signal_min_rolhas = signal_min_rolhas;
	
	assign test_out_range_buffer = out_range_buffer;
	
	assign test_perm_input = perm_input;
	
	assign test_buffer_entrada = buffer_entrada;
	
	assign test_buffer_saida = buffer_saida;
	
	not(Nal,al);
	not(Nac_7segmentos[3],ac_7segmentos[3]);
	not(Nac_7segmentos[2],ac_7segmentos[2]);
	not(Nac_7segmentos[1],ac_7segmentos[1]);
	not(Nac_7segmentos[0],ac_7segmentos[0]);
	not(Nout_7seg[7],out_7seg[7]);
	not(Nout_7seg[6],out_7seg[6]);
	not(Nout_7seg[5],out_7seg[5]);
	not(Nout_7seg[4],out_7seg[4]);
	not(Nout_7seg[3],out_7seg[3]);
	not(Nout_7seg[2],out_7seg[2]);
	not(Nout_7seg[1],out_7seg[1]);
	not(Nout_7seg[0],out_7seg[0]);
	
	modulo_divisor_frequencia divisor_f(.prst(1'b0),.clr(1'b0),.clk(clock_50mhz),.clk_div(clk_div));
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(ro),.eb(sinal_duzias_reset),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs gate_1(.A(ve),.B(cq),.S(conta_duzias));
	
	modulo_contador_sync_4_bits_ascendente contador_duzias(.input_primeiro_ff(conta_duzias),.prst(1'b0),.clr(sinal_duzias_reset),.clk(clk_div),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias_reset));
	
	modulo_contador_sync_4_bits_ascendente contador_dezenas_duzias(.input_primeiro_ff(sinal_duzias_reset),.prst(1'b0),.clr(sinal_dezenas_duzias_reset),.clk(clk_div),.q(out_4_bits_dezena_duzias));
	modulo_reset_contador_dd reset_2(.cdd(out_4_bits_dezena_duzias),.rst_cdd(sinal_dezenas_duzias_reset_aux));
	
	or_gate_2_inputs gate_2(.A(start_stop),.B(sinal_dezenas_duzias_reset_aux),.S(sinal_dezenas_duzias_reset));
	
	//Circuito de contagem de rolhas
	
	modulo_contador_sync_7_bits_ascendente contador_entrada_rolhas(.prst(1'b0),.clr(1'b0),.clk(op_c_deboucing),.q(rolhas_entrada));
	
	modulo_seletor_permissoes seletor_1(.ve(ve),.min_r(signal_min_rolhas),.op(op_deboucing),.out_range_b(out_range_buffer),.perm(perm_input));
	
	modulo_seletor_load seletor_2(.ve(ve),.min_r(signal_min_rolhas),.op(op_deboucing),.out_range_b(out_range_buffer),.load(load_input));
	
	modulo_mux4_1 mux_1(.A(1'b0),.B(rolhas_entrada[6]),.C(1'b0),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[6]));
	modulo_mux4_1 mux_2(.A(1'b0),.B(rolhas_entrada[5]),.C(1'b0),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[5]));
	modulo_mux4_1 mux_3(.A(1'b0),.B(rolhas_entrada[4]),.C(1'b1),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[4]));
	modulo_mux4_1 mux_4(.A(1'b0),.B(rolhas_entrada[3]),.C(1'b0),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[3]));
	modulo_mux4_1 mux_5(.A(1'b0),.B(rolhas_entrada[2]),.C(1'b1),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[2]));
	modulo_mux4_1 mux_6(.A(1'b0),.B(rolhas_entrada[1]),.C(1'b0),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[1]));
	modulo_mux4_1 mux_7(.A(1'b1),.B(rolhas_entrada[0]),.C(1'b0),.D(1'b0),.input_sel(perm_input),.out(buffer_entrada_aux[0]));
	
	modulo_seletor_operacao_aritmetica seletor_op(.smx(perm_input),.operacao_a(op_arimetica));
	
	modulo_somador_subtrator_completo_7bits somador_subtrator_1(.op_aritmetica(op_arimetica),.a(buffer_saida),.b(buffer_entrada_aux),.sum(buffer_entrada_sum));
	
	modulo_mux2_1 mux_8(.A(buffer_saida[6]),.B(buffer_entrada_sum[6]),.SEL(load_input),.OUT(buffer_entrada[6]));
	modulo_mux2_1 mux_9(.A(buffer_saida[5]),.B(buffer_entrada_sum[5]),.SEL(load_input),.OUT(buffer_entrada[5]));
	modulo_mux2_1 mux_10(.A(buffer_saida[4]),.B(buffer_entrada_sum[4]),.SEL(load_input),.OUT(buffer_entrada[4]));
	modulo_mux2_1 mux_11(.A(buffer_saida[3]),.B(buffer_entrada_sum[3]),.SEL(load_input),.OUT(buffer_entrada[3]));
	modulo_mux2_1 mux_12(.A(buffer_saida[2]),.B(buffer_entrada_sum[2]),.SEL(load_input),.OUT(buffer_entrada[2]));
	modulo_mux2_1 mux_13(.A(buffer_saida[1]),.B(buffer_entrada_sum[1]),.SEL(load_input),.OUT(buffer_entrada[1]));
	modulo_mux2_1 mux_14(.A(buffer_saida[0]),.B(buffer_entrada_sum[0]),.SEL(load_input),.OUT(buffer_entrada[0]));
	
	modulo_registrador_rolhas buffer_rolhas_bandeja(.m_in(buffer_entrada),.clk(clk_div),.clr(1'b0),.enable(start_stop),.m_out(buffer_saida));
	
	modulo_count_superior99 m_out_range(.reg_data(buffer_entrada_sum),.cont_superior_99(out_range_buffer));
	
	modulo_valor_minimo_rolhas m_min_rolhas(.reg_r(buffer_saida),.min_signal(signal_min_rolhas));
	
	modulo_verificador_ausencia_rolhas m_aus_rolhas(.reg_r(buffer_saida),.ro(ro));
	
	modulo_contador_sync_2_bits_ascendente contador_display(.clr(1'b0),.clk(clk_div),.q(sel_mux_display));
	
	modulo_codificador_dezena_garrafas codificador_garrafas_1(.cdd(out_4_bits_dezena_duzias),.cdfd(codificacao_4bits_d_garrafas));
	modulo_codificador_unidade_garrafas codificador_garrafas_2(.cdd(out_4_bits_dezena_duzias),.cdfu(codificacao_4bits_u_garrafas));
	modulo_codificador_dezena_rolhas codificador_rolhas_1(.reg_r(buffer_saida),.reg_rd(codificacao_4bits_d_rolhas));
	modulo_codificador_unidade_rolhas codificador_rolhas_2(.reg_r(buffer_saida),.reg_ru(codificacao_4bits_u_rolhas));
	
	modulo_mux4_1 mux_15(.A(codificacao_4bits_d_garrafas[3]),.B(codificacao_4bits_u_garrafas[3]),.C(codificacao_4bits_d_rolhas[3]),.D(codificacao_4bits_u_rolhas[3]),.input_sel(sel_mux_display),.out(display_in[3]));
	modulo_mux4_1 mux_16(.A(codificacao_4bits_d_garrafas[2]),.B(codificacao_4bits_u_garrafas[2]),.C(codificacao_4bits_d_rolhas[2]),.D(codificacao_4bits_u_rolhas[2]),.input_sel(sel_mux_display),.out(display_in[2]));
	modulo_mux4_1 mux_17(.A(codificacao_4bits_d_garrafas[1]),.B(codificacao_4bits_u_garrafas[1]),.C(codificacao_4bits_d_rolhas[1]),.D(codificacao_4bits_u_rolhas[1]),.input_sel(sel_mux_display),.out(display_in[1]));
	modulo_mux4_1 mux_18(.A(codificacao_4bits_d_garrafas[0]),.B(codificacao_4bits_u_garrafas[0]),.C(codificacao_4bits_d_rolhas[0]),.D(codificacao_4bits_u_rolhas[0]),.input_sel(sel_mux_display),.out(display_in[0]));
	
	modulo_demux1_4 demux_1(.A(1'b1),.input_sel(sel_mux_display),.out(ac_7segmentos));

	modulo_decodificadorBCD_7Segmentos bcd_1(.ABCD(display_in),.ABCDEFGDP(out_7seg));
	
	
endmodule 