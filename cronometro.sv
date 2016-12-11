module cronometro (clk, cent_seg, seg, pause, reset);

	input logic clk; // pino do clock de entrada (100 Hz)
	input logic pause; // pino de pause - pausa a contagem - acionado com nivel 1
	input logic reset; // pino de reset - reinicia a contagem - acionado com nivel zero
	output logic [6:0] cent_seg; // saida dos centesimos de segundo
	output logic [5:0] seg; // ssaida dos segundos

	always_ff @(posedge clk)
	 begin
		if (reset == 1'b0) // quando o pino de reset eh colocado em nivel 0
		 begin
			cent_seg <= 'b0; // a saida do cronometro vai para zero (centesimos de segundo e segundo)
			seg <= 'b0;
		 end
		else if (pause == 1'b0) // se o botao pause nao for acionado
		 begin
			if (cent_seg == 7'd99) // E se a contagem dos centesimos de segundo  chegou em 99
			 begin
					cent_seg <= 'b0; // a contagem dos centesimos de segundo volta para ao valor zero
					
					if (seg == 6'd59) // Se a contagem dos segundo chegou em  59, ela volta para zero
						seg <= 'b0;
					else	// Se ela ainda nao chegou em 59, ela incrementa uma unidade sempre que cent_seg for igual a 99
						seg <= seg + 1'b1;
			   end
			else //Se a contagem dos centesimos de segundo  ainda nao chegou em 99, cent_seg eh incrementado a cada pulso de clock
				cent_seg <= cent_seg + 1;					
		 end
	 end

endmodule
