module Adder (
    input wire a, b, cin,
    output wire s, cout
);

    assign s = (a^b^cin);
    assign cout = ((b&a) | ((b|a) & cin));
    
endmodule