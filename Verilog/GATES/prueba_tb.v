`timescale 1ns/1ps


module prueba_tb; 

reg a;
reg b;
wire y_and;
wire y_or;
wire y_xor;
wire y_not;
wire y_nand;
wire y_nor;
wire y_xnor;


    
prueba uut(
    .a (a),
    .b (b),
    .y_and (y_and),
    .y_or (y_or),
    .y_xor (y_xor),
    .y_not (y_not),
    .y_nand (y_nand),
    .y_nor (y_nor),
    .y_xnor (y_xnor)
);


initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, prueba_tb);

    $monitor("t=%0t | a=%b b=%b | and=%b or=%b xor=%b not=%b nand=%b nor=%b xnor=%b", $time, a, b, y_and, y_or, y_xor, y_not, y_nand, y_nor, y_xnor);

    a = 0; b = 0; #10;
    a = 1; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 1; #10;

    $display ("===Fin de la simulacion===");
    $finish;
end



endmodule


