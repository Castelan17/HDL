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
t=0      | en=0 bin_d_in=000000000000 | bin_d_out=0000000000000000 rdy=0
t=11000  | en=1 bin_d_in=000011111111 | bin_d_out=0000000000000000 rdy=0
...
TEST 255 A BCD: 0255 (esperando: 0255)
t=1270000 | en=1 bin_d_in=000011111111 | bin_d_out=0000001001010101 rdy=1
===Fin de la simulacion===
```

## Result

| Input (binary) | Output (BCD) | Decimal |
|---|---|---|
| 000011111111 | 0000 0010 0101 0101 | 255 |

## Reference
- [Video title here](https://www.youtube.com/watch?v=Q-hOCVVd7Lk)
