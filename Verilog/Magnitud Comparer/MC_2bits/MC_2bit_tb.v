`timescale  1ns/1ps

module MC_2bit_tb;

reg a0; 
reg a1;
reg b0;
reg b1;

wire c; 
wire d;
wire e;
wire f;
wire g;

MC_2bit uut(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),

    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
);

initial begin 
    $dumpfile("sim.vcd");
    $dumpvars(0, MC_2bit_tb );

    $monitor("t=%0d | a1=%b a0=%b b1=%b  b0=%b | A < B=%0b | A = E =%b | A > B=%b ", $time, a1, a0, b1, b0, c, e, d);


       a1 = 0; a0 = 0; b1 = 0; b0 = 0;  #10;
       a1 = 0; a0 = 0; b1 = 0; b0 = 1;  #10;
       a1 = 0; a0 = 0; b1 = 1; b0 = 0;  #10;
       a1 = 0; a0 = 0; b1 = 1; b0 = 1;  #10;
       a1 = 0; a0 = 1; b1 = 0; b0 = 0;  #10;
       a1 = 0; a0 = 1; b1 = 0; b0 = 1;  #10;
       a1 = 0; a0 = 1; b1 = 1; b0 = 0;  #10;
       a1 = 0; a0 = 1; b1 = 1; b0 = 1;  #10;
       a1 = 1; a0 = 0; b1 = 0; b0 = 0;  #10;
       a1 = 1; a0 = 0; b1 = 0; b0 = 1;  #10;
       a1 = 1; a0 = 0; b1 = 1; b0 = 0;  #10;
       a1 = 1; a0 = 0; b1 = 1; b0 = 1;  #10;
       a1 = 1; a0 = 1; b1 = 0; b0 = 0;  #10;
       a1 = 1; a0 = 1; b1 = 0; b0 = 1;  #10;
       a1 = 1; a0 = 1; b1 = 1; b0 = 0;  #10;
       a1 = 1; a0 = 1; b1 = 1; b0 = 1;  #10;
       
     

      $display("===Fin de la simulacion===");
      $finish;

end
endmodule
