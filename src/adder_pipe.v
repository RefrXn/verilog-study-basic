module adder_pipe8 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    output reg  [7:0]  sum
);

    reg [7:0] sum_comb;

    always @(*) begin
        sum_comb = a + b;
    end

    always @(posedge clk) begin
        if (!rst_n)
            sum <= 8'b0000_0000;
        else
            sum <= sum_comb;
    end

endmodule

    


