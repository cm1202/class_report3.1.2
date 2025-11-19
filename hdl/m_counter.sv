`timescale 1ns / 1ps


module m_counter(
    input logic clk,
    input logic rst,
    output logic tic
    );
    logic [31:0] count;
    logic ms;
    
    
    
    always_ff @(posedge(clk), posedge(rst)) begin
        if (rst) begin
            ms <= 0;
            count <= 0;
            
        end
        else begin
            if (count == 99_999) begin
                ms <= 1'b1;
                count <= 0;
            end
            else begin
                ms <= 1'b0;
                count <= count + 1;
                end
                
              end
            end
    
    assign tic = ms;
    
endmodule