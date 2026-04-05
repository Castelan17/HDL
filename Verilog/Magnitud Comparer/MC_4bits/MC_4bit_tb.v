`timescale  1ns/1ps

module MC_2bit_tb;

reg [3:0] A; 
reg [3:0] B;

wire c, d, e; 

MC_4bit uut(
    .a0(A[0]), .a1(A[1]), .a2(A[2]), .a3(A[3]),
    .b0(B[0]), .b1(B[1]), .b2(B[2]), .b3(B[3]),
    .c(c), .d(d), .e(e)
);


integer i;

initial begin 
    $dumpfile("sim.vcd");
    $dumpvars(0, MC_2bit_tb );

    $monitor("t=%0d | A=%b B=%b | A < B=%0b | A==E=%b | A > B=%b ", 
                $time, A, B, c, e, d);


    for( i=0; i<256; i=i+1)
    begin
        A=i[7:4];
        B=i[3:0];
        #10;
    end

      $display("===Fin de la simulacion===");
      $finish;

end
endmodule
