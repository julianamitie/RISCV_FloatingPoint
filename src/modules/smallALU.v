/* calcula a diferença entre os dois expoentes */
module smallAlu(
    input [3:0] exp1, // expoente de A
    input [3:0] exp2, // expoente de B
    output [3:0] exp // diferença 
    );

    assign exp = exp1 - exp2;

endmodule
