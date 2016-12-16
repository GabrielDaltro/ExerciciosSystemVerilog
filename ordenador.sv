module ordenador (vet_out,tam,ordenar);


	logic [3:0] vet_in [5:0]; 
	logic tam [2:0];
	input logic ordenar;

	logic [3:0] vet_out [5:0];
	
	logic flag_trocou;
	logic [3:0] trouca_aux;


	always_ff @(negedge ordenar)
	 begin
	 
		for (int i = 'd0; i < tam; i++ )
		  begin	
			vet_out[i] = vet_in[i]; 
		  end
		 
		do
		 begin
				flag_trocou = 'b0;
				for (int i = 'b0; i < tam; i++ )
				begin
						if ( vet_out[i] > vet_out[i + 1] )
						 begin
							trouca_aux = vet_out[i];
							vet_out[i] =  vet_out [i+1];
							vet_out[i+1] = trouca_aux;
							flag_trocou = 'b1;
						 end
				end
		 end
		while (flag_trocou == 1'b1);
		
	 end
	 
endmodule 