`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rachanna Ullagaddi
// 
// Create Date: 17.10.2024 12:05:41
// Design Name: 
// Module Name: MIPS32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MIPS32(
input clk1,
input clk2    );

reg [31:0]  PC, IF_ID_IR, IF_ID_NPC;
reg [31:0]  ID_EX_NPC, ID_EX_IR, ID_EX_A, ID_EX_B, ID_EX_Imm;
reg [31:0]  ID_EX_Type, EX_MEM_Type, MEM_WB_Type;
reg [31:0]  EX_MEM_ALUout, EX_MEM_B, EX_MEM_IR;
reg         EX_MEM_cond;
reg [31:0]  MEM_WB_ALUout, MEM_WB_LMD, MEM_WB_IR;

reg [31:0] Reg [0:31];
reg [31:0] Memory [0:1023];

parameter ADD = 6'b000000, SUB = 6'b000001, AND = 6'b000010, OR = 6'b000011, SLT = 6'b000100,
          MUL = 6'b000101, HLT = 6'b111111, LW = 6'b001000, SW = 6'b001001, ADDI = 6'b001010, 
          SUBI = 6'b001011, SLTI = 6'b001100, BNEQZ = 6'b001101, BEQZ = 6'b001110;
parameter RR_ALU = 3'b000, RM_ALU = 3'b001, LOAD = 3'b010, STORE = 3'b011, BRANCH = 3'b100, HALT = 3'b101;

reg HALTED;
reg TAKEN_BRANCH;


always @(posedge clk1)              //Fetch stage
begin 
   if(HALTED == 0)
   begin
        if(((EX_MEM_IR[31:26] == BEQZ) && (EX_MEM_cond == 1)) || ((EX_MEM_IR[31:26] == BNEQZ) && (EX_MEM_cond == 0)))
        begin
            IF_ID_IR        <= #2 Memory[EX_MEM_ALUout];
            TAKEN_BRANCH    <= #2 1;
            IF_ID_NPC       <= #2 EX_MEM_ALUout + 1;
            PC              <= #2 EX_MEM_ALUout + 1;
        end
        else
        begin
            IF_ID_IR    <= #2 Memory[PC];
            IF_ID_NPC   <= #2 PC + 1;
            PC          <= #2 PC + 1;
        end
   end
end


always @(posedge clk2)              //Decode
begin
    if(HALTED == 0)
    begin
        if(IF_ID_IR[25:21] == 5'b00000) ID_EX_A <= 0;
        else ID_EX_A <= #2 Reg[IF_ID_IR[25:21]];
        
        if(IF_ID_IR[20:16] == 5'b00000) ID_EX_B <= 0;
        else ID_EX_B <= #2 Reg[IF_ID_IR[20:16]];
        
        ID_EX_NPC   <= IF_ID_NPC;
        ID_EX_IR    <= IF_ID_IR;
        ID_EX_Imm   <= {{16{IF_ID_IR[15]}},{IF_ID_IR[15:0]}};        
    end
    
    case(IF_ID_IR[31:26])
    ADD, SUB, AND, OR, SLT, MUL:    ID_EX_Type <= #2 RR_ALU;
    ADDI, SLTI, SUBI:               ID_EX_Type <= #2 RM_ALU;
    LW:                             ID_EX_Type <= #2 LOAD;  
    SW:                             ID_EX_Type <= #2 STORE;
    BEQZ, BNEQZ:                    ID_EX_Type <= #2 BRANCH;
    HLT:                            ID_EX_Type <= #2 HALT;
    default:                        ID_EX_Type <= #2 HALT;
    endcase
end

always @(posedge clk1)              //Execute
begin
    if(HALTED == 0)
    begin
        EX_MEM_IR       <= #2 ID_EX_IR;
        EX_MEM_Type     <= #2 ID_EX_Type;
        TAKEN_BRANCH    <= #2 0;
        case(ID_EX_Type)
        RR_ALU: begin
                    case(ID_EX_IR[31:26])
                    ADD:    EX_MEM_ALUout <= #2 ID_EX_A + ID_EX_B; 
                    SUB:    EX_MEM_ALUout <= #2 ID_EX_A - ID_EX_B;
                    AND:    EX_MEM_ALUout <= #2 ID_EX_A & ID_EX_B;
                    OR:     EX_MEM_ALUout <= #2 ID_EX_A | ID_EX_B;
                    MUL:    EX_MEM_ALUout <= #2 ID_EX_A * ID_EX_B;
                    SLT:    EX_MEM_ALUout <= #2 ID_EX_A < ID_EX_B;
                    default:EX_MEM_ALUout <= #2 32'hxxxxxxxx;
                    endcase
                end
        RM_ALU: begin
                    case(ID_EX_IR[31:26])
                    ADDI:   EX_MEM_ALUout <= #2 ID_EX_A + ID_EX_Imm;
                    SUBI:   EX_MEM_ALUout <= #2 ID_EX_A - ID_EX_Imm; 
                    SLTI:   EX_MEM_ALUout <= #2 ID_EX_A < ID_EX_Imm;
                    default:EX_MEM_ALUout <= #2 32'hxxxxxxxx;
                    endcase
                end
        LOAD, STORE:   begin
                    EX_MEM_ALUout   <= #2 ID_EX_A + ID_EX_Imm;
                    EX_MEM_B        <= #2 ID_EX_B;     
                end
        BRANCH: begin
                    EX_MEM_ALUout   <= #2 ID_EX_NPC + ID_EX_Imm;
                    EX_MEM_cond     <= #2 (ID_EX_A == 0);
                end
        endcase
    end
end


always @(posedge clk2)              //Memory Store or Load
begin
    if(HALTED ==0)
    begin
        MEM_WB_IR   <= #2 EX_MEM_IR;
        MEM_WB_Type <= #2 EX_MEM_Type;
        case(EX_MEM_Type)
        RR_ALU, RM_ALU: MEM_WB_ALUout   <= #2 EX_MEM_ALUout;
        LOAD:           MEM_WB_LMD      <= #2 Memory[EX_MEM_ALUout];
        STORE:          if(TAKEN_BRANCH == 0) Memory[EX_MEM_ALUout] <= #2 EX_MEM_B;
        endcase
    end
end

always @(posedge clk1)              //Write back
begin
    if(TAKEN_BRANCH == 0)
    begin
        case(MEM_WB_Type)
        RR_ALU: Reg[MEM_WB_IR[15:11]]   <= MEM_WB_ALUout;
        RM_ALU: Reg[MEM_WB_IR[20:16]]   <= MEM_WB_ALUout;
        LOAD:   Reg[MEM_WB_IR[20:16]]   <= MEM_WB_LMD;
        HLT:    HALTED                  <= #2 1'b1;        
        endcase
    end
end

endmodule




module MIPS32_tb;
reg clk1;
reg clk2;
integer i;
MIPS32 mips(.clk1(clk1),.clk2(clk2));
initial 
begin
    clk1 = 0;
    clk2 = 0;
    repeat(20)
    begin
        #5 clk1 = ~clk1;
        #5 clk2 = ~clk2;
    end
end
initial 
begin
    for(i=0;i<31;i=i+1)
    mips.Reg[i] = i;
    
    mips.Memory[0] = 32'h2801000a;
    mips.Memory[1] = 32'h28020014;
    mips.Memory[2] = 32'h28030019;
    mips.Memory[3] = 32'h0ce77800;
    mips.Memory[4] = 32'h0ce77800;
    mips.Memory[5] = 32'h00222000;
    mips.Memory[6] = 32'h0ce77800;
    mips.Memory[7] = 32'h00832800;
    mips.Memory[8] = 32'hfc000000;
    mips.HALTED      = 0;
    mips.PC          = 0;
    mips.TAKEN_BRANCH = 0;
    #280
    for(i=0;i<6;i=i+1)
    $display("R%s - %2d",i,mips.Reg[i]);
end
endmodule
