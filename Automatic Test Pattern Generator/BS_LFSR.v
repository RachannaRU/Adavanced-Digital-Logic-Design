module BS_LFSR_5bit(
    input wire clk,
    input wire rst,
    output wire [4:0] mux_out
    );
    // Internal signals
    reg [4:0] lfsr_reg;
    wire feedback;
    reg [4:0] mux;

    // Initial value for the LFSR (can be any non-zero value)
    initial begin
        lfsr_reg = 5'b01111;
    end

    // LFSR state update process
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the LFSR
            lfsr_reg <= 5'b01111;
        end else begin
            // Shift the register to the right
            lfsr_reg[4:1] <= lfsr_reg[3:0];
            // Calculate the feedback value
            lfsr_reg[0] <= feedback;
        end
    end

    assign feedback = lfsr_reg[2] ^ lfsr_reg[4]; // Primitive polynomial equation x^5 + x^3 + 1

    always @(*) begin
        if (lfsr_reg[4]) begin
            mux = {lfsr_reg[4], lfsr_reg[3],lfsr_reg[2],lfsr_reg[0],lfsr_reg[1]};
        end else begin
            mux = lfsr_reg;
        end
    end

    assign mux_out = mux;

endmodule