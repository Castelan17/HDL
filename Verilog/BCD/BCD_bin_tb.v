`timescale 1ns/1ps

module BCD_bin_tb;

reg         clk;
reg         en;
reg  [11:0] bin_d_in;
wire [15:0] bin_d_out;
wire        rdy;


BCDConvert utt(
    .clk     (clk),
    .en      (en),
    .bin_d_in(bin_d_in),
    .bin_d_out(bin_d_out),
    .rdy     (rdy)
);


initial begin
    clk=0;
    en = 0;
    bin_d_in= 12'd0;
end

always #10 clk = ~clk;

initial begin
        $dumpfile("bcd_bin.vcd");
        $dumpvars(0, BCD_bin_tb);
end

initial begin
        $monitor("t=%0t | en=%b bin_d_in=%b | bin_d_out=%b rdy=%b", 
            $time, en, bin_d_in, bin_d_out, rdy
            );
end

initial begin

       @(posedge clk); #1;
       bin_d_in= 12'd255;
       en = 1;

       @(posedge rdy);
       $display("TEST 255 A BCD: %h (esperando: 0255)", bin_d_out);

       @(posedge clk); #1;
       en = 0;
       repeat(3) @(posedge clk);

       $display("===Fin de la simulacion===");
       $finish;
end

endmodule