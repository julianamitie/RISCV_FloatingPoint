module rounding(
    input round,
    input [26:0] fraction, 
    input [7:0] exp, 
    output [26:0] fractionRounded, 
    output [7:0] expRounded
);
// always @(posedge round) begin
//     case(fraction[2:0])

//     endcase
// end
assign fractionRounded = fraction;
assign expRounded = exp;




endmodule