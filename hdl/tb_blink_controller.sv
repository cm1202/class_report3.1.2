`timescale 1ns / 1ps

module tb_blink_controller;


    logic led,clk,rst;
    logic [15:0] speed;


    blink_controller blink(
        .clk(clk),
        .rst(rst),
        .speed(speed),
        .led(led)
    );
    

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // ----- Test Sequence -----
    initial begin

        
        rst = 1;         // Start in reset
        speed = 16'd5;   // Set speed to 5ms
        

        repeat(2) @(posedge clk);
        rst = 0;         // Come out of reset

        #12_000_000; 
        
        $finish;         // Stop the simulation
    end
    
endmodule
