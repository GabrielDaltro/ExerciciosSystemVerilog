module pwm (
input logic clk,
input logic [6:0] tau,
output logic pwmout
);

logic [6:0] cont;
logic [6:0] tauguardado;

always_ff @(posedge clk)
begin
  if (cont == 7'd99) begin
      cont <= 7'd0;
	   tauguardado <= tau;
	 end
  else 
    cont <= cont + 1'd1;
	 
  if (cont < tauguardado)
    pwmout <= 1;
  else pwmout <= 0;
end

endmodule
