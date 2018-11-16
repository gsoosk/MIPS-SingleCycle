module Datapath(input clk, rst , RegWrite, ConstEnable,MemWrite, MemRead, MemToReg, RegTwoAddr, BranchSel, JumpSel, noChange, push, pop, StackSel, Halt, input [3:0] ALUOperation, output [18:0] Instruction, output Zero, carryOut);
  
  //part 1
  wire [11:0] PCin;
  wire [11:0] PCout;
   wire [11:0] StackOut;// for Part 6-2 and Part 7
  
  wire [18:0] InsOut;
  wire [7:0] ReadData1, ReadData2, AluSecondInput, WriteData, AluOut, DataMemoryReadData; // Part 4 : DATA_MEMORY_READ_DATA 
  wire zero, cout;
  wire Zout, Cout;//Added after adding Z and C flipflop
  PC Pc(clk,rst,PCin, Halt, PCout);
  wire [11:0] PcAfterBranch; //Added in Part5
  wire [11:0] PcBeforeJump; //Added in Part6-1
  assign PcBeforeJump = (BranchSel == 1'b1 )? PcAfterBranch : PCout; //Edited in Part 5 and Part6-1
  wire [11:0] PcAfterJump; //Added in Part7
  assign PcAfterJump = JumpSel ? InsOut[11:0] - 1  : PcBeforeJump;
  assign PCin = StackSel ?  StackOut : PcAfterJump; // Part 7
  InstructionMemory InsMem(PCout,InsOut); 
  wire [2:0] ReadReg2;//added in part 4
  assign ReadReg2 = RegTwoAddr ? InsOut[13:11] : InsOut[7:5] ;
  RegisterFile RegFile(InsOut[10:8], ReadReg2, InsOut[13:11], WriteData, clk, RegWrite, ReadData1, ReadData2);
  ALU Alu(Instruction, ALUOperation, ReadData1, AluSecondInput, Cout, AluOut, zero, cout);
   //adding Z and C
   flipFlop Z(clk, rst, zero, noChange, Zout);
   flipFlop C(clk, rst, cout, noChange, Cout);
    //Part 4 needed this multiplexer :
  assign WriteData = MemToReg ? DataMemoryReadData : AluOut;
  
  assign Instruction = InsOut;

  //Part 2
  assign AluSecondInput = ConstEnable ? InsOut[7:0] : ReadData2;
  
  //Part 4
  DataMemory dataMemory(ReadData2, AluOut, clk, MemWrite, MemRead, DataMemoryReadData);
  
  //Part 5
  
  assign PcAfterBranch = {4'b0000, InsOut[7:0]} + PCout;  
 
  assign Zero = Zout;//Edited after added z and c
  assign carryOut = Cout;//Edited after added z and c
  
  //Part 6-2
  
  Stack stack(clk, rst, push, pop, PCout,StackOut);
   
  
 
  

endmodule
