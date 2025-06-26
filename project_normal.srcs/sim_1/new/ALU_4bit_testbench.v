`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 02:34:14 PM
// Design Name: 
// Module Name: ALU_4bit_testbench
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

`timescale 1ns / 1ps

module ALU_4bit_tb;

  // Inputs
  reg [3:0] a, b;
  reg [2:0] opcode; // Assuming 3-bit opcode for operations

  // Outputs
  wire [3:0] result;
  wire zero_flag;

  // Instantiate the ALU module
  ALU_4bit uut (
    .a(a), 
    .b(b), 
    .opcode(opcode), 
    .result(result), 
    .zero_flag(zero_flag)
  );

  initial begin
    // Display output
    $monitor("Time=%0t | a = %b, b = %b, opcode = %b, result = %b, zero_flag = %b", $time, a, b, opcode, result, zero_flag);

    // Test Cases with additional delay for stabilization
    a = 4'b0001; b = 4'b0010; opcode = 3'b000; #5; #5;  // ADD
    $display("ADD: %b + %b = %b", a, b, result);

    a = 4'b0101; b = 4'b0011; opcode = 3'b001; #5; #5; // SUB
    $display("SUB: %b - %b = %b", a, b, result);

    a = 4'b1100; b = 4'b1010; opcode = 3'b010; #5; #5; // AND
    $display("AND: %b & %b = %b", a, b, result);

    a = 4'b1100; b = 4'b1010; opcode = 3'b011; #5; #5; // OR
    $display("OR: %b | %b = %b", a, b, result);

    a = 4'b1100; b = 4'b0000; opcode = 3'b100; #5; #5; // XOR
    $display("XOR: %b ^ %b = %b", a, b, result);

    a = 4'b1100; b = 4'b0000; opcode = 3'b101; #5; #5; // NOT (on a)
    $display("NOT: ~%b = %b", a, result);

    a = 4'b1100; b = 4'b0000; opcode = 3'b110; #5; #5; // SHIFT LEFT
    $display("SHIFT LEFT: %b << 1 = %b", a, result);

    a = 4'b1100; b = 4'b0000; opcode = 3'b111; #5; #5; // SHIFT RIGHT
    $display("SHIFT RIGHT: %b >> 1 = %b", a, result);

    a = 4'b0000; b = 4'b0000; opcode = 3'b000; #5; #5; // Zero Test
    $display("ZERO FLAG TEST: Result = %b, Zero Flag = %b", result, zero_flag);

    // Finish simulation
    $finish;
  end

endmodule


