module datapath(
    input logic clk,
    input logic rst,
    input logic data_valid,
    input logic ctrl_valid,
    input logic resp_valid,
    input logic [12:0] packet,
    output logic [1:0] packet_type,
    output logic [7:0] data_out_data,
    output logic [7:0] data_out_ctrl,
    output logic [7:0] data_out_resp,
    output logic eof_flag
);

    logic [1:0] dest_addr;
    logic [7:0] payload;

    assign dest_addr = packet[12:11];
    assign packet_type = packet[10:9];
    assign payload = packet[8:1];
    assign eof_flag = packet[0];

    fifo_reg data_reg(.clk(clk), .rst(rst), .valid(data_valid), .addr(dest_addr), .data_in(payload), .data_out(data_out_data));
    fifo_reg ctrl_reg(.clk(clk), .rst(rst), .valid(ctrl_valid), .addr(dest_addr), .data_in(payload), .data_out(data_out_ctrl));
    fifo_reg resp_reg(.clk(clk), .rst(rst), .valid(resp_valid), .addr(dest_addr), .data_in(payload), .data_out(data_out_resp));

endmodule

module fifo_reg(
    input logic clk,
    input logic rst,
    input logic valid,
    input logic [1:0] addr,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);

    logic [7:0] fifo [3:0];
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            data_out <= 0;
        end else begin
            if (valid) begin
                fifo[addr] <= data_in;
                data_out <= fifo[addr];
            end else begin
                data_out <= data_out;
            end
        end
    end
endmodule
