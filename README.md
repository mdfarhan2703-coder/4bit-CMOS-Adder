# Minor Project 1: Design of a 4-bit Adder Using CMOS Logic

This package follows the supplied 7-page project handout:
1. Environment setup
2. 1-bit full-adder design
3. Hierarchical 4-bit ripple-carry adder
4. Verilog simulation and GTKWave
5. Learning outcomes and five test cases

## Important scope note
The Verilog RTL and testbench are complete and self-checking. The Xschem directory contains design guidance and port/net naming references; a native transistor-level Xschem schematic, Sky130 PDK installation, Magic layout, DRC and Netgen LVS must still be generated/run in the user's installed EDA environment. They are not represented as completed or verified in this archive.

## Files
- `verilog/full_adder.v` — 1-bit full adder
- `verilog/four_bit_adder.v` — four cascaded full adders
- `testbench/tb_four_bit_adder.v` — five self-checking tests
- `ngspice/README.md` — how to proceed with transistor-level simulation
- `xschem/SCHEMATIC_GUIDE.md` — exact Xschem ports and carry connections
- `diagrams/` — SVG block diagrams
- `report/Project_Report.md` — editable report draft
- `scripts/run_verilog.sh` — compile, simulate and open GTKWave

## Run on Ubuntu
Install lightweight tools if needed:
```bash
sudo apt update
sudo apt install iverilog gtkwave
```
From this project directory:
```bash
chmod +x scripts/run_verilog.sh
./scripts/run_verilog.sh
```
The simulation creates `build/adder.vcd` and prints PASS/FAIL for all five tests.

## PDF handout correction
Handout Test Case 2 gives A=5, B=6, Cin=1 but lists Sum=1000 and Cout=1. That is arithmetically incorrect:
5 + 6 + 1 = 12 = 0b01100, hence 4-bit Sum=1100 and Cout=0.
Handout Test Case 5 says 15+15+1=31 and shows Sum=1111, Cout=1; correct.
