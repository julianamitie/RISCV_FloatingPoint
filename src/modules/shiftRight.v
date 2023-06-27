/* shifta num em shiftRightQtt casas */
module shiftRight(
    input [7:0] shiftRightQtt, // quantidade a ser shiftada
    input [22:0] num, // numero
    output reg [26:0] result // resultado com 26 bits
);

    wire [26:0] aux_result; 
    assign aux_result = {1'b1, num, 3'b000}; // auxiliar de 26 bits, + 3 bits de armazenamento
    
    // shiftando o número num em shiftRightQtt casas
    always @(*) begin
         result = aux_result >> shiftRightQtt;
    end
    
endmodule