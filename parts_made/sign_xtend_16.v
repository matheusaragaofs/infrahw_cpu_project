module sign_xtend_16(
    input wire [15:0] DATA_IN,
    output wire [31:0] DATA_OUT
);
    
    // Realiza a extensão de sinal de um valor de 16 bits para 32 bits.

    // Se o bit mais significativo (bit 15) de DATA_IN for 1 (número negativo em complemento de dois),
    // os 16 bits mais altos de DATA_OUT serão preenchidos com 1's (extensão de sinal negativa).

    // Caso contrário, os 16 bits mais altos serão preenchidos com 0's (extensão de sinal positiva).
    assign DATA_OUT = (DATA_IN[15]) ? { {16{1'b1}} , DATA_IN} : { {16{1'b0}} , DATA_IN};

,
endmodule