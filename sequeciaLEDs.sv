/*
IFPB
Joao Pessoa, 02 de dezembro de 2016
Aluno: Gabriel Daltro Duarte

 Disciplina System Verilog - Programa de Execelencia em Microeletronica

 Exercicio:
4) Fazer circuito que acenda os LEDs em sequência. Exemplo com 4 LEDs:

L0 L1 L2 L3

 *
      *
          *
               *
          *
      * 
 *
      *
(...)
*/
 module sequeciaLED (out, clk, reset, direction, state );

	output logic [3:0] out;
	input logic clk;
	input logic reset; // ativo quando zero
	output logic direction; // quando 0, deslocamento para esquerda, quando 1,  deslocamento para a direita 	
	output logic [1:0] state; // determina em qual estado o contador vai estar

	always_ff @( posedge clk )
	 begin
		if (reset == 1'b0) // No reset a saida volta ao valor 1, a direçao  eh  para direita eh o estado eh hzero
		 begin
			out <= 'b1;
			direction <= 'b0; 
			state <= 'b0;
		 end
		else 
		 begin		
		   if (state == 2'b10) // a varial state assume os valores entre 0 e 2. 
			 begin				  
				state <= 'b0; // Ao alcançar o valor 2, ela deve voltar a zero 
				direction <= ~direction; // a direç~ao deve inverter
			 end
			else
			 begin // se state ainda n~ao ´e 2, ela deve ser incrementada
				state <= state + 1'b1;
			 end	
			 
			if (direction == 1'b0) //os if's que testam state e direction sao executados em paralelo, por isso  o segundo if sempre testa o antigo valor de direction
										  //mesmo direction invertendo, a saida sera deslocada ainda 1 vez para o sentindo antigo  apos a mudança de direction 	. Por esse motivo state so vai ate 2 e nao ate 3
				out <= out << 1'b1;	 // para direction 0, deslocamento para  direita	
			else		
				out <= out >> 1'b1; // para directi10, deslocamento para  esquerda
					
		 end
	end	

endmodule
