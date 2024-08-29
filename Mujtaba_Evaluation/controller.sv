module controller(
    input logic clk,
    input logic rst,
    input logic src_valid,
    input logic eof_flag,
    input logic [1:0] packet_type,
    output logic data_valid,
    output logic ctrl_valid,
    output logic resp_valid,
    output logic src_ready
);

    typedef enum logic {
        IDLE_STATE,
        PROCESS_STATE
    } state_e;
    
    state_e current_state, next_state;

    always_ff @(posedge clk, negedge rst) begin
        if (!rst) begin
            current_state <= IDLE_STATE;
        end else begin
            current_state <= next_state;
        end
    end

    always_comb begin
        data_valid = 0;
        ctrl_valid = 0;
        resp_valid = 0;
        src_ready = 0;
        
        case (current_state) 
            IDLE_STATE: begin
                src_ready = 1;
                if (src_valid & eof_flag) begin
                    next_state = PROCESS_STATE; 
                end else begin
                    next_state = IDLE_STATE;
                end
            end

            PROCESS_STATE: begin
                 case (packet_type) 
                     2'h0: begin
                         data_valid = 1;
                         ctrl_valid = 0;
                         resp_valid = 0;
                     end 
     
                     2'h1: begin
                         data_valid = 0;
                         ctrl_valid = 1;
                         resp_valid = 0;
                     end
     
                     2'h2: begin
                         data_valid = 0;
                         ctrl_valid = 0;
                         resp_valid = 1;
                     end
                 endcase
                 next_state = IDLE_STATE;
             end
         endcase
     end
endmodule
                    
