`timescale 1ps/1ps

/* teste do módulo bigALU */
module bigALU_test #(parameter N = 64) ();
    reg [26:0] input_a;
    reg sign_a;
    reg [26:0] input_b; 
    reg sign_b;
    reg [1:0] operation;
    wire [26:0] result;
    wire carry;

    /* instanciação da unit under test */
    bigALU uut(
        .input_a(input_a),
        .sign_a(sign_a),
        .input_b(input_b),
        .sign_b(sign_b),
        .operation(operation),
        .result(result),
        .carry(carry)
    );

    /* início do testbench */
    initial begin
        input_a = 27'd5;
        sign_a = 1'b0;
        input_b = 27'd11;
        sign_b = 1'b0;
        operation = 2'b00;
        $monitor("\ncarry = %B\n result = %B\n", carry, result);
        #100;

        input_a = 27'b111111111111111111111111111;
        sign_a = 1'b0;
        input_b = 27'b00000000000000000000000001;
        sign_b = 1'b0;
        operation = 2'b00;
        $monitor("\ncarry = %B\n result = %B\n", carry, result);
        #100;
        
    end
endmodule
