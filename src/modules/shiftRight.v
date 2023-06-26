/* shifta num em shiftRightQtt casas */
module shiftRight(
    input [7:0] shiftRightQtt, // quantidade a ser shiftada
    input [22:0] num, // numero
    output reg [25:0] result // resultado com 26 bits
);

    wire [25:0] aux_result; 
    assign aux_result = {num, 3'b000}; // auxiliar de 26 bits, + 3 bits de armazenamento
    
    // shiftando o número num em shiftRightQtt casas
    always @(*) begin
         result = aux_result >> shiftRightQtt;
    end
    
endmodule