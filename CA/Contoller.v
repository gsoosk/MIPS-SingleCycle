module ALUControl(input[2:0] ALUOp, input[2:0]fn, output reg [3:0] ALUOperation);
 parameter [2:0] ARTHEMATIC = 3'b000, SHIFT = 3'b001, MEM = 3'b010;
 always @(ALUOp, fn) begin
  if(ALUOp == ARTHEMATIC)
   case(fn)
    3'b000: ALUOperation <= 4'b0000; //add
    3'b001: ALUOperation <= 4'b0001; //addC
    3'b010: ALUOperation <= 4'b0010; //sub
    3'b011: ALUOperation <= 4'b0011; //subC
    3'b100: ALUOperation <= 4'b0100; //and
    3'b101: ALUOperation <= 4'b0101; //or
    3'b110: ALUOperation <= 4'b0110; //xor
    3'b111: ALUOperation <= 4'b0111; //Mask
    default: ALUOperation<= 4'b1111; //nothing !
   endcase
  else if(ALUOp == SHIFT) begin
    case(fn[1:0])
      2'b00: ALUOperation <= 4'b1000; //Shift left
      2'b01: ALUOperation <= 4'b1001; //Shift right
      2'b10: ALUOperation <= 4'b1010; //Rotate left
      2'b11: ALUOperation <= 4'b1011; //Rotate right
    endcase
  end
  else if(ALUOp == MEM) begin
    ALUOperation <= 4'b0000; //add address and r1
  end
 end
endmodule

module Contoller(input clk, rst ,input [18:0] Instruction, input Zero, carryOut, output reg RegWrite, ConstEnable, MemRead, MemWrite, MemToReg, RegTwoAddr, BranchSel, JumpSel, noChange, push, pop, StackSel, Halt, output  [3:0] ALUOperation);
  reg [2:0] ALUOp;
  always @(posedge rst)begin
    RegWrite = 0;
    ConstEnable = 0;
    MemRead = 0;
    MemWrite = 0;
    MemToReg = 0;
    RegTwoAddr = 0;
    ALUOp = 3'b000;
    BranchSel = 0;
    JumpSel = 0;
    noChange = 1;
    push = 0;
    pop = 0;
    StackSel = 0;
    Halt = 0;
  end
  
  always @ (Instruction) begin
    RegWrite = 0;
    ConstEnable = 0;
    MemRead = 0;
    MemWrite = 0;
    MemToReg = 0;
    noChange = 1;
    RegTwoAddr = 0;
    ALUOp = 3'b000;
    BranchSel = 0;
    JumpSel = 0;
    noChange = 1;
    push = 0;
    pop = 0;
    StackSel = 0; 
    Halt = 0;
    //Halt
    if(Instruction[18:0] == 19'b1111111111111111111)begin
      Halt = 1;
    end
    else if(Instruction[18:17] == 2'b00)begin
      noChange = 0;
      RegWrite = 1'b1;
      ALUOp = 3'b000;
    end
    else if(Instruction[18:17] == 2'b01)begin
      RegWrite = 1'b1;
      ConstEnable = 1'b1;
      ALUOp = 3'b000;
      noChange = 0;
    end
    else if(Instruction[18:16] == 3'b110)begin
      RegWrite = 1'b1;
      ALUOp = 3'b001;
    end
    else if(Instruction[18:16] == 3'b100)begin
      if(Instruction[15:14] == 2'b00) begin
        MemRead = 1'b1;
        RegWrite = 1'b1;
      end
      else if ( Instruction[15:14] == 2'b01)
        MemWrite = 1'b1;
      MemToReg = 1'b1;
      ALUOp = 3'b010;
      ConstEnable = 3'b1;
      RegTwoAddr = 1'b1;
    end
    else if(Instruction[18:16] == 3'b101)begin
      if(Instruction[15:14] == 2'b00)begin
        if(Zero)
          BranchSel = 1'b1;
      end
      if(Instruction[15:14] == 2'b01)begin
        if(!Zero)
          BranchSel = 1'b1;
      end
      if(Instruction[15:14] == 2'b10)begin
        if(carryOut)
          BranchSel = 1'b1;
      end
      if(Instruction[15:14] == 2'b11)begin
        if(!carryOut)
          BranchSel = 1'b1;
      end
    end
    else if(Instruction[18:14] == 5'b11100)begin
      BranchSel = 1'b1;
      JumpSel = 1'b1;
    end
    else if(Instruction[18:14] == 5'b11101)begin
      BranchSel = 1'b1;
      JumpSel = 1'b1;
      push = 1'b1;
     
      
    end
    else if(Instruction[18:13] == 6'b111100)begin
      StackSel = 1'b1;
      pop = 1'b1;
      
    end
    //HALT :
    
  end
  ALUControl ALUControl(ALUOp, Instruction[16:14], ALUOperation);
endmodule
