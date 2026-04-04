`timescale 1ns/1ps


module Adder_4bits_tb;

reg a1; 
reg b1; 
reg a2; 
reg b2; 
reg a3; 
reg b3; 
reg a4; 
reg b4; 
reg cin;
wire s1; 
wire s2; 
wire s3; 
wire s4; 
wire c1; 
wire c2; 
wire c3; 
wire c4;

Adder_4bits uut(
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .a4(a4),
    .b1(b1),
    .b2(b2),
    .b3(b3),
    .b4(b4),
    .s1(s1),
    .s2(s2),
    .s3(s3),
    .s4(s4),
    .c1(c1),
    .c2(c2),
    .c3(c3),
    .c4(c4),
    .cin(cin)

);
  
initial begin
    
    $dumpfile("sim.vcd");
    $dumpvars(0, Adder_4bits_tb);

    $monitor("t=%0t | a1=%0b b1=%0b a2=%0b b2=%0b a3=%0b b3=%0b a4=%0b b4=%0b cin=%0b | s1=%0b s2=%0b s3=%0b s4=%0b c1=%0b c2=%0b c3=%0b c4=%0b ", 
    $time, a1, b1, a2, b2, a3, b3, a4, b4, cin, s4, s3, s2, s1, c1, c2, c3, c4 );

    a4=0; a3=1; a2=0; a1=1; 
    b4=0; b3=0; b2=1; b1=1;
    cin=0; #10;

    $display("===Fin de la simulacion===");
    $finish;
end

endmodule
