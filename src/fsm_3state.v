module fsm_3state (
    input  wire clk,
    input  wire rst_n,
    input  wire start,
    output reg  busy,
    output reg  done
);

    // state encoding (3)
    localparam S_IDLE = 2'b00;
    localparam S_WORK = 2'b01;
    localparam S_DONE = 2'b10;

    reg [1:0] state, next_state;

    // state register (sequential logic)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    // next_state logic (combinational)
    always @(*) begin
        next_state = state;

        case (state)
            S_IDLE: begin   
                if (start)
                    next_state = S_WORK;
            end
            S_WORK: begin
                next_state = S_DONE;
            end
            S_DONE: begin
                if (!start) 
                    next_state = S_IDLE;
            end

            default: next_state = S_IDLE;
        endcase
    end

    // output logic (combinational)
    always @(*) begin
        busy = 1'b0;
        done = 1'b0;

        case (state)
            S_IDLE: begin
                busy = 1'b0;
                done = 1'b0;
            end
            S_WORK: begin
                busy = 1'b1;
                done = 1'b0;
            end
            S_DONE: begin
                busy = 1'b0;
                done = 1'b1;
            end
        endcase
    end

endmodule
