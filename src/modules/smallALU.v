/* Gets the module of the difference between the
two exponents */

module smallAlu(
    input [3:0] exp1,
    input [3:0] exp2,
    output [3:0] exp
    );

    assign exp = exp1 - exp2;
    
endmodule
