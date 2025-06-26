`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:RTL Engineer 
// 
// Create Date: 02/05/2025 01:11:58 PM
// Design Name: Arithmetic Logic Unit 
// Module Name: ALU_4bit
// Project Name: First project 
// Target Devices: processors
// Tool Versions:Vivado 24.1 
// Description: This ALU Perform Addition, Subtraction,ANd,OR,NOT,XOR operation, Bitwise operation(shift left, shift right),and also perform comparison(zero flag).
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: this is my first project , and my first step towards my deram.
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_4bit(
input  [3:0]a,b,
input [2:0]opcode,
output reg [3:0]result,
output reg zero_flag);

//Automatic Sensitivity List:Instead of manually listing signals like always @(A, B, opcode), you let the compiler handle it.
//Prevents Latches:Ensures that the logic updates correctly and does not hold previous values (which would create an unintended latch).
always @(*)
case(opcode)
3'b000: result=a+b;// addition
3'b001: result=a-b;//subtraction
3'b010: result=a&b;// AND
3'b011: result=a|b;// OR
3'b100: result=a^b;//XOR
3'b101: result=~a;//NOT
3'b110: result=a<<1;//shift left
3'b111: result=a>>1;// shift right
 default:result=4'b0000; //default case
 endcase
 // using conditional operator
 // zero_flag if result is zero
 //zero_flag = (result== 4'b0000)?1:0; this show error due to reason.
 //This happens because zero_flag is declared as reg but not as reg [0:0] or wire, and you're trying to assign it an integer value (1 or 0) instead of a 1-bit binary value.
 always@(*)begin
  zero_flag = (result==4'b0000);// check if result is zero
  end
 endmodule
