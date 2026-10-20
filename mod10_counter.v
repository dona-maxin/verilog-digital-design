module mod10_counter (
    input clk,
    input reset,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'b0000;
    else if (count == 4'd9)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end

endmodule
