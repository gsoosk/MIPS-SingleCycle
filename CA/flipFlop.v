module flipFlop(input clk, rst, in, noChange, output reg q );
  always@(negedge clk, posedge rst)begin 
    if(rst)
      q <= 1'b0;
    else begin
      if(noChange == 0)
        q <= in;
    end
  end
  
endmodule 
