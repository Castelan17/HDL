module MC_2bit (

    input wire a0, a1, b0, b1,
    output wire c, // A<B
    output wire d, // A>B
    output wire e  // A=B

);

wire f, g;

assign f = ~(a1 ^ b1);
assign g = ~(a0 ^ b0);

assign c = (~a1 & b1) | (~a0 & b0 & f);
assign d = (a0 & ~b0 & f) | (a1 & ~b1);
assign e = (f & g);
   
endmodule