`timescale 1ns / 1ps


module Traffic_Light_Controller_TB;
reg clk, rst;
wire [2:0] light_M1;
wire [2:0] light_S;
wire [2:0] light_MT;
wire [2:0] light_M2;

// Instantiate the DUT (Device Under Test)
Traffic_Light_Controller dut(
    .clk(clk), 
    .rst(rst), 
    .light_M1(light_M1), 
    .light_S(light_S),
    .light_M2(light_M2),
    .light_MT(light_MT)
);

// Clock generation
initial
begin
    clk = 1'b0;
    forever #(1000000000 / 2) clk = ~clk;  // Clock with a period of 1 second
end

// Reset sequence and test case execution
initial
begin
    rst = 0;
    #1000000000;  // Wait for 1 second
    rst = 1;      // Assert reset
    #1000000000;  // Wait for 1 second
    rst = 0;      // Deassert reset
    #(1000000000 * 200);  // Simulate for 200 seconds
    $finish;
end

// Monitor traffic light signals
initial
begin
    $monitor("Time = %0t, light_M1 = %b, light_S = %b, light_MT = %b, light_M2 = %b", 
             $time, light_M1, light_S, light_MT, light_M2);
end

initial
begin
    $dumpfile("traffic_light_controller.vcd"); // VCD file to store waveform data
    $dumpvars(0, Traffic_Light_Controller_TB);  // Dump all variables in this module
end

endmodule
