module MC_2bit (

    input wire a0, a1, b0, b1,
    output wire  c, d, e, f, g

);


assign c = (~a1 & b1) | (~a0 & b0 & f);

assign f = ~(a1 ^ b1);

assign g = ~(a0 ^ b0);

assign e = (f & g);

assign d = (a0 & ~b0 & f) | (a1 & ~b1);

    
endmodule