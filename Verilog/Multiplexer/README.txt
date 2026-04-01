# Basic Multiplexer 2-1 and 4-1 in Verilog

## Project Structure
```
├── multiplexer.v        # Main module with all gate implementations
├── multiplexer_tb.v     # Testbench for simulation
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
