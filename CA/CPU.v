module CPU(input clk, rst);
  wire [18:0] Instruction;
  wire RegWrite, ConstEnable , MemRead, MemWrite, MemToReg, RegTwoAddr, BranchSel, JumpSel, noChange, push, pop, StackSel;
  wire [3:0] ALUOperation;
  wire Zero, carryOut;
  Contoller controller(clk, rst, Instruction,Zero, carryOut, RegWrite, ConstEnable, MemRead, MemWrite, MemToReg,RegTwoAddr,BranchSel, JumpSel, noChange, push, pop, StackSel, Halt, ALUOperation);
  Datapath datapath(clk, rst , RegWrite, ConstEnable,MemWrite, MemRead, MemToReg, RegTwoAddr,BranchSel, JumpSel, noChange, push, pop, StackSel, Halt,ALUOperation, Instruction, Zero, carryOut);
endmodule
