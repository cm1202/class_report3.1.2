`timescale 1ns / 1ps



module blink_controller(
    input logic clk,
    input logic rst,
    input logic [15:0] speed,
    output logic led
    );
    
    logic [15:0] count, ncount;
    logic blink, blink_n;
    logic tic;
    
    m_counter ms(
    .clk(clk),
    .rst(rst),
    .tic(tic)
    );
    
    always_ff @(posedge(clk), posedge(rst)) begin
        if (rst) begin
            count <= 0;
            blink <= 0;
        end
        else begin
            count <= ncount;
            blink <= blink_n;
        end
    end
    
    always_comb begin
        if (speed == 16'd0) begin
           blink_n = 16'd0; 
        end 
        if (tic) begin
        ncount = count + 1;
            if (count >= (speed-1)) begin
                ncount = 0;
                blink_n = ~blink;
            end
            else begin
                blink_n = blink;
            end
        end
        else begin
            ncount = count;
            blink_n = blink;
        end
    end
    
    assign led = blink;        
endmodule