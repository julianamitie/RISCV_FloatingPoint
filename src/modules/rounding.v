module rounding(
    input [26:0] fraction, 
    input [7:0] exp, 
    output [26:0] fractionRounded, 
    output [7:0] expRounded
);
assign fractionRounded = fraction;
assign expRounded = exp;


endmodule