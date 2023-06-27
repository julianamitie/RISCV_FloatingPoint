module normalization(
    input shift,
    input shift_src, // 0 : left  1: right
    input [7:0] exp,
    input [26:0] fraction,
    output  [7:0] expNorm,
    output  [26:0] fractionNorm
);
    wire [7:0] aux_expNorm;
    wire [26:0] aux_fractionNorm;

    assign aux_fractionNorm = shift_src ? fraction >> 1 : fraction << 1;
    assign aux_expNorm = shift_src ? exp + 1 : exp - 1;

    assign fractionNorm = shift ? aux_fractionNorm : fraction;
    assign expNorm = shift? aux_expNorm : exp;




endmodule