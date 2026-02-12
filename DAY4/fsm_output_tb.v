module fsm_output_tb;
reg clk ;
reg reset ;
wire red , green , yellow ;

fsm_output uut(.clk(clk) , .reset(reset ) , .red(red ) , .green(green) , .yellow(yellow));

always #5 clk =~clk;

initial begin 
    clk =0 ;
    reset = 1;

    #20 reset  = 0;

    #60 $finish;
end
endmodule