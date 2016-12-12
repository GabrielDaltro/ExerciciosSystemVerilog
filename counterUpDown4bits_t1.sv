/*********************************************************************
*
*IFPB
*Joao Pessoa, 02 de dezembro de 2016
*Aluno: Gabriel Daltro Duarte
*
*Disciplina System Verilog - Programa de Execelencia em Microeletronica
*
*
*Exercicio: Fazer sequenciador que gera a sequência 0 1 2 3 ... 13 14 15 15 14 13 12 ... 3 2 1 0 0 1 2 3 ...
*
**********************************************************************/


module counterUpDown4bits_t1 (clk,out,reset);

	input logic clk; // entrada de clock
	input logic reset; // pino de reset - ativo com zero
	output logic [3:0] out; // pino de saida - valor da contagem 
	
	logic direction; // 0 - crescente; 1 - decrescente;

	always_ff @(posedge clk) // Always sensivel a borda positiva do clock
	 begin
		if (reset == 1'b0) // Caso o botao de reset seja pressionado
		 begin
			out <= 'b0; // saida vai para o estado zero
			direction <= 'b0; // a direçao eh definida como crescente
		 end
		else // se reset nao pressionado
		 begin
			if (direction == 1'b0) // Caso direçao for crescente
			 begin
				if (out < 4'b1111) // E a saida ainda nao eh 15
					out <= out + 1; // incremente a saida em um unidade
				else // se ela alcançou o valor 15
					direction <= ~direction; // inverte a variavel direction
			 end
			else // Caso direçao seja decrescente
			 begin
				if (out > 4'b0) // E a saida ainda nao eh 0
					out <= out - 1; // a saida eh decrementada
				else // se ela alcançou o valor zero 
					direction <= ~direction; // a variavel direction eh invertida
			 end
				
		 end	 
	 end

endmodule

/* Nesse contador, a saida permanece dois pulso de clock em 15 e dois pulso de clock em 0. Isso se deve ao fato
de que apos alcançar 15 ou 0, o pulso de clock seguinte nao altera a saida, ele apenas muda o conteudo  de direction */
