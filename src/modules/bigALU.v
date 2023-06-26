/* operações aritméticas ADD, SUB, MUL */
module bigALU(
    input [25:0] input_a, // número A
    input sign_a, // sinal do número A
    input [25:0] input_b, // número B
    input sign_b, // sinal do número B
    input [1:0] operation, // operação a ser realizada 
    output [25:0] result, // resultado 
    output carry
);

    localparam ADD = 2'b00; // adição
    localparam SUB = 2'b01; // subtração
    localparam MUL = 2'b10; // multiplicação

    reg [26:0] aux;
    
    always @ (operation) begin 
        case(operation)
            ADD: aux <= input_a + input_b;
            SUB: aux <= input_a - input_b;
            MUL: aux <= input_a + input_b;
            default: aux <= input_a + input_b;
        endcase
    end

    assign carry = aux[26];
    assign result = aux[25:0];

endmodule