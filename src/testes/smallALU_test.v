`timescale 1ps/1ps

/* teste do módulo [...] */
module smallALU_test #(parameter N = 64) ();
    reg [7:0] exp1;       /* inputs */
    reg [7:0] exp2;
    wire [7:0] exp;     /* outputs */

    /* instanciação da unit under test */
    smallAlu uut(
        .exp1(exp1),
        .exp2(exp2),
        .exp(exp)
    );

    /* início do testbench */
    initial begin
        exp1 = 8'b00000010;
        exp2 = 8'b00000001;

        $monitor("exp1 = %B\n exp2 = %B\n exp = %B\n", exp1, exp2, exp);
        #100;

        exp1 = 8'b00000010;
        exp2 = 8'b00000010;

        $monitor("exp1 = %B\n exp2 = %B\n exp = %B\n", exp1, exp2, exp);
        #100;

        exp1 = 8'b00000001;
        exp2 = 8'b00000010;

        $monitor("exp1 = %B\n exp2 = %B\n exp = %B\n", exp1, exp2, exp);
        #100;

        exp1 = 8'b00000000;
        exp2 = 8'b00000010;

        $monitor("exp1 = %B\n exp2 = %B\n exp = %B\n", exp1, exp2, exp);
        #100;
    end
endmodule