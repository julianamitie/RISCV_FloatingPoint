/* descrição */
module ucFloat (
    input clk, rst_n,
    input start,
    input [7:0] expDiff, 
    input carry,
    input [26:0] fracResult,
    output reg [7:0] shiftRightQtt,
    output reg smallerExpSrc, 
    output reg normalization_src,
    output reg shift_src,
    output reg done
);

    // Parametros de estado
    localparam [2:0] state0 =3'b000, // Iniciando
                    state1 = 3'b001, // Ver a diferença de expoentes e enviar o smallerExpSrc e o  shiftRightQtt
                    state2 = 3'b010, // Somar as frações
                    state3 = 3'b011, // Analisar o resultado da soma (carry) e enviar o normalization_src e o shift_src
                    state4 = 3'b100, // Arredondamento
                    state5 = 3'b101; // Fim: Exibir o resultado (done <= 1)

    reg [2:0] state, next_state;

    always @(posedge clk, negedge rst_n) begin
        $display("state: %d \n", state);
        if (!rst_n) begin
            state <= state0;
        end
        else begin
            state <= next_state;
        end
    end

    always @(state) begin
        case (state) 
            state0: begin
                $display("state 0 \n");
                $display("start: %d \n", start);
                done = 0;
                if(start == 1) next_state = state1; 
                else next_state = state0;
            end 
            
            state1: begin
                $display("state 1 \n");
                if(expDiff[7] == 1) begin
                    smallerExpSrc = 0;
                    shiftRightQtt = ~expDiff[6:0] + 1;
                end
                else begin
                    smallerExpSrc = 1;
                    shiftRightQtt = expDiff[6:0]; 
                end
                next_state = state2;
            end 
            
            state2: begin
                $display("state 2 \n");
                // Somar as frações
                normalization_src = 1; // normaliza ALU
                next_state = state3;
            end 

            state3:begin
                $display("state 3 \n");
                $display("carry: %d \n", carry);
                $display("fracResult: %B \n", fracResult);
                if(carry) begin
                    shift_src = 1;
                    next_state = state3;
                    $display("Carry");
                end
                else begin
                    if(fracResult[26] == 0) begin
                        shift_src = 0;
                        next_state = state3;
                        $display("Não normalizado");
                    end
                    else begin
                        // Se o resultado da alu estiver normalizado
                        // Normalizar o resultado do round
                        if(normalization_src == 1) begin
                            normalization_src = 0;
                            next_state = state4;
                            $display("normalizado src1");
                            $display("next_state: %b \n", next_state);

                        end
                        else begin
                            normalization_src = 1;
                            next_state = state5;
                            $display("normalizado src0");
                        end
                    end
                end 
            end 

            state4: begin
                $display("state 4 \n");
                
                // Arredondamento
                next_state = state3;
            end 

            state5: begin
                $display("state 5 \n");
                done = 1;
                if(start == 1) next_state = state5; 
                else next_state = state0; 
                
            end 
            
            default: begin
                $display("default \n");
                next_state = state0;
            end

        endcase 
       
    end
endmodule