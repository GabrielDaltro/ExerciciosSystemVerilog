module binary_to_disp7 (number_in, disp_unidade, disp_dezena, disp_centena);

input logic [9:0] number_in; // entrada do bloco 
output logic [7:0] disp_unidade;
output logic [7:0] disp_dezena;
output logic [7:0] disp_centena;

logic [3:0] unidade;
logic [3:0] dezena;
logic [3:0] centena;

always @(number_in)
begin
	unidade = number_in % 10;
	dezena = (number_in % 100) / 10;
	centena = (number_in) / 100;
	
	case(unidade)
		0:
			disp_unidade = 8'b11000000;
		1:
			disp_unidade = 8'b11111001;
		2:
			disp_unidade = 8'b10100100;
		3:
			disp_unidade = 8'b10110000;
		4:
			disp_unidade = 8'b10011001;
		5:
			disp_unidade = 8'b10010010;
		6:
			disp_unidade = 8'b10000010;
		7:
			disp_unidade = 8'b11011000;
		8:
			disp_unidade = 8'b10000000;
		9:
			disp_unidade = 8'b10010000;
	endcase

	case(dezena)
		0:
			disp_dezena = 8'b11000000;
		1:
			disp_dezena = 8'b11111001;
		2:
			disp_dezena = 8'b10100100;
		3:
			disp_dezena = 8'b10110000;
		4:
			disp_dezena = 8'b10011001;
		5:
			disp_dezena = 8'b10010010;
		6:
			disp_dezena = 8'b10000010;
		7:
			disp_dezena = 8'b11011000;
		8:
			disp_dezena = 8'b10000000;
		9:
			disp_dezena = 8'b10010000;
	endcase

	case(centena)
		0:
			disp_centena = 8'b11000000;
		1:
			disp_centena = 8'b11111001;
		2:
			disp_centena = 8'b10100100;
		3:
			disp_centena = 8'b10110000;
		4:
			disp_centena = 8'b10011001;
		5:
			disp_centena = 8'b10010010;
		6:
			disp_centena = 8'b10000010;
		7:
			disp_centena = 8'b11011000;
		8:
			disp_centena = 8'b10000000;
		9:
			disp_centena = 8'b10010000;
	endcase
	
end

endmodule 