`timescale 1ps/1ps
// 0.02 + 0.3 = 0.32
// 0_01111101_1.00110011001100110100000


/* teste do módulo fpu */
module fpu_test #(parameter N = 64) ();
    
    reg clk; 
    reg rst_n;
    wire [31:0] A; 
    wire [31:0] B; 
    reg [1:0] op;
    reg start;
    wire [31:0] R;   
    wire done;    

        // assign A = {1'b0, 8'b01111110, 23'b0};
        // assign B = {1'b1, 8'b01111101, 2'b11, 21'b0};
        //  R = {1'b0, 8'b01111011, 23'b0}

        assign A = {1'b0, 8'b10000000, 3'b001, 20'b0};
        assign B = {1'b0, 8'b10000001, 3'b101, 20'b0};

        // R = {1'b0, 8'b10000010, 5'b00011, 18'b0}

    /* instanciação da unit under test */
    fpu uut(
        .clk(clk),
        .rst_n(rst_n),
        .A(A),
        .B(B),
        .R(R),
        .op(op),
        .start(start),
        .done(done)
    );

    /* início do testbench */
    initial begin
        clk = 0;
        rst_n = 0;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;
        
        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);

        #100;

                clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

                clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

                clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

                clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

                clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 0;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;

        clk = 1;
        rst_n = 1;
        
        //0.000001010001111011  0.02 || 121 1111001
        
        // 0.01001100110011001101  0.3  || 125 1111101
        op = 2'b00;
        start = 1;
        $monitor("R= sign: %B  exp: %B frac: %B\n", R[31], R[30:23], R[22:0]);
        #100;



    
    end
endmodule