module Adder_4bits(
    input wire [3:0] a, b,
    input wire cin,
    output wire [3:0] s,
    output wire cout
);


wire c1, c2, c3;

Adder fa0(a[0], b[0], cin, s[0],  c1);
Adder fa1(a[1], b[1], c1,  s[1],  c2);
Adder fa2(a[2], b[2], c2,  s[2],  c3);
Adder fa3(a[3], b[3], c3,  s[3],  cout);

endmodule

