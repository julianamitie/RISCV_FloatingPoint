`timescale 1ps/1ps

/* teste do módulo shiftRight */
module normalization_test #(parameter N = 64) ();
    reg shift;
    reg [26:0] fraction;
    reg shift_src;
    reg [7:0]  exp;
    wire [26:0] fractionNorm;
    wire [7:0]  expNorm;

    /* instanciação da unit under test */
    normalization uut(
        .shift(shift),
        .shift_src(shift_src),
        .fraction(fraction),
        .exp(exp),
        .fractionNorm(fractionNorm),
        .expNorm(expNorm)
    );

    /* início do testbench */
    initial begin
        
        /* inicialização dos sinais */
        fraction = 27'b001_0000_0000_0000_0000_00000000;
        exp = 8'b1100_0000;
        shift_src = 0;
        shift = 1;
        
        $monitor("fraction = %b, exp = %b, fractionNorm = %b, expNorm = %b", fraction, exp, fractionNorm, expNorm);

        #100;

        fraction = 27'b001_0000_0000_0000_0000_00000000;
        exp = 8'b1100_0000;
        shift_src = 1;
        shift = 1;
        
        $monitor("fraction = %b, exp = %b, fractionNorm = %b, expNorm = %b", fraction, exp, fractionNorm, expNorm);

        #100;

    end
endmodule