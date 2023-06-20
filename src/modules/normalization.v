module normalization(
    input [7:0] exp,
    input [22:0] fraction,
    output reg [7:0] expNorm,
    output reg [22:0] fractionNorm
);
    
    // ShiftLeft enquanto o bit mais significativo da fração não for 1
    always @(*) begin
        fractionNorm <= fraction;
        expNorm <= exp;
        
        for (integer i = 0; i < 23; i = i + 1) begin
            $display("oiiiiiiiiiiiii");
            $display("%b", fractionNorm);
            if (fractionNorm[22] == 0) begin
                $display("oi");
                fractionNorm <= fractionNorm << 1;
                expNorm <= expNorm - 1;
            end
            
        end
    end
    

endmodule