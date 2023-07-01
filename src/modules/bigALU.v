/* operações aritméticas ADD, SUB, MUL */
module bigALU(
    input alu, // habilita a ALU
    input [26:0] input_a, // número A
    input sign_a, // sinal do número A
    input [26:0] input_b, // número B
    input sign_b, // sinal do número B
    input [1:0] operation, // operação a ser realizada 
    output [46:0] result, // resultado 
    // output sign_result,
    output carry,
    output reg sign_result
);

    localparam ADD = 2'b00; // adição
    localparam MUL = 2'b10; // multiplicação

    // wires das parcelas que serao somadas 
    // para o case da multiplicacao 
    wire soma0;
    wire soma1;
    wire soma2;
    wire soma3;
    wire soma4;
    wire soma5;
    wire soma6;
    wire soma7;
    wire soma8;
    wire soma9;
    wire soma10;
    wire soma11;
    wire soma12;
    wire soma13; 
    wire soma14;
    wire soma15;
    wire soma16;
    wire soma17;
    wire soma18;
    wire soma19;
    wire soma20;
    wire soma21;
    wire soma22; 

    assign soma0 = num_b[0] ? num_a : 0;
    assign soma1 = num_b[1] ? num_a << 1 : 0;
    assign soma2 = num_b[2] ? num_a << 2 : 0;
    assign soma3 = num_b[3] ? num_a << 3 : 0;
    assign soma4 = num_b[4] ? num_a << 4 : 0;
    assign soma5 = num_b[5] ? num_a << 5 : 0;
    assign soma6 = num_b[6] ? num_a << 6 : 0;
    assign soma7 = num_b[7] ? num_a << 7 : 0;
    assign soma8 = num_b[8] ? num_a << 8 : 0;
    assign soma9 = num_b[9] ? num_a << 9 : 0;
    assign soma10 = num_b[10] ? num_a << 10 : 0;
    assign soma11 = num_b[11] ? num_a << 11 : 0;
    assign soma12 = num_b[12] ? num_a << 12 : 0;
    assign soma13 = num_b[13] ? num_a << 13 : 0;
    assign soma14 = num_b[14] ? num_a << 14 : 0;
    assign soma15 = num_b[15] ? num_a << 15 : 0;
    assign soma16 = num_b[16] ? num_a << 16 : 0;
    assign soma17 = num_b[17] ? num_a << 17 : 0;
    assign soma18 = num_b[18] ? num_a << 18 : 0;
    assign soma19 = num_b[19] ? num_a << 19 : 0;
    assign soma20 = num_b[20] ? num_a << 20 : 0;
    assign soma21 = num_b[21] ? num_a << 21 : 0;
    assign soma22 = num_b[22] ? num_a << 22 : 0;
    
    reg [27:0] aux_soma;
    reg [46:0] aux_mult;
    reg [46:0] aux_result; 
    assign a_greater_b = (input_a > input_b) ? 1'b1 : 1'b0;
    
    always @ (posedge alu) begin 
        case(operation)
            ADD: case ({sign_a, sign_b, a_greater_b})
                3'b000: begin 
                    aux_soma <= input_a + input_b;
                    sign_result = 0; 
                end 
                3'b001: begin 
                    aux_soma <= input_a + input_b;
                    sign_result = 0; 
                end 
                3'b011: begin 
                    aux_soma <= input_a - input_b;
                    sign_result = 0;
                end 
                3'b010: begin 
                    aux_soma <= ~(input_a - input_b) + 1'b1;
                    sign_result = 1; 
                end 
                3'b100: begin 
                    aux_soma <= input_b - input_a;
                    sign_result = 0; 
                end 
                3'b101: begin 
                    aux_soma <= ~(input_b - input_a) + 1'b1;
                    sign_result = 1; 
                end 
                3'b111: begin 
                    aux_soma <= input_a + input_b;
                    sign_result = 1; 
                end
                3'b110: begin 
                    aux_soma <= input_a + input_b;
                    sign_result = 1; 
                end
               
                aux_result <= {19'b0000000000000000000, aux_soma}; 
            endcase
            MUL: begin 
                aux_mult <= soma0 + soma1 + soma2 + soma3 + soma4 + soma5 + soma6 + soma7 + soma8 + soma9 + soma10 + soma11 + soma12 + soma13 + soma14 + soma15 + soma16 + soma17 + soma18 + soma19 + soma20 + soma21 + soma22; 
                sign_result <= sign_a ^ sign_b; 
                aux_result <= aux_mult; 
            end 

            default: begin
                aux_soma <= input_a + input_b;
                aux_result <= aux_soma
            end
        endcase
    end

    assign carry = (sign_a ^ sign_b) ? 1'b0: aux_soma[27];
    assign result = aux_result;
   // assign sign_result = aux_soma[]

endmodule

/*
23x23 = 47
soma0 num_b[0] ? num_a : 0;
soma1 num_b[1] ? num_a << 1 : 0;
soma2 num_b[2] ? num_a << 2 : 0;
*/