module noc_router(
    input logic clk,
    input logic rst,
    input logic [12:0] packet,
    input logic src_valid,
    output logic src_ready,
    output logic [7:0] data_out_data,
    output logic [7:0] data_out_ctrl,
    output logic [7:0] data_out_resp
);
    logic ctrl_valid;
    logic resp_valid;
    logic data_valid;
    logic [1:0] packet_type;
    logic eof_flag;

    datapath d1(.clk(clk), .rst(rst), .data_valid(data_valid), .ctrl_valid(ctrl_valid), .resp_valid(resp_valid), .packet(packet), .packet_type(packet_type), .data_out_data(data_out_data), .data_out_ctrl(data_out_ctrl), .data_out_resp(data_out_resp), .eof_flag(eof_flag));

    controller c1(.clk(clk), .rst(rst), .src_valid(src_valid), .eof_flag(eof_flag), .data_valid(data_valid), .ctrl_valid(ctrl_valid), .resp_valid(resp_valid), .src_ready(src_ready));

endmodule

    
