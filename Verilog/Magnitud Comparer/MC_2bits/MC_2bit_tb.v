`timescale  1ns/1ps

module MC_2bit_tb;

reg [1:0] A; 
reg [1:0] B;

wire c, d, e; 

MC_2bit uut(
    .a0(A[0]), .a1(A[1]),
    .b0(B[0]), .b1(B[1]),
    .c(c), .d(d), .e(e)
);


integer i;

initial begin 
    $dumpfile("sim.vcd");
    $dumpvars(0, MC_2bit_tb );

    $monitor("t=%0d | A=%b B=%b | A < B=%0b | A==E=%b | A > B=%b ", 
                $time, A, B, c, e, d);


    for( i=0; i<16; i=i+1)
    begin
        A=i[3:2];
        B=i[1:0];
        #10;

    end

      $display("===Fin de la simulacion===");
      $finish;

end
endmodule
