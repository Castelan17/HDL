module chip7458 (
    input wire p1a, p2a, p2b, p2c, p2d, p1c, p1b, p1f, p1e, p1d,
    output wire p2y, p1y
);
   
assign p2y = (p2a & p2b) | (p2c & p2d );

assign p1y = (p1c & p1b & p1a) | (p1f & p1e & p1d  );

endmodule