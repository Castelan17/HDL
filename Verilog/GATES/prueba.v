module prueba (
    input wire a,
    input wire b,
    output wire y_and,
    output wire y_or,
    output wire y_xor,
    output wire y_not,
    output wire y_nand,
    output wire y_nor,
    output wire y_xnor

);
    
assign y_and = a & b; 

assign y_or = a | b;

assign y_xor = a ^ b; // alt+94= ^

assign y_not = ~a; // alt+126

assign y_nand = ~(a & b);

assign y_nor = ~(a | b);

assign y_xnor = ~(a ^ b);


endmodule




/*
module eql(
    input wire i0, i1,
    output wire eq
);

    wire p0, p1;

    assign eq = p0 |p1;

    assign p0 = -i0 & -i1;

    assign p1= i0 & i1;

endmodule*/