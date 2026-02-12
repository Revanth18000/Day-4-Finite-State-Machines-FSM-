module fsm_output(
    input clk ,
    input reset ,
    output reg red ,
    output reg yellow ,
    output reg green
);

parameter s0 = 2'b00 ;
parameter s1 = 2'b01 ;
parameter s2 =  2'b10;

reg [1:0] state ;

always @(posedge clk) begin
    if(reset)
        state <= s0 ;
    else begin
        case(state)
            s0 : state <= s1 ;
            s1 : state <= s2;
            s2 : state <= s0 ;
            default : state <= s0;

        endcase
    end
end

always @(*) begin
    case(state)
        s0 : begin red=1 ; green = 0 ; yellow =0; end
        s1 : begin red =0 ; green = 1; yellow= 0 ; end
        s2 : begin red = 0; green = 0 ; yellow = 1 ; end 
        default : begin red =0 ; green = 0 ; yellow = 0 ; end 
    endcase
end
endmodule