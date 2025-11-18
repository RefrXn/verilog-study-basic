module pri_enc4 (
    input  wire [3:0] req,
    output reg        valid,
    output reg  [1:0] index
);

    always @(*) begin
    
        valid = 1'b0;
        index = 2'b00;

        if (req[3]) begin
            valid = 1'b1;
            index = 2'b11;
        end
        else if (req[2]) begin
            valid = 1'b1;
            index = 2'b10;
        end
        else if (req[1]) begin
            valid = 1'b1;
            index = 2'b01;
        end
        else if (req[0]) begin
            valid = 1'b1;
            index = 2'b00;
        end
    end

endmodule
