module MC_4bit (

    input wire a0, a1, a2, a3, b0, b1, b2, b3,
    output wire c, // A<B
    output wire d, // A>B
    output wire e  // A=B

);

wire f, g, h, j;

assign j = ~(a3 ^ b3);
assign h = ~(a2 ^ b2);
assign f = ~(a1 ^ b1);
assign g = ~(a0 ^ b0);


assign d = (f & h & j & ~b0 & a0) | (j & h & ~b1 & a1) | (j &  ~b2 & a2) | (~b3 & a3);
assign c = (b3 & ~a3) | (b2 & ~a2 & j) | (b1 & ~a1 & h & j) | (b0 & ~a0 & j & h & f);
assign e = (f & g & h & j);
   
endmodule