module normalization(
    input shift_src, // 0 : left  1: right
    input [7:0] exp,
    input [26:0] fraction,
    output  [7:0] expNorm,
    output  [26:0] fractionNorm
);
    
    // ShiftLeft enquanto o bit mais significativo da fração não for 1
    assign fractionNorm = shift_src ? fraction >> 1 : fraction << 1;
    assign expNorm = shift_src ? exp + 1 : exp - 1;

endmodule