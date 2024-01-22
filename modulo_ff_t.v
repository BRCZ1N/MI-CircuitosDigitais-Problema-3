// Finalizado
module modulo_ff_t(
    input t, 
    input clock,  
    input preset, 
    input clear, 
    output reg q,
    output reg q_bar
);

always @(negedge clock or posedge clear or posedge preset) 
begin 
    if (clear == 1'b1)
    begin
        q <= 1'b0;
        q_bar <= 1'b1;
    end
    else if (preset == 1'b1)
    begin
        q <= 1'b1;
        q_bar <= 1'b0;
    end
    else if (t)
    begin
        q <= !q;
        q_bar <= !q;
    end
end

endmodule
