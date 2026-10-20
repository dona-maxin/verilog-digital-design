module sequence_detector_101 (
    input clk,
    input reset,
    input din,
    output reg detected
);

reg [1:0] state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

always @(posedge clk) begin
    if (reset) begin
        state <= S0;
        detected <= 1'b0;
    end
    else begin
        case (state)

            S0: begin
                detected <= 1'b0;
                if (din)
                    state <= S1;
                else
                    state <= S0;
            end

            S1: begin
                detected <= 1'b0;
                if (din)
                    state <= S1;
                else
                    state <= S2;
            end

            S2: begin
                if (din) begin
                    detected <= 1'b1;
                    state <= S1;
                end
                else begin
                    detected <= 1'b0;
                    state <= S0;
                end
            end

            default: begin
                state <= S0;
                detected <= 1'b0;
            end

        endcase
    end
end

endmodule
