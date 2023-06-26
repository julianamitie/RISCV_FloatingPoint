`timescale 1ps/1ps

/* teste do módulo floatingOperation */
module floatingOperation_test #(parameter N = 64) ();
    initial begin

        $display("Teste do módulo floatingOperation");
        #1;
        
        // // 121: 1111001
        // // 1.01000111101011100001010 * 2^-6
        // numA = 32'b0_01111001_01000111101011100001010 ;

        // // 118: 1110110
        // // 1.100010010011011101001011110001101010011111101111101 * 2^-9
        // numB = 32'b0_01110110_10001001001101110100101 ;

        // smallerExpSrc = 1;
        // shiftRightQtt = expDiff;
        // operation = 0;
        // normalization_src = 0;
        // if(carry == 1'b1) begin
        //     shift_src = 1;
        // end
        // else
        //     shift_src = 0;

        // $display("numA = %b, numB = %b, expDiff = %b, result = %b, carry = %b", numA, numB, expDiff, result, carry);

        // // 121: 1111001
        // // 1.01000111101011100001010 * 2^-6
        // numA = 32'b0_01111001_01000111101011100001010 ;

        // // 118: 1110110
        // // 1.100010010011011101001011110001101010011111101111101 * 2^-9
        // numB = 32'b0_01110110_10001001001101110100101 ;

        // smallerExpSrc = 1;
        // shiftRightQtt = expDiff;
        // operation = 0;
        // normalization_src = 0;
        // if(carry == 1'b1) begin
        //     shift_src = 1;
        // end
        // else
        //     shift_src = 0;

        // $display("numA = %b, numB = %b, expDiff = %b, result = %b, carry = %b", numA, numB, expDiff, result, carry);

        // // 121: 1111001
        // // 1.01000111101011100001010 * 2^-6
        // numA = 32'b0_01111001_01000111101011100001010 ;

        // // 118: 1110110
        // // 1.100010010011011101001011110001101010011111101111101 * 2^-9
        // numB = 32'b0_01110110_10001001001101110100101 ;

        // smallerExpSrc = 1;
        // shiftRightQtt = expDiff;
        // operation = 0;
        // normalization_src = 0;
        // if(carry == 1'b1) begin
        //     shift_src = 1;
        // end
        // else
        //     shift_src = 0;

        // $display("numA = %b, numB = %b, expDiff = %b, result = %b, carry = %b", numA, numB, expDiff, result, carry);

        // #100;
    end
    reg [31:0] numA;
    reg [31:0] numB; // números A e B 
    reg smallerExpSrc;
    reg [7:0] shiftRightQtt; // quantidade de casas a serem shiftadas p/ direita 
    reg [1:0] operation; // 00: add, 01: sub, 10: mult
    reg normalization_src; // 0: Alu 1: Roundresult
    reg shift_src; // 0 : left  1: right
    wire [7:0] expDiff; 
    wire [31:0] result; 
    wire carry;
        
    /* instanciação da unit under test */
    // floatingOperation_test uut(
    //     .numA(numA),
    //     .numB(numB), 
    //     .smallerExpSrc(smallerExpSrc),
    //     .shiftRightQtt(shiftRightQtt), 
    //     .operation(operation),
    //     .normalization_src(normalization_src), 
    //     .shift_src(shift_src),
    //     .expDiff(expDiff), 
    //     .result(result), 
    //     .carry(carry)
    // );

    /* início do testbench */
endmodule