module ctrl_unit (
    input wire clk,
    input wire reset,

    // Flags
    input wire Of,
    input wire Ng,
    input wire Zr,
    input wire Eq,
    input wire Gt,
    input wire Lt,

    // Meaningful part of the instruction
    input wire [5:0] OPCODE,

    // Controllers with 1 bit
    output reg PC_w,
    output reg MEM_w,
    output reg IR_w,
    output reg RB_w,
    output reg AB_w,

    // Controllers with more than 1 bit
    output reg [2:0] ULA_C,

    // Controllers for muxes
    output reg M_WREG,
    output reg M_ULAA,
    output reg [1:0] M_ULAB,

    // Especial controller for reset instruction
    output reg rst_out
);




endmodule   