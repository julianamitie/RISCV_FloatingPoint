module rounding(
    input round,
    input [26:0] fraction, 
    input [7:0] exp, 
    output [26:0] fractionRounded, 
    output [7:0] expRounded
);
// Round ties to even
wire less;
wire equal;
wire greater;

assign less = fraction[2:0] < 3'b100;
assign equal = fraction[2:0] == 3'b100;
assign greater = fraction[2:0] > 3'b100;

// always @( round) begin
//     if(less) begin
//         fractionRounded <= fraction;
//         expRounded <= exp;
//     end
//     else if(equal) begin
//         if(fraction[3] == 1'b1) begin
//             fractionRounded <= fraction + 1;
//             expRounded <= exp;
//         end
//         else begin
//             fractionRounded <= fraction;
//             expRounded <= exp;
//         end
//     end
//     else if(greater) begin
//         fractionRounded <= fraction + 1;
//         expRounded <= exp;
//     end
// end
assign fractionRounded = fraction;
assign expRounded = exp;




endmodule