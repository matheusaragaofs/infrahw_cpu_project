module cpu_add(
    input wire clock,
    input wire reset,
)

    // Control wires (controle de escrita | controle de leitura) | control signals
    wire PC_w;
    wire MEM_w
    wire IR_w;
    wire M_WREG;
    wire RB_w;
    wire AB_w;

    //Data wires
    wire [31:0] PC_out;
    wire [31:0] ULA_out;
    wire [31:0] MEM_to_IR;

    wire [5:0] OPCODE;
    wire [4:0] RS;
    wire [4:0] RT;
    wire [15:0] OFFSET;
    wire [4:0] WRITEREG_in;

    wire [31:0] RB_to_A;
    wire [31:0] RB_to_B;

    wire [31:0] A_out;
    wire [31:0] B_out;

    Registrador PC_(
        clk,
        reset,
        PC_w,
        ULA_out,
        PC_out  
    );

    Memoria MEM_(
        .Address(PC_out),
        .Clock(clock),
        .Wr(MEM_w),
        .Datain(ULA_out), 
        .Dataout(MEM_to_IR)
    );

    Instr_Reg IR_(
        .Clk(clock),
        .Reset(reset),
        .Load_ir(IR_w),
        .Entrada(MEM_to_IR),
        .Instr31_26(OPCODE),
        .Instr25_21(RS),
        .Instr20_16(RT),
        .Instr15_0(OFFSET)
    );

    mux_writeReg MUX_WREG_(
        .selector(M_WREG),
        .data_0(RT),
        .data_1(OFFSET),
        .data_out(WRITEREG_in)
    );

    Banco_reg REG_BASE_(
        .Clk(clock),
        .Reset(reset),
        .RegWrite(RB_w),
        .ReadReg1(RS),
        .ReadReg2(RT),
        .WriteReg(WRITEREG_in),
        .WriteData(ULA_out),
        .ReadData1(RB_to_A),
        .ReadData2(RB_to_B)  
    );

    Registrador A_(
        .Clk(clock),
        .Reset(reset),
        .Load(AB_w),
        .Entrada(RB_to_A),
        .Saida(A_out)
    );

    Registrador B_(
        .Clk(clock),
        .Reset(reset),
        .Load(AB_w),
        .Entrada(RB_to_B),
        .Saida(B_out)
    )

endmodule