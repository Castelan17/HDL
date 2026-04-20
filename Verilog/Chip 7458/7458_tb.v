`timescale 1ns/1ps

module chip7458_tb;

reg p1a, p2a, p2b, p2c, p2d, p1c, p1b, p1f, p1e, p1d;

wire p2y, p1y;

chip7458 uut(
    .p1a(p1a),
    .p2a(p2a),
    .p2b(p2b),
    .p2c(p2c),
    .p2d(p2d),
    .p1c(p1c),
    .p1b(p1b),
    .p1f(p1f),
    .p1e(p1e),
    .p1d(p1d),
    .p2y(p2y),
    .p1y(p1y)
);

initial begin
    $dumpfile("chip7458.vcd");
    $dumpvars(0, chip7458_tb);
    $monitor("t=%0d | p1a=%b  p1b=%b p1c=%b p1d=%b p1e=%b p1f=%b p2a=%b p2b=%b p2c=%b p2d=%b | p2y=%b p1y=%b", $time, p1a, p1b, p1c, p1d, p1e, p1f, p2a, p2b, p2c, p2d,  p2y, p1y );

    p1a=0; p1b=0; p1c=0; p1d=0; p1e=0; p1f=0; p2a=0; p2b=0; p2c=0; p2d=0; #10;

     // --- Pruebas p2y = (p2a & p2b) | (p2c & p2d) ---

    p2a=1; p2b=1; p2c=0; p2d=0; #10;

    p2a=0; p2b=0; p2c=1; p2d=1; #10;

    p2a=1; p2b=1; p2c=1; p2d=1; #10;

    p2a=1; p2b=0; p2c=1; p2d=0; #10;

    p2a=0; p2b=0; p2c=0; p2d=0; #10;

    // --- Pruebas p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f) ---

    p1a=1; p1b=1; p1c=1; p1d=0; p1e=0; p1f=0; #10;

    p1a=0; p1b=0; p1c=0; p1d=1; p1e=1; p1f=1; #10;

    p1a=1; p1b=1; p1c=1; p1d=1; p1e=1; p1f=1; #10;

    p1a=1; p1b=1; p1c=0; p1d=0; p1e=0; p1f=0; #10;

    p1a=0; p1b=0; p1c=0; p1d=1; p1e=1; p1f=0; #10;

    p1a=1; p1b=1; p1c=1; p1d=1; p1e=1; p1f=1;
    p2a=1; p2b=1; p2c=1; p2d=1; #10;
    
    $finish;
end

endmodule