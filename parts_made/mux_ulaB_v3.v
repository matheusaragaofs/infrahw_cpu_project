module ulasrcB(
    input wire [1:0] srcB_selector,
    
    input wire [31:0] B_output,             // Mapeado para 2'b00
    // imediato 4                       // Mapeado para 2'b01
    input wire [31:0] extend_16,            // Mapeado para 2'b10
    input wire [31:0] shift_left_2_output,  // Mapeado para 2'b11

    output wire [31:0] srcB_output 
);

    // Bloco always_comb garante que a lógica é combinacional (sem estado)
    // e que o bloco será reavaliado sempre que qualquer entrada mudar.
    always_comb begin
        // Inicializa a saída para um valor padrão (por exemplo, X para indefinido)
        // Isso ajuda a evitar latches acidentais em alguns casos,
        // embora para um mux completo não seja estritamente necessário.
        srcB_output = 32'bx; // Define como 'x' (indefinido) por padrão

        // O case statement seleciona a saída com base no valor de srcB_selector
        case (srcB_selector)
            2'b00: begin // Quando srcB_selector é "00"
                srcB_output = B_output;
            end
            2'b01: begin // Quando srcB_selector é "01"
                srcB_output = 32'd4; // Constante 4 (decimal)
            end
            2'b10: begin // Quando srcB_selector é "10"
                srcB_output = extend_16;
            end
            2'b11: begin // Quando srcB_selector é "11"
                srcB_output = shift_left_2_output;
            end
            default: begin // Caso srcB_selector tenha um valor "x" ou "z" (não esperado)
                srcB_output = 32'bx; // Atribui 'x' para indicar um estado não definido
            end
        endcase
    end

endmodule