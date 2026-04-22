module dffDefault(
    input Default,
    input D,
    input clk,
    input rst,
    output reg Q,
    output Qn
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= Default;
        else
            Q <= D;
    end

    assign Qn = ~Q;

endmodule
