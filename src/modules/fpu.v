/* descrição */
module fpu (
    input clk, rst_n, // clock, reset
    input [31:0] A, B, 
    output [31:0] R, 
    input [1:0] op, // operacao
    input start, 
    output done
);

wire smallerExpSrc, normalization_src, shift_src;
wire [7:0] shiftRightQtt;
wire [7:0] expDiff;
wire carry;
wire [26:0] fracResult;

floatingOperation flop(
    .numA(A),
    .numB(B),
    .smallerExpSrc(smallerExpSrc),
    .shiftRightQtt(shiftRightQtt),
    .operation(op),
    .normalization_src(normalization_src),
    .shift_src(shift_src),
    .expDiff(expDiff),
    .fracResult(fracResult),
    .result(R),
    .carry(carry)
    
);

ucFloat ucf(
    .clk(clk), 
    .rst_n(rst_n), 
    .start(start),
    .expDiff(expDiff),
    .carry(carry),
    .fracResult(fracResult), 
    .shiftRightQtt(shiftRightQtt),
    .smallerExpSrc(smallerExpSrc), 
    .normalization_src(normalization_src), 
    .shift_src(shift_src),
    .done(done)
); 


endmodule