//Finalizado
module pbl(start_stop,pg,ch,cq,clock_50mhz,m,ve,al,Nal,ev,mef_estado,Nout_7seg,Nac_7segmentos,op_c,op,op_clr,buffer_principal);
	
	input start_stop,pg,ch,cq,clock_50mhz,op_c,op,op_clr;
	output m,ve,al,ev,Nal;
	output [1:0] mef_estado;
	output [7:0] Nout_7seg;
	output [3:0] Nac_7segmentos;
	output [4:0] buffer_principal;
	
	wire Nf_rolha_input, f_rolha_input, estado_vedacao, enable_buffer_principal, Nenable_count_operador, enable_count_min_rolhas_aux, reset_ff_operador, reset_ff_rolhas, controle_reset_aux_min_rolhas;
	wire load_count_operador, enable_count_operador, enable_count_min_rolhas, load_count_min_rolhas, enable_buffer_secundario, Nop_c_deboucing, controle_reset_aux_operador; 
	wire Nestado_vedacao, Nout_range_buffer, Nop_deboucing, Nstart_stop, comparator_aux, clk_div, enable_count_operador_aux;
	wire op_clr_deboucing, op_c_deboucing,op_deboucing,Nsinal_dezenas_duzias_reset, Nsinal_duzias_reset, out_range_buffer, sinal_duzias_reset, conta_duzias, sinal_dezenas_duzias_reset_aux;
	wire Nop_clr, Nop,Nop_c, Nop_clr_deboucing,sinal_dezenas_duzias_reset, signal_min_rolhas, ro, min_trans_rolhas;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias,display_in, ac_7segmentos, codificacao_4bits_d_garrafas;
	wire [3:0] codificacao_4bits_u_garrafas, codificacao_4bits_d_rolhas,codificacao_4bits_u_rolhas;
	wire [6:0] min_rolhas, Nbuffer_secundario_controle_operador, buffer_secundario_controle_operador, buffer_secundario;
	wire [6:0] Nrolhas_entrada_secundario, buffer_secundario_atual_sum_op, buffer_secundario_aux, buffer_entrada_aux_secundario_out, rolhas_entrada_secundario;
	wire [2:0] out_comparador;
	wire [7:0] out_7seg;
	wire [1:0] Nmef_estado, load_input_pulse, contador_mef_controle_state_rolha, contador_mef_controle_state_operador;
	wire [1:0] load_reg, Nload_reg, sel_mux_display, load_aux;
	wire [4:0] Nbuffer_secundario_controle_min_rolhas, buffer_secundario_controle_min_rolhas;
	
	not(Nf_rolha_input,f_rolha_input);
	and(f_rolha_input,Nrolhas_entrada_secundario[6],Nrolhas_entrada_secundario[5],Nrolhas_entrada_secundario[4],Nrolhas_entrada_secundario[3],Nrolhas_entrada_secundario[2],Nrolhas_entrada_secundario[1],Nrolhas_entrada_secundario[0]);
	
	and(min_rolhas[6],1'b1,1'b0);
	and(min_rolhas[5],1'b1,1'b0);
	and(min_rolhas[4],1'b1,1'b1);
	and(min_rolhas[3],1'b1,1'b0);
	and(min_rolhas[2],1'b1,1'b1);
	and(min_rolhas[1],1'b1,1'b0);
	and(min_rolhas[0],1'b1,1'b0);
	
	not(Nrolhas_entrada_secundario[6],rolhas_entrada_secundario[6]);
	not(Nrolhas_entrada_secundario[5],rolhas_entrada_secundario[5]);
	not(Nrolhas_entrada_secundario[4],rolhas_entrada_secundario[4]);
	not(Nrolhas_entrada_secundario[3],rolhas_entrada_secundario[3]);
	not(Nrolhas_entrada_secundario[2],rolhas_entrada_secundario[2]);
	not(Nrolhas_entrada_secundario[1],rolhas_entrada_secundario[1]);
	not(Nrolhas_entrada_secundario[0],rolhas_entrada_secundario[0]);
		
	not(Nop_clr,op_clr);
	not(Nop,op);
	not(Nop_c,op_c);
	not(Nsinal_duzias_reset,sinal_duzias_reset);
	not(Nsinal_dezenas_duzias_reset,sinal_dezenas_duzias_reset);
	not(Nestado_vedacao,estado_vedacao);
	not(Nload_reg[1], load_reg[1]);
	not(Nload_reg[0], load_reg[0]);
	not(Nmef_estado[1],mef_estado[1]);
	not(Nmef_estado[0],mef_estado[0]);
	not(Nenable_count_operador,enable_count_operador);
	not(Nbuffer_secundario_controle_min_rolhas[4],buffer_secundario_controle_min_rolhas[4]);
	not(Nbuffer_secundario_controle_min_rolhas[3],buffer_secundario_controle_min_rolhas[3]);
	not(Nbuffer_secundario_controle_min_rolhas[2],buffer_secundario_controle_min_rolhas[2]);
	not(Nbuffer_secundario_controle_min_rolhas[1],buffer_secundario_controle_min_rolhas[1]);
	not(Nbuffer_secundario_controle_min_rolhas[0],buffer_secundario_controle_min_rolhas[0]);
	not(Nbuffer_secundario_controle_operador[6],buffer_secundario_controle_operador[6]);
	not(Nbuffer_secundario_controle_operador[5],buffer_secundario_controle_operador[5]);
	not(Nbuffer_secundario_controle_operador[4],buffer_secundario_controle_operador[4]);
	not(Nbuffer_secundario_controle_operador[3],buffer_secundario_controle_operador[3]);
	not(Nbuffer_secundario_controle_operador[2],buffer_secundario_controle_operador[2]);
	not(Nbuffer_secundario_controle_operador[1],buffer_secundario_controle_operador[1]);
	not(Nbuffer_secundario_controle_operador[0],buffer_secundario_controle_operador[0]);
	not(Nop_c_deboucing,op_c_deboucing);
	not(Nout_range_buffer,out_range_buffer);
	not(Nop_deboucing, op_deboucing);
	not(Nop_clr_deboucing,op_clr_deboucing);
	not(Nal,al);
	not(Nstart_stop,start_stop);
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
	
	LevelToPulseMoore pulsador_3(.Clock(clk_div),.Reset(),.Level(Nop_c),.Pulse(op_c_deboucing));
	LevelToPulseMoore pulsador_4(.Clock(clk_div),.Reset(),.Level(Nop),.Pulse(op_deboucing));
	LevelToPulseMoore pulsador_5(.Clock(clk_div),.Reset(),.Level(Nop_clr),.Pulse(op_clr_deboucing));
	
	modulo_divisor_frequencia divisor_f(.prst(1'b1),.clr(1'b1),.clk(clock_50mhz),.clk_div(clk_div));
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(ro),.eb(sinal_duzias_reset),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs gate_1(.A(ve),.B(cq),.S(conta_duzias));
	
	modulo_contador_sync_4_bits_ascendente contador_duzias(.prst(1'b1),.clr(Nsinal_duzias_reset),.clk(conta_duzias),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias_reset));
	
	modulo_contador_sync_4_bits_ascendente contador_dezenas_duzias(.prst(1'b1),.clr(Nsinal_dezenas_duzias_reset),.clk(sinal_duzias_reset),.q(out_4_bits_dezena_duzias));
	modulo_reset_contador_dd reset_2(.cdd(out_4_bits_dezena_duzias),.rst_cdd(sinal_dezenas_duzias_reset_aux));
	
	or_gate_2_inputs gate_2(.A(Nstart_stop),.B(sinal_dezenas_duzias_reset_aux),.S(sinal_dezenas_duzias_reset));
	
	//Circuito auxiliar de contagem de rolhas
	
	or(comparator_aux, out_comparador[1], out_comparador[0]);
	and(load_aux[1],start_stop,Nf_rolha_input,op_deboucing,Nout_range_buffer);
	and(load_aux[0],start_stop,Nop_deboucing,comparator_aux,signal_min_rolhas,min_trans_rolhas);
	
	LevelToPulseMoore pulsador_1(.Clock(clk_div),.Reset(),.Level(load_aux[0]),.Pulse(load_input_pulse[0]));
	LevelToPulseMoore pulsador_2(.Clock(clk_div),.Reset(),.Level(load_aux[1]),.Pulse(load_input_pulse[1]));
	
	modulo_contador_sync_7_bits_ascendente contador_entrada_rolhas(.prst(1'b1),.clr(Nop_clr_deboucing),.enable(1'b1),.clk(op_c_deboucing),.q(rolhas_entrada_secundario));
	
	modulo_registrador_rolhas registrador_1(.m_in(buffer_secundario),.clk(clk_div),.m_out(buffer_secundario_aux),.enable(1'b1));
	modulo_somador_subtrator_completo_7bits somador_1(.op_aritmetica(1'b0),.a(buffer_secundario),.b(rolhas_entrada_secundario),.sum(buffer_secundario_atual_sum_op));
	modulo_registrador_rolhas registrador_2(.m_in(buffer_secundario_atual_sum_op),.clk(clk_div),.m_out(buffer_entrada_aux_secundario_out),.enable(1'b1));
	
	modulo_comparador7bits comparador_1(.A(buffer_secundario),.B(min_rolhas),.AltB_out(out_comparador[2]),.AeqB_out(out_comparador[1]),.AgtB_out(out_comparador[0]));
	
	modulo_ff_d ff_1(.d(1'b1),.clk(load_input_pulse[0]),.clr(reset_ff_rolhas),.enable(1'b1),.q(load_reg[0]),.nq());
	modulo_ff_d ff_2(.d(1'b1),.clk(load_input_pulse[1]),.clr(reset_ff_operador),.enable(1'b1),.q(load_reg[1]),.nq());
	
	and(controle_reset_aux_min_rolhas, Nbuffer_secundario_controle_min_rolhas[4], Nbuffer_secundario_controle_min_rolhas[3], Nbuffer_secundario_controle_min_rolhas[2], Nbuffer_secundario_controle_min_rolhas[1], buffer_secundario_controle_min_rolhas[0]);
	and(controle_reset_aux_operador, Nbuffer_secundario_controle_operador[6], Nbuffer_secundario_controle_operador[5], Nbuffer_secundario_controle_operador[4], Nbuffer_secundario_controle_operador[3], Nbuffer_secundario_controle_operador[2], Nbuffer_secundario_controle_operador[1], buffer_secundario_controle_operador[0]);
	
	xor(enable_buffer_secundario,enable_count_min_rolhas,enable_count_operador);
	
	and(estado_vedacao, mef_estado[1], mef_estado[0]);
	
	and(enable_count_min_rolhas,start_stop,Nestado_vedacao,Nload_reg[1],enable_count_min_rolhas_aux);
	and(enable_count_operador,start_stop,enable_count_operador_aux);
	
	modulo_mef_controle_contador mef_contador_controle_1(.enable(1'b1),.Load_Reg(load_reg[0]),.EmptyBuffer(controle_reset_aux_min_rolhas),.clk(clk_div),.Enable_C(enable_count_min_rolhas_aux),.Load_C(load_count_min_rolhas),.Clear_Reg(reset_ff_rolhas),.q0(contador_mef_controle_state_rolha[0]),.q1(contador_mef_controle_state_rolha[1]));
	modulo_mef_controle_contador mef_contador_controle_2(.enable(1'b1),.Load_Reg(load_reg[1]),.EmptyBuffer(controle_reset_aux_operador),.clk(clk_div),.Enable_C(enable_count_operador_aux),.Load_C(load_count_operador),.Clear_Reg(reset_ff_operador),.q0(contador_mef_controle_state_operador[0]),.q1(contador_mef_controle_state_operador[1]));
	
	modulo_contador_sync_7_bits_ascendente_descendente contador_1_buffer_secundario(.clk(clk_div),.enable(enable_buffer_secundario),.q(buffer_secundario),.up_down(load_reg[1]));
	modulo_contador_sync_5_bits_ascendente_descendente contador_2_buffer_secundario_controle_rolhas(.clk(clk_div),.enable(enable_count_min_rolhas),.q(buffer_secundario_controle_min_rolhas),.load(load_count_min_rolhas),.e_load(min_rolhas[4:0]),.up_down(1'b0));
	modulo_contador_sync_7_bits_ascendente_descendente contador_3_buffer_secundario_controle_operador(.clk(clk_div),.enable(enable_count_operador),.q(buffer_secundario_controle_operador),.load(load_count_operador),.e_load(rolhas_entrada_secundario),.up_down(1'b0));
	
	or(enable_buffer_principal,estado_vedacao,enable_count_min_rolhas);
	
	modulo_contador_sync_5_bits_ascendente_descendente contador_4_buffer_principal(.clk(clk_div),.enable(enable_buffer_principal),.q(buffer_principal),.up_down(Nestado_vedacao));
	
	modulo_count_superior99 m_out_range(.reg_data(buffer_secundario_atual_sum_op),.cont_superior_99(out_range_buffer));
	modulo_valor_transfer_rolhas m_trans_rolha(.reg_r(buffer_secundario),.transfer_rolhas(min_trans_rolhas));
	modulo_valor_minimo_rolhas m_min_rolhas(.reg_r(buffer_principal),.min_signal(signal_min_rolhas));
	modulo_verificador_ausencia_rolhas m_aus_rolhas(.reg_r(buffer_principal),.ro(ro));
	modulo_contador_sync_2_bits_ascendente contador_display(.prst(1'b1),.clr(1'b1),.clk(clk_div),.q(sel_mux_display));
	
	modulo_codificador_dezena_garrafas codificador_garrafas_1(.cdd(out_4_bits_dezena_duzias),.cdfd(codificacao_4bits_d_garrafas));
	modulo_codificador_unidade_garrafas codificador_garrafas_2(.cdd(out_4_bits_dezena_duzias),.cdfu(codificacao_4bits_u_garrafas));
	modulo_codificador_dezena_rolhas codificador_rolhas_1(.reg_r(buffer_secundario),.reg_rd(codificacao_4bits_d_rolhas));
	modulo_codificador_unidade_rolhas codificador_rolhas_2(.reg_r(buffer_secundario),.reg_ru(codificacao_4bits_u_rolhas));
	
	modulo_mux4_1 mux_1(.A(codificacao_4bits_d_garrafas[3]),.B(codificacao_4bits_u_garrafas[3]),.C(codificacao_4bits_d_rolhas[3]),.D(codificacao_4bits_u_rolhas[3]),.input_sel(sel_mux_display),.out(display_in[3]));
	modulo_mux4_1 mux_2(.A(codificacao_4bits_d_garrafas[2]),.B(codificacao_4bits_u_garrafas[2]),.C(codificacao_4bits_d_rolhas[2]),.D(codificacao_4bits_u_rolhas[2]),.input_sel(sel_mux_display),.out(display_in[2]));
	modulo_mux4_1 mux_3(.A(codificacao_4bits_d_garrafas[1]),.B(codificacao_4bits_u_garrafas[1]),.C(codificacao_4bits_d_rolhas[1]),.D(codificacao_4bits_u_rolhas[1]),.input_sel(sel_mux_display),.out(display_in[1]));
	modulo_mux4_1 mux_4(.A(codificacao_4bits_d_garrafas[0]),.B(codificacao_4bits_u_garrafas[0]),.C(codificacao_4bits_d_rolhas[0]),.D(codificacao_4bits_u_rolhas[0]),.input_sel(sel_mux_display),.out(display_in[0]));
	
	modulo_demux1_4 demux_1(.A(1'b1),.input_sel(sel_mux_display),.out(ac_7segmentos));

	modulo_decodificadorBCD_7Segmentos bcd_1(.ABCD(display_in),.ABCDEFGDP(out_7seg));
	
	
endmodule 