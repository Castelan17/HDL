# Alu 4bits

This calculator is a union between some basic operators and two new functions. You can use: 
- 0000 as an add
- 0001 as a subtraction
- 0010 as a division
- 0011 as a multiplier
- 0100 as a power

## Aditional 
- 0101 you can save your result
- 0110 you can erase this save
- and 0111 you can show your last saved number

This project includes a BCD converter :D. 

```verilog
VCD info: dumpfile Calculadora.vcd opened for output.
t=20 | a= 5 b= 3 op=0000 | c=  8 resultado=  x  bcd =000000001000
Suma 5 +3 -> c=8  bcd=1000
/////////////////////////////////////////////////////////////////////////////
t=70 | a= 5 b= 3 op=0000 | c=  8 resultado=  8  bcd =000000001000
Guardar-> resultado=8
/////////////////////////////////////////////////////////////////////////////
t=91 | a= 3 b= 4 op=0011 | c= 12 resultado=  8  bcd =000000010010
MULT 3*4 -> c=12 bcd=000000010010
/////////////////////////////////////////////////////////////////////////////
t=131 | a= 3 b= 4 op=0111 | c=  8 resultado=  8  bcd =000000001000
MOSTRAR GUARDADO -> c=8 bcd=000000001000
/////////////////////////////////////////////////////////////////////////////
t=171 | a= 3 b= 4 op=0110 | c=  0 resultado=  8  bcd =000000000000
CLR -> resultado=0
===Fin de la simulacion===
```
> [!NOTE]
> Also you can use a new tool:  https://digitaljs.tilk.eu  Just upload the JSON in this file and you can interac with my design. 
