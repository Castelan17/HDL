`timescale 1ns/1ps

module Calculadora_tb;


reg [3:0] op, a, b;
reg clk, clr, guardar;

wire [7:0] resultado;
wire [7:0] c;
wire [11:0] bcd;

calculadora uut(
    .clk(clk),
    .clr(clr),
    .guardar(guardar),
    .a(a),
    .b(b),
    .op(op),
    .c(c),
    .resultado(resultado),
    .bcd(bcd)
);

initial clk=0;
always #10 clk=~clk;


initial begin
    $dumpfile("Calculadora.vcd");
    $dumpvars(0, Calculadora_tb);

    $monitor("t=%0d | a=%d b=%d op=%b | c=%d resultado=%d  bcd =%b", 
    $time, a, b, op, c, resultado, bcd);


        clr= 0; guardar= 0;
        a=0; b=0; op=4'b0000;

        @(posedge clk ); #10;
        op= 4'b0000;
        a= 4'b0101; b= 4'b0011; 
        @(posedge clk); #10;
        $display("Suma 5 +3 -> c=%0d  bcd=%0b", c, bcd);

    //guardar
        @(posedge clk ); #10;
        guardar=1;
        @(posedge clk); #10;
        guardar=0;
        $display("Guardar-> resultado=%0d", resultado); 

    // multiplicacion: 3 * 4 = 12
        @(posedge clk); #1;
        a = 4'd3; b = 4'd4; op = 4'b0011;
        @(posedge clk); #1;
        $display("MULT 3*4 -> c=%0d bcd=%b", c, bcd);

    // mostrar resultado guardado via op=0111
        @(posedge clk); #1;
        op = 4'b0111;
        @(posedge clk); #1;
        $display("MOSTRAR GUARDADO -> c=%0d bcd=%b", c, bcd);
    
     // limpiar via op=0110
        @(posedge clk); #1;
        op = 4'b0110;
        @(posedge clk); #1;
        $display("CLR -> resultado=%0d", resultado);

    repeat(3) @(posedge clk);
    $display("===Fin de la simulacion===");
    $finish;

end
     
endmodule     