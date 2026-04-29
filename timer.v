////Timer: Mod-60 downcounter with synchronous load
//module timer(
//    input clk,
//    input rst,
//    input en,               //Enables or Disables clock
//    input load,             //If load=1, load the counter with "load_value"
//    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
//    output [5:0] state     //6-bits to represent the highest number 59
//);

//wire enable;
//reg D0, D1, D2, D3, D4, D5;
//reg Q0, Q1, Q2, Q3, Q4, Q5;

//assign enable = en & (state != 6'd0); 


//dffDefault dff0(
//    .Default(load? load_value[0]: 1'b0),
//    .D(~state[0]),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[0])
//);

//dffDefault dff1(
//    .Default(load? load_value[1]: 1'b0),
//    .D(state[1] ^ ~state[0]),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[1])
//);

//dffDefault dff2(
//    .Default(load? load_value[2]: 1'b0),
//    .D(state[2] ^ (~state[1] & ~state[0])),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[2])
//);

//dffDefault dff3(
//    .Default(load? load_value[3]: 1'b0),
//    .D(state[3] ^(~state[2]& ~state[1] & ~state[0])),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[3])
//);

//dffDefault dff4(
//    .Default(load? load_value[4]: 1'b0),
//    .D(state[4] ^ (~state[3] & ~state[2] & ~state[1] & ~state[0])),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[4])
//);

//dffDefault dff5(
//    .Default(load? load_value[5]: 1'b0),
//    .D(state[5] ^ (~state[4] & ~state[3] & ~state[2] & ~state[1] & ~state[0])),
//    .clk(clk & enable),
//    .rst(rst | load),
//    .Q(state[5])
//);

//endmodule

module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);

wire enable;
reg D0, D1, D2, D3, D4, D5;
reg Q0, Q1, Q2, Q3, Q4, Q5;

assign enable = en & (state != 6'd0); 
//always @(posedge clk or posedge en) begin
//    Q0 = state[0];
//    Q1 = state[1];
//    Q2 = state[2];
//    Q3 = state[3];
//    Q4 = state[4];
//    Q5 = state[5];
    
//    if ((Q0 | Q1 | Q2 | Q3 | Q4 | Q5) == 0)
//        // stop timer at 0
//        enable = 0;
//    else
//        enable = en;
//end

dffDefault dff0(
    .Default(load? load_value[0]: 1'b0),
    .D(~state[0]),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[0])
);

dffDefault dff1(
    .Default(load? load_value[1]: 1'b0),
    .D(state[1] ^ ~state[0]),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[1])
);

dffDefault dff2(
    .Default(load? load_value[2]: 1'b0),
    .D(state[2] ^ (~state[1] & ~state[0])),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[2])
);

dffDefault dff3(
    .Default(load? load_value[3]: 1'b0),
    .D(state[3] ^(~state[2]& ~state[1] & ~state[0])),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[3])
);

dffDefault dff4(
    .Default(load? load_value[4]: 1'b0),
    .D(state[4] ^ (~state[3] & ~state[2] & ~state[1] & ~state[0])),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[4])
);

dffDefault dff5(
    .Default(load? load_value[5]: 1'b0),
    .D(state[5] ^ (~state[4] & ~state[3] & ~state[2] & ~state[1] & ~state[0])),
    .clk(clk & enable),
    .rst(rst | load),
    .Q(state[5])
);

endmodule