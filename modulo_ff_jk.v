//Finalizado
module modulo_ff_jk (
  input clk, rst, enable,
  input j, k,
  output reg q,
  output wire q_bar
);
  
  always @(negedge clk) begin
    if (enable) begin
      case ({j, k})
        2'b00: q <= q;    
        2'b01: q <= 1'b0;  
        2'b10: q <= 1'b1;  
        2'b11: q <= ~q;    
      endcase
    end
    else if (rst) 
      q <= 1'b0;
  end

  assign q_bar = ~q;

  
endmodule
