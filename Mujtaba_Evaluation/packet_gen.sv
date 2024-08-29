module packet_gen(
    input logic src_ready,
    output logic src_valid,
    output logic [12:0] packet
);
    logic [1:0] dest_addr;
    logic [1:0] packet_type;
    logic [7:0] payload;
    logic eop_flag;

    always_comb begin
        dest_addr = $random;
        packet_type = $random;
        payload = $random;
        
        if (src_ready) begin
            if (dest_addr != 2'h3) begin
                src_valid = 1;
                eop_flag = 1;
                packet = {dest_addr, packet_type, payload, eop_flag};
            end else begin
                src_valid = 0;
                eop_flag = 0;
                packet = 13'hx;
            end
        end
    end
endmodule
