module mux4_1(
    input wire in1, in2, in3, in4, 
    input wire [1:0] select, 
    output wire out
    );

    always @(*) begin
        case (select)
            2'b00: out = in1;
            2'b00: out = in2;
            2'b00: out = in3;
            2'b00: out = in4;
            default: out = 1'b0;
        endcase
    end

endmodule :mux4_1



/* Una segunda version para crear multiplexores o añadir varios if else sin 
necesitar de escribir mucho es usar l os valores ternierios "?"

condición ? valor_si_verdadero : valor_si_falso

module mux_4x1_b(
input I0,I1,I2,I3,S0,S1,
output Y);

assign Y = S1?(S0?I0:I1):(S0?I2:I3);
                
endmodule


// Ejemplo simple
assign out = select ? a : b;
// Si select=1, out = a; si select=0, out = b

// Equivalente a:
if (select)
    out = a;
else
    out = b;

Se puede anidar para crear lógica más compleja:

// Ejemplo de mux 4:1 convencional
assign Y = (S1 == 0 && S0 == 0) ? I0 :
           (S1 == 0 && S0 == 1) ? I1 :
           (S1 == 1 && S0 == 0) ? I2 : I3;

// O más compacto
assign Y = {S1, S0} == 2'b00 ? I0 :
           {S1, S0} == 2'b01 ? I1 :
           {S1, S0} == 2'b10 ? I2 : I3;

Operador Ternierio vale la pena en:

condicionales simples:
assign out = enable ? data : 1'bz;  // Buffer tri-state

// En lugar de:
always @(*) begin
    if (enable)
        out = data;
    else
        out = 1'bz;
end

// Bueno - para valor por defecto
reg [7:0] data = (reset_value) ? 8'h00 : 8'hFF;


// Bueno - mux 2:1 es ideal para ternario
assign out = select ? input_a : input_b;

// Mux 4:1 todavía aceptable
assign out = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0);


// Bueno - para mostrar mensajes condicionales
$display("Estado: %s", error ? "ERROR" : "OK");


DONDE NO SE DEBE USAR


// MAL - ilegible y propenso a errores
assign out = a ? (b ? (c ? d : e) : (f ? g : h)) : (i ? (j ? k : l) : (m ? n : o));

// BIEN - usar case o if-else
always @(*) begin
    case ({a, b, c})
        3'b000: out = d;
        3'b001: out = e;
        3'b010: out = f;
        // ... más casos
    endcase
end


Lógica con efectos secundarios

// MAL - ternario solo hace una cosa
assign {out1, out2} = sel ? (out1=1, out2=0) : (out1=0, out2=1);  // No funciona

// BIEN - usar if-else
always @(*) begin
    if (sel) begin
        out1 = 1;
        out2 = 0;
    end else begin
        out1 = 0;
        out2 = 1;
    end
end


// MAL - mux 8:1 con ternarios anidados
assign out = s2 ? (s1 ? (s0 ? i7 : i6) : (s0 ? i5 : i4)) : 
                   (s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0));
// ¡5 niveles de anidamiento!

// BIEN - usar case o assign con concatenación
always @(*) begin
    case ({s2, s1, s0})
        3'b000: out = i0;
        3'b001: out = i1;
        // ... todos los casos
    endcase
end

// O incluso mejor para mux grande:
assign out = {i7, i6, i5, i4, i3, i2, i1, i0}[{s2, s1, s0}];


// MAL - condición complicada
assign out = (a & b | c & d & e) ? x : 
             (f & g | h & i) ? y : 
             (j & k) ? z : w;

// BIEN - usar if-else con comentarios
always @(*) begin
    if (a & b | c & d & e)      // Caso prioritario 1
        out = x;
    else if (f & g | h & i)     // Caso prioritario 2
        out = y;
    else if (j & k)              // Caso prioritario 3
        out = z;
    else
        out = w;
end