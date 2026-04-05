`timescale 1ns/1ps

module MC_1bit_tb;
    reg a;
    reg b;
    wire c; 
    wire d; 
    wire e;


MC_1bit uut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e)
);

initial begin
    
    $dumpfile("Mc_1bit_vcd");
    $dumpvars(0, MC_1bit_tb);

    $monitor("t=%0d | a=%b b=%b| A>B=%b A=B=%b A<B=%b", $time, a, b, c, d, e);

    a=0; b=0; #10;
    a=1; b=0; #10;
    a=0; b=1; #10;
    a=1; b=1; #10;

    $display("===Fin de la ejecucion");
    $finish;

end
endmodule