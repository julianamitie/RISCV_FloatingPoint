`timescale 1ps/1ps

/* teste do módulo shiftRight */
module shiftRight_test #(parameter N = 64) ();
    reg [22:0] num;
    reg [7:0] shiftRightQtt;     
    wire [22:0] result;     

    /* instanciação da unit under test */
    shiftRight uut(
        .num(num),
        .shiftRightQtt(shiftRightQtt),
        .result(result)
    );

    /* início do testbench */
    initial begin
        
        /* inicialização dos sinais */
        num = 23'b111_0000_0000_0000_0000_0000;
        shiftRightQtt = 6;

        $monitor("num = %b, shiftRightQtt = %d, result = %b", num, shiftRightQtt, result);
        #100;

        num = 23'b000_0000_0000_0000_0000_1111;
        shiftRightQtt = 2;

        $monitor("num = %b, shiftRightQtt = %d, result = %b", num, shiftRightQtt, result);
        #100;
    end
endmodule