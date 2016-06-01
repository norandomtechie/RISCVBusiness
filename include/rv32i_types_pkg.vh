`ifndef RV32I_TYPES_PKG_VH
`define RV32I_TYPES_PKG_VH
package rv32i_types_pkg;
  parameter WORD_SIZE = 32;
  parameter OP_W = 7;
  parameter BR_W = 3;
  parameter LD_W = 3;
  parameter SW_W = 3;
  parameter IMM_W = 3;
  parameter REG_W = 3;

  typedef logic [WORD_SIZE-1:0] word_t;

  typedef enum logic [OP_W-1:0] {
    LUI     = 7'b0110111;
    AUIPC   = 7'b0010111;
    JAL     = 7'b1101111;
    JALR    = 7'b1100111;
    // All branching instructions share an opcode
    BRANCH  = 7'b1100011;
    // All load instructions share an opcode
    LOAD    = 7'b0000011;
    // All store instructions share an opcode
    STORE   = 7'b0100011;
    // All immediate ALU instructions share an opcode
    IMMED   = 7'b0010011;
    // All register-register instructions share an opcode
    REGREG  = 7'b0110011;
  } opcode_t;

  typedef enum logic [BR_W-1:0] {
    BEQ     = 3'b000;
    BNE     = 3'b001;
    BLT     = 3'b100;
    BGE     = 3'b101;
    BLTU    = 3'b110;
    BGEU    = 3'b111;
  } branch_t;  

  typedef enum logic [LD_W-1:0] {
    LB      = 3'b000;
    LH      = 3'b001;
    LW      = 3'b010;
    LBU     = 3'b100;
    LHU     = 3'b101;
  } load_t;

  typedef enum logic [SW_W-1:0] {
    SB      = 3'b000;
    SH      = 3'b001;
    SW      = 3'b010;
  } store_t;

  typedef enum logic [IMM_W-1:0] {
    ADDI    = 3'b000;
    SLTI    = 3'b010;
    SLTIU   = 3'b011;
    XORI    = 3'b100;
    ORI     = 3'b110;
    ANDI    = 3'b111;
    SLLI    = 3'b001;
    // Logical/Arithmetic based on bit 30 of instruction
    //    0   /    1
    SRI     = 3'b101;
  } imm_t;

  typedef enum logic [REG_W-1:0] {
    // Add/Sub based on bit 30 of instruction
    //  0 / 1 
    ADDSUB  = 3'b000;
    SLL     = 3'b001;
    SLT     = 3'b010;
    SLTU    = 3'b011;
    XOR     = 3'b100;
    // Logical/Arithmetic based on bit 30 of instruction
    //    0   /    1
    SR      = 3'b101;
    OR      = 3'b110;
    AND     = 3'b111;
  } regreg_t;

  typedef struct packed {
    logic [6:0] funct7;
    logic [4:0] rs2;
    logic [4:0] rs1;
    logic [2:0] funct3;
    logic [4:0] rd;
    opcode_t    opcode;
  } rtype_t

  typedef struct packed {
    logic [11:0]  imm11_00;
    logic [4:0]   rs1;
    logic [2:0]   funct3;
    logic [4:0]   rd;
    opcode_t      opcode;
  } itype_t 

  typedef struct packed {
    logic [6:0] imm11_05;
    logic [4:0] rs2;
    logic [4:0] rs1;
    logic [2:0] funct3;
    logic [4:0] imm04_00;
    opcode_t    opcode;
  } stype_t

  typedef struct packed {
    logic       imm12;
    logic [5:0] imm10_05;
    logic [4:0] rs2;
    logic [4:0] rs1;
    logic [2:0] funct3;
    logic [3:0] imm04_01;
    logic       imm11;
    opcode_t    opcode;
  } sbtype_t

  typedef struct packed {
    logic [19:0]  imm31_12;
    logic [4:0]   rd;
    opcode_t      opcode;
  } utype_t

  typedef struct packed {
    logic         imm20;
    logic [9:0]   imm10_01;
    logic         imm11;
    logic [7:0]   imm19_12;
    logic [4:0]   rd;
    opcode_t      opcode;
  } ujtype_t;

endpackage
`endif