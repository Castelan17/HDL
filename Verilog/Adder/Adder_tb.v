`timescale 1ns/1ps

module Adder_tb;

reg a, b, cin;
wire s, cout;

Adder utt(
    .a    (a),
    .b    (b),
    .cin  (cin),
    .s    (s),
    .cout (cout)
);


initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, Adder_tb);
    $monitor("t=%0t | a=%b b=%b cin=%b | s=%b cout=%b", $time, a, b, cin, s, cout);

    a=0; b=0; cin=0; #10;
    a=1; b=0; cin=0; #10;
    a=0; b=1; cin=0; #10;
    a=1; b=1; cin=0; #10;
    a=1; b=0; cin=1; #10;
    a=0; b=1; cin=1; #10;
    a=1; b=1; cin=1; #10;
    a=0; b=0; cin=1; #10;
    
    $display("===Fin de la simulacion==");
    $finish;

end


endmodule