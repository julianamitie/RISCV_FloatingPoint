/* operações aritméticas ADD, SUB, MUL */
module bigALU(
    input alu, // habilita a ALU
    input [26:0] input_a, // número A
    input sign_a, // sinal do número A
    input [26:0] input_b, // número B
    input sign_b, // sinal do número B
    input [1:0] operation, // operação a ser realizada 
    output [26:0] result, // resultado 
    // output sign_result,
    output carry,
    output reg sign_result
);

    localparam ADD = 2'b00; // adição
    localparam MUL = 2'b10; // multiplicação

    reg [27:0] aux;
    assign a_greater_b = (input_a > input_b) ? 1'b1 : 1'b0;
    
    always @ (posedge alu) begin 
        case(operation)
            ADD: case ({sign_a, sign_b, a_greater_b})
                3'b000: begin 
                    aux <= input_a + input_b;
                    sign_result = 0; 
                end 
                3'b001: begin 
                    aux <= input_a + input_b;
                    sign_result = 0; 
                end 
                3'b011: begin 
                    aux <= input_a - input_b;
                    sign_result = 0;
                end 
                3'b010: begin 
                    aux <= ~(input_a - input_b) + 1'b1;
                    sign_result = 1; 
                end 
                3'b100: begin 
                    aux <= input_b - input_a;
                    sign_result = 0; 
                end 
                3'b101: begin 
                    aux <= ~(input_b - input_a) + 1'b1;
                    sign_result = 1; 
                end 
                3'b111: begin 
                    aux <= input_a + input_b;
                    sign_result = 1; 
                end
                3'b110: begin 
                    aux <= input_a + input_b;
                    sign_result = 1; 
                end 
            endcase
            default: aux <= input_a + input_b;
        endcase
    end

    assign carry = (sign_a ^ sign_b) ? 1'b0: aux[27];
    assign result = aux[26:0];
   // assign sign_result = aux[]

endmodule

/*
23x23 = 47
soma0 num_b[0] ? num_a : 0;
soma1 num_b[1] ? num_a << 1 : 0;
soma2 num_b[2] ? num_a << 2 : 0;
*/