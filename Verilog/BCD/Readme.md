# BCD Converter — Double Dabble

Trying to understand BCD, I found a useful algorithm: **Double Dabble**.
It converts a binary number into BCD (Binary Coded Decimal) digit by digit.
```
bin = 11111111  →  BCD = 0010 0101 0101  →  "255"
```

I found different implementations. I prefer the FSM (sequential) approach.
I studied the algorithm from the video below and used its code as reference,
but I wrote the testbench myself.

## What I learned

**`posedge`** — triggers when a signal rises from 0 to 1:
```
clk: _____┌──┐_________┌──┐____
          ↑            ↑
        posedge      posedge
```

**`@`** — pauses execution until an event occurs:
```verilog
@(posedge clk);  // wait for clock rising edge
@(posedge rdy);  // wait until the module signals it's done
```

## Simulation output
```
t=0 | en=0 bin_d_in=000000000000 | bin_d_out=0000000000000000 rdy=0
t=11000   | en=1 bin_d_in=000011111111 | bin_d_out=0000000000000000 rdy=0
t=550000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000000001 rdy=0
t=650000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000000011 rdy=0
t=750000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000000111 rdy=0
t=770000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000001010 rdy=0
t=850000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000010101 rdy=0
t=870000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000011000 rdy=0
t=950000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000110001 rdy=0
t=1050000 | en=1 bin_d_in=000011111111 | bin_d_out=0000000001100011 rdy=0
t=1090000 | en=1 bin_d_in=000011111111 | bin_d_out=0000000010010011 rdy=0
t=1150000 | en=1 bin_d_in=000011111111 | bin_d_out=0000000100100111 rdy=0
t=1170000 | en=1 bin_d_in=000011111111 | bin_d_out=0000000100101010 rdy=0
t=1250000 | en=1 bin_d_in=000011111111 | bin_d_out=0000001001010101 rdy=0
TEST 255 A BCD: 0255 (esperando: 0255)
t=1270000 | en=1 bin_d_in=000011111111 | bin_d_out=0000001001010101 rdy=1
t=1290000 | en=1 bin_d_in=000011111111 | bin_d_out=0000001001010101 rdy=0
t=1291000 | en=0 bin_d_in=000011111111 | bin_d_out=0000001001010101 rdy=0
===Fin de la simulacion===

```

## Result

| Input (binary) | Output (BCD) | Decimal |
|---|---|---|
| 000011111111 | 0000 0010 0101 0101 | 255 |

## Reference
- [Video title here](https://www.youtube.com/watch?v=Q-hOCVVd7Lk)
