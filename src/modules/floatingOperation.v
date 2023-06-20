/* descrição */
module floatingOperation #(
    parameter FRACTION = 23,
    parameter EXPONENT = 8,
) ( 
    input [31:0] numA, [31:0] numB, // números A e B 
    input smallerExpSrc,
    input [7:0] shiftRightQtt, // quantidade de casas a serem shiftadas p/ direita 
    input [1:0] operation, // 00: add, 01: sub, 10: mult
    input normalization_src,
    output wire [7:0] expDiff, 
    output wire [31:0] result
    
);
    /*
    modelo:
    sign  | exponent | fraction
    1bit  |  8bits   |  23bits
    */
    localparam bias = 127; // expoente referencial
    /*
    2^1 = 128
    2^0 = 127
    2^-1 = 126
    */

    wire [7:0] expA , [7:0] expB ; // expoente das entradas
    wire [22:0] fracA , [22:0] fracB ; // fração das entradas 
    wire signA, signB; // sinais das entradas

    assign signA = numA[31]; // sinal de A
    assign signB = numB[31]; // sinal de B

    assign expA = numA[30:23]; // expoente de A
    assign expB = numB[30:23]; // expoente de B

    assign fracA = numA[22:0]; // fração A
    assign fracB = numB[22:0]; // fração B

    // small ALU
    smallAlu expDiff(
        .numA(expA),
        .numB(expB),
        .out(expDiff)
    );

    // Control Unit recebe o expDiff
    // Se for positivo, expA > expB  : smallerExpSrc = 0
    // Se for negativo, expA < expB  : smallerExpSrc = 1
    // Se for 0, expA = exp          : smallerExpSrc = 0

    // shiftRightQtt será a diferença em módulo
    
    // Smaller exponent multiplexer
    // 0 : expA  1: expB
    wire [7:0] smallerExp;
    assign smallerExp = smallerExpSrc ? expB : expA;

    // Shift Fraction with smaller exponent
    // Multiplexer
    wire [22:0] fracToShift;
    wire [22:0] fracShifted;
    assign fracToShift = smallerExpSrc ? fracA : fracB;
    
    // Shifting
    shiftRight shift(
        .num(fracToShift),
        .shiftRightQtt(shiftRightQtt),
        .result(fracShifted)
    );

    // Muliplexer big alu num2
    wire [31:0] num2;
    assign num2 = smallerExpSrc ? fracB : fracA;

    wire [22:0] bigAluResult;

    // Big alu
    bigAlu bigAlu(
        .input_a(fracShifted),
        .input_b(num2),
        .operation(operation),
        .result(bigAluResult)
    );


    //Normalization multiplexer
    // 0 : original  1: rounded
    wire [22:0] fractToNorm;
    assign fractToNorm = normalization_src ? fractionRounded : bigAluResult;

    wire [7:0] expToNorm;
    assign expToNorm = normalization_src ? expRounded : smallerExp;


    // Normalization
    wire [22:0] fractionNorm;
    wire [7:0] expNorm;


    normalization normalization(
        .fraction(fractToNorm),
        .exp(expToNorm),
        .fractionNorm(fractionNorm),
        .expNorm(expNorm)
    );


    // Rouding
    wire [22:0] fractionRounded;
    wire [7:0] expRounded;

    rouding rounding(
        .fraction(fractionNorm),
        .exp(expNorm)
        .fractionRounded(fractionRounded),
        .expRounded(expRounded)
    );

    // Final result
    // Verificar qual o sinal
    assign result = {signA, expNorm, factionNorm};
    


endmodule