`timescale 1ns/1ps

module Adder_4bits_tb;

reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire cout;

Adder_4bits uut(
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
);

initial begin

    $dumpfile("Adder_4bits.vcd");
    $dumpvars(0, Adder_4bits_tb);

    $monitor("t=%0t | a=%b b=%b cin=%b | s=%b cout=%b ", $time, a, b, cin, s, cout);

    a = 4'b0101;
    b = 4'b0011;
    cin=0; 
    #10;

    $display("===Fin de la simulacion===");
    $finish;
end

endmodule