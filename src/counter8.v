module counter8 (
    input  wire       clk,
    input  wire       rst_n,   // 异步低有效复位
    output reg  [7:0] cnt
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            cnt <= 8'b0;
        else
            cnt <= cnt + 8'b1;
    end

endmodule
