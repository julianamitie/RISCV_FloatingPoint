/* operações aritméticas ADD, SUB, MUL */
module bigALU(
    input [23:0] input_a, // número A
    input [23:0] input_b, // número B
    input [1:0] operation, // operação a ser realizada 
    output reg [23:0] result // resultado 
);

    localparam ADD = 2'b00; // adição
    localparam SUB = 2'b01; // subtração
    localparam MUL = 2'b10; // multiplicação
    
    always @ (operation) begin 
        case(operation)
            ADD: result <= input_a + input_b;
            SUB: result <= input_a - input_b;
            MUL: result <= input_a + input_b;
            default: result <= input_a + input_b;
        endcase
    end

endmodule