module rounding(
    input [26:0] fraction, 
    input [7:0] exp, 
    output reg [26:0] fractionRounded, 
    output reg [7:0] expRounded
);
always @(fraction) begin
    $display("fraction = %b", fraction);
    $display("exp = %b", exp);
     fractionRounded = fraction;
     expRounded = exp;
end

endmodule