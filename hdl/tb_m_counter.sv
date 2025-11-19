`timescale 1ns / 1ps



module tb_m_counter;


    parameter CLK_PERIOD = 100;

    localparam DUT_MAXCOUNT = 99_999;

    logic tb_clk;
    logic tb_rst;
    logic tb_tic;


    m_counter dut (
        .clk(tb_clk),
        .rst(tb_rst),
        .tic(tb_tic)
    );


    initial begin
        tb_clk = 0;
        forever #CLK_PERIOD tb_clk = ~tb_clk;

    end


    initial begin
        tb_rst = 1; 
        #(10000); 
        tb_rst= 0; 
        #(10000); 
    end


endmodule
