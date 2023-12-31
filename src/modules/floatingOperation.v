/* descrição */
module floatingOperation( 
    input [31:0] numA, // números A 
    input [31:0] numB, // números B 
    input smallerExpSrc, // 0: A for menor, 1: B for menor
    input [7:0] shiftRightQtt, // quantidade de casas a serem shiftadas p/ direita 
    input [1:0] operation, // 00: add, 01: sub, 10: mult
    input normalization_src, // 0: Alu, 1: Roundresult
    input shift_src, // 0: left, 1: right
    input shift,
    input alu,
    output [7:0] expDiff, 
    output [26:0] fracResult,
    output wire [31:0] result,
    output wire carry
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

    wire [7:0] expA;
    wire [7:0] expB; // expoente das entradas
    wire [22:0] fracA;
    wire [22:0] fracB; // fração das entradas 
    wire signA;
    wire signB; // sinais das entradas

    assign signA = numA[31]; // sinal de A
    assign signB = numB[31]; // sinal de B

    assign expA = numA[30:23]; // expoente de A
    assign expB = numB[30:23]; // expoente de B

    assign fracA = numA[22:0]; // fração A
    assign fracB = numB[22:0]; // fração B

    // small ALU
    smallAlu expDiffCalc(
        .exp1(expA),
        .exp2(expB),
        .exp(expDiff)
    );

    // Control Unit recebe o expDiff
    // Se for positivo, expA > expB  : smallerExpSrc = 1
    // Se for negativo, expA < expB  : smallerExpSrc = 0
    // Se for 0, expA = exp          : smallerExpSrc = 1

    // shiftRightQtt será a diferença em módulo
    
    // Smaller exponent multiplexer
    // 0 : expA  1: expB
    wire [7:0] smallerExp;
    wire [7:0] biggerExp;
    assign smallerExp = smallerExpSrc ? expB : expA;
    assign biggerExp = smallerExpSrc ? expA : expB;


    // Shift Fraction with smaller exponent
    // Multiplexer
    wire [22:0] fracToShift;
    wire [26:0] fracShifted;
    assign fracToShift = smallerExpSrc ? fracB : fracA;
    
    // Shifting
    shiftRight shiftRight(
        .num(fracToShift),
        .shiftRightQtt(shiftRightQtt),
        .result(fracShifted)
    );

    // Muliplexer big alu num2
    wire [22:0] num2;
    assign num2 = smallerExpSrc ? fracA : fracB;

    wire [26:0] bigAluResult;

    wire sign1, sign2;
    assign sign1 = smallerExpSrc ? signA : signB;
    assign sign2 = smallerExpSrc ? signB : signA;
    wire sign_result;
    // Big alu
    bigALU bigAlu(
        .alu(alu),
        .input_a(fracShifted),
        .sign_a(sign1),
        .input_b({1'b1, num2, 3'b000}),
        .sign_b(sign2),
        .operation(operation),
        .result(bigAluResult),
        .carry(carry),
        .sign_result(sign_result)
    );

    //Normalization multiplexer
    // 0 : original  1: rounded
    wire [26:0] fractToNorm;
    assign fractToNorm = normalization_src ? bigAluResult : fractionRounded;

    assign fracResult = fractToNorm;

    wire [7:0] expToNorm;
    
    assign expToNorm = normalization_src ? biggerExp : expRounded;

    // Normalization
    wire [26:0] fractionNorm;
    wire [7:0] expNorm;


    normalization normalization(
        .shift(shift),
        .shift_src(shift_src),
        .exp(expToNorm),
        .fraction(fractToNorm),
        .expNorm(expNorm),
        .fractionNorm(fractionNorm)
    );

    // Rouding
    wire [26:0] fractionRounded;
    wire [7:0] expRounded;

        always @(fractionNorm) begin
        $display("\n FractionNorm = %b", fractionNorm);
    end 

    rounding rounding (
        .fraction(fractionNorm),
        .exp(expNorm),
        .fractionRounded(fractionRounded),
        .expRounded(expRounded)
    );

    // Final result
    // Verificar qual o sinal -> colocar como output da alu
    assign result = {sign_result, expNorm, fractionNorm[25:3]};
    

endmodule