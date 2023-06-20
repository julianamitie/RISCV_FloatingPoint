/* descrição */
module floatingOperation #(
    parameter FRACTION = 23,
    parameter EXPONENT = 8,
) (
    input numA [31:0], numB [31:0],
    output wire out  
);
    /*
    Model:
    sign  | exponent   |    fraction
    1bit  |   8bits    |     23bits
    */

    wire expA [7:0], expB [7:0];
    wire fracA [22:0], fracB [22:0];
    wire signA, signB;

    assign signA = numA[31];
    assign signB = numB[31];
    

    localparam bias = 127;


endmodule