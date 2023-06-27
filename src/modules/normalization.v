module normalization(
    input shift_src, // 0 : left  1: right
    input [7:0] exp,
    input [26:0] fraction,
    output reg [7:0] expNorm,
    output reg [26:0] fractionNorm
);
    
    // ShiftLeft enquanto o bit mais significativo da fração não for 1
    always @ (*) begin
        if (shift_src == 0) begin
            fractionNorm = fraction << 1;
            expNorm = exp - 1;
        end

        else begin 
            fractionNorm = fraction >> 1; 
            expNorm = exp + 1; 
        end
    end 
    
endmodule