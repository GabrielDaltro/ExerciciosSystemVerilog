/********************************************************************
*Autor: Gabriel Daltro Duarte
*
*
*
*
*
********************************************************************/

module debounce (data, clock, output_data);

	input logic data;
	input logic clock;
	output logic output_data;

	logic reg1, reg2, reg3;
	
	initial 
		begin
			reg1 <= 'b0;
			reg2 <= 'b0;
			reg3 <= 'b0;
		end

	always_ff @(posedge clock )
	 begin
		reg1 <= data;
		reg2 <= reg1;
		reg3 <= reg2;
	 end
	 
	 // Para chaves que são 0 quando pressionadas
	 assign output_data = (~reg1) & (~reg2) & (~reg3);
	 
	 // Para chaves que são 1 quando pressionadas
	 //assign output_data = reg1 & reg2 & reg3;


endmodule 