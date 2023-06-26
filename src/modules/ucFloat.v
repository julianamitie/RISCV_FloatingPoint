/* descrição */
module ucFloat #(
    /* lista de parâmetros */
) (
    input clk,rst,
    input start,
    input [7:0] expDiff, 
    input carry,
    output [7:0] shiftRightQtt,
    output smallerExpSrc, 
    output normalization_src,
    output shift_src,
    output done
);

    // Parametros de estado
    localparam [2:0] state0 =3'b000, // Iniciando
                    state1 = 3'b001, // Ver a diferença de expoentes e enviar o smallerExpSrc e o  shiftRightQtt
                    state2 = 3'b010, // Somar as frações
                    state3 = 3'b011, // Analisar o resultado da soma (carry) e enviar o normalization_src e o shift_src
                    state4 = 3'b100; // Analizar se precisa normalizar e voltar para o 3
                    state5 = 3'b101; // Rounding e ir pro estado 4 (ver se precisa normalizar)
                    state6 = 3'b110; // Fim: Exibir o resultado (done <= 1)

    reg [2:0] state, next_state;

    always @(posedge clk, negedge rst_n) begin
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
                if(start == 1) next_state = state1; 
                else next_state = state0;
            end 
            
            state1: begin
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
                next_state = state3;
            end 

            state3:begin
                next_state = state4;
            end 

            state4: begin
                next_state = state5;
            end 

            state5:begin
                next_state = state6;
            end  

            state6: begin
                if(start == 1)
                if(start == 1) next_state = state6; 
                else next_state = state0; 
            end 
            
            default: next_state = state0;

        endcase 
            
        
    end
endmodule