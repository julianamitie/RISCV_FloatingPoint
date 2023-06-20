/* shifta num em shiftRightQtt casas */
module shiftRight(
    input [7:0] shiftRightQtt, // quantidade a ser shiftada
    input [22:0] num, // numero
    output reg [22:0] result // resultado
);
    
    // shiftando o número num em shiftRightQtt casas
    always @(*) begin
         result = num >> shiftRightQtt;
    end
    
endmodule