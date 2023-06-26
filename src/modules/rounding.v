module rounding(
    input [25:0] fraction, 
    input [7:0] exp, 
    output  [22:0] fractionRounded, 
    output  [7:0] expRounded
);

    assign fractionRoounded = fraction[25:3];
    assign expRounded = exp;

    

endmodule