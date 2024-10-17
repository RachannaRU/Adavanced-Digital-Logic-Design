`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rachanna Ullagaddi
// 
// Create Date: 18.09.2024 15:16:44
// Design Name: 
// Module Name: i2c_ip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module i2c_ip(
	input wire CLK,                   
	input wire rstn,                  
	input wire chip_sel,              
	input wire chip_en,
	input wire chip_write,            
	input wire [7:0] chip_addr,       
	input wire [31:0] wdata,
	output [31:0]rdata,
	inout i2c_scl,
	inout i2c_sda
    );
    
    
    wire [7:0] data_out;
    wire [7:0] status_reg;
    wire din_write;  
    wire [7:0] control_reg;
    wire [7:0] slave_addr;
    wire [7:0] data_in;
    wire [7:0] data_count;
    wire dout_read;
    
    i2c_controller controller(
    .CLK(CLK),
    .rstn(rstn),
    .chip_sel(chip_sel),
    .chip_en(chip_en),
    .chip_write(chip_write),
    .chip_addr(chip_addr),
    .wdata(wdata),
    .data_out(data_out),
    .status_reg(status_reg),
    .din_write(din_write),
    .dout_read(dout_read),
    .rdata(rdata),
    .control_reg(control_reg),
    .slave_addr(slave_addr),
    .data_in(data_in),
    .data_count(data_count)
    );
    
    i2c_master master(
    .CLK(CLK),
    .control_reg(control_reg),
    .slave_addr(slave_addr),
    .data_in(data_in),
    .data_count(data_count),
    .din_write(din_write),
    .dout_read(dout_read),
    .status_reg(status_reg),
    .data_out(data_out),
    .i2c_sda(i2c_sda),
    .i2c_scl(i2c_scl)
    );
endmodule
