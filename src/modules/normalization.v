module normalization(
    input shift,
    input shift_src, // 0 : left  1: right
    input [7:0] exp,
    input [26:0] fraction,
    output reg [7:0] expNorm,
    output reg [26:0] fractionNorm
);
// always @(*) begin

//         // $display("\n exp %d", exp);
//         // $display("\n fraction %b", fraction);
//         // $display("\n shift %d", shift);
//         // $display("\n shiftttt %d", shift_src);
//     end
    wire [7:0] aux_expNorm;
    wire [26:0] aux_fractionNorm;

    assign aux_fractionNorm = shift_src ? fraction >> 1 : fraction << 1;
    assign aux_expNorm = shift_src ? exp + 1 : exp - 1;

    reg count;

    initial begin
        count = 0;
    end
    always @(shift) begin
        count = ~count;
     fractionNorm <= (shift && ~count) ? aux_fractionNorm : fraction;
     expNorm <= (shift && ~count) ? aux_expNorm : exp;

    end

    


endmodule