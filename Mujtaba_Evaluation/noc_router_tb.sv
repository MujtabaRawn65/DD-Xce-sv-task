module noc_router_tb();

    logic clk;
    logic rst;
    logic [12:0] packet;
    logic src_valid;
    logic src_ready;
    logic [7:0] data_out_data;
    logic [7:0] data_out_ctrl;
    logic [7:0] data_out_resp;

    noc_router dut(
        .clk(clk),
        .rst(rst),
        .packet(packet),
        .src_valid(src_valid),
        .src_ready(src_ready),
        .data_out_data(data_out_data),
        .data_out_ctrl(data_out_ctrl),
        .data_out_resp(data_out_resp)
    );

    packet_gen pg1(
        .src_ready(src_ready),
        .src_valid(src_valid),
        .packet(packet)
    );

    initial begin
        $dumpfile("noc_router_tb.vcd");
        $dumpvars(0, noc_router_tb);
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
       reset(100);
       repeat(200) @(posedge clk);
       $finish;
    end


    task reset(input logic [7:0] a);
        rst = 1;
        #a rst = 0;
        #a rst = 1;
    endtask
endmodule
