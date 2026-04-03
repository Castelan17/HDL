# Basic Logic Gates in Verilog

Implementation of fundamental logic gates using Verilog HDL, simulated with Icarus Verilog and GTKWave.

## Gates Implemented
- AND
- OR
- XOR
- NOT
- NAND
- NOR
- XNOR

## Project Structure
```
├── prueba.v        # Main module with all gate implementations
├── prueba_tb.v     # Testbench for simulation
```

## Tools Used
- Icarus Verilog (compilation & simulation)
- GTKWave (waveform visualization)

## How to Run
```bash
# Compile
iverilog -o Compuertas.vvp prueba.v prueba_tb.v

# Simulate
vvp Compuertas.vvp

# View waveforms
gtkwave sim.vcd
```

## Board
Tang Nano 9K (Gowin FPGA)
