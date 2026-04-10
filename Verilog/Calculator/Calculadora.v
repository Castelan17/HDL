`timescale 1ns/1ps

module calculadora(
    input clk,
    input clr,
    input guardar,
    input [3:0] op,
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] c,
    output reg [7:0] resultado,
    output reg [11:0] bcd

);

integer i;


wire guardar_i = (op== 4'b0101);
wire clr_i =     (op== 4'b0110);

always @(*)
    begin
        case (op)

            4'b0000 : c= a + b; 
            4'b0001 : c= a - b;
            4'b0010 : c= a / b;
            4'b0011 : c= a * b;
            4'b0100 : c= a ** b;
            4'b0111 : c= resultado;
            default : c= 8'b0;

        endcase


    end



always @(*)
    
    begin
        bcd=0;

            for (i =0; i < 8; i= i+1 ) begin
                

                //verificacion 
                if(bcd[3:0] > 4)
                    bcd[3:0] = bcd[3:0]+3;
                if(bcd[7:4] > 4)
                    bcd[7:4] = bcd[7:4]+3;
                if(bcd[11:8] > 4)
                    bcd[11:8] = bcd[11:8]+3;
              
              //primer shift 
                bcd= {bcd[10:0], c[7-i]};

            end

    end

always @(posedge clk) begin

    if(clr || clr_i)
        resultado <= 8'b0;
    else if(guardar || guardar_i)
        resultado <= c;
        
end

endmodule
