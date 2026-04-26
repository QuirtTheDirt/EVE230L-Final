//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);
wire is_fiftynine;
assign is_fiftynine = (state == 6'd59);
//state[5] & state[4] & state[3] & ~state[2] & state[1] & state[0]
 reg D0, D1, D2, D3, D4, D5;
 wire Q0, Q1, Q2, Q3, Q4, Q5;
 assign state[5:0] = {Q5,Q4,Q3,Q2,Q1,Q0};
   always @(*) begin
    

        if (~en) begin
            D0 = Q0;
            D1 = Q1;
            D2 = Q2;
            D3 = Q3;
            D4 = Q4;
            D5 = Q5;
         end
         
        else if (is_fiftynine) begin
            D0 = 1'b0;
            D1 = 1'b0;
            D2 = 1'b0;
            D3 = 1'b0;
            D4 = 1'b0;
            D5 = 1'b0;
        end         
            
        else begin
            D0 = ~Q0; 
            D1 = Q1 ^ Q0;
            D2 = Q2 ^ (Q0 & Q1);
            D3 = Q3 ^ (Q0 & Q1 & Q2);
            D4 = Q4 ^ (Q0 & Q1 & Q2 & Q3);
            D5 = Q5 ^ (Q0 & Q1 & Q2 & Q3 & Q4);
        end
              
    end

    dff dff0 (
        .D(D0),
        .clk(clk),
        .rst(rst),
        .Q(Q0)
    );
    dff dff1 (
        .D(D1),
        .clk(clk),
        .rst(rst),
        .Q(Q1)
    );
    dff dff2 (
        .D(D2),
        .clk(clk),
        .rst(rst),
        .Q(Q2)
    );
    dff dff3 (
        .D(D3),
        .clk(clk),
        .rst(rst),
        .Q(Q3)
    );
    dff dff4 (
        .D(D4),
        .clk(clk),
        .rst(rst),
        .Q(Q4)
    );
    dff dff5 (
        .D(D5),
        .clk(clk),
        .rst(rst),
        .Q(Q5)
    );



endmodule




