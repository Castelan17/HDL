module MC_1bit (
    input wire a, b,
    output wire c, 
    output wire d, 
    output wire e
);
 
     assign c = (~a & b);
     assign e = (~b & a);
     assign d = ~(c | e );


    
endmodule