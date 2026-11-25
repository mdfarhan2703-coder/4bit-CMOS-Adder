# MINOR PROJECT 1
# DESIGN OF A 4-BIT ADDER USING CMOS LOGIC

## Project Overview
**Objective:** To design, simulate and lay out a 4-bit adder using CMOS logic.

## Tools Required
- Xschem — schematic editor
- Ngspice — SPICE simulation
- Magic — layout tool
- Netgen — Layout Versus Schematic (LVS)
- Open_PDKs + Sky130 — open-source CMOS process design kit
- Icarus Verilog and GTKWave — RTL simulation and waveform viewing

## Step 1: Environment Setup
Install the prerequisites on Ubuntu:
```bash
sudo apt update
sudo apt install git build-essential ngspice magic xschem netgen iverilog gtkwave
```
Install and configure Open_PDKs with Sky130 according to the supplied handout. Ensure sufficient disk space before building.

## Step 2: Design of 1-bit Full Adder in Xschem
Inputs are A, B and Cin. Outputs are Sum and Cout.
The Sum output is:
`Sum = A XOR B XOR Cin`
The carry output is:
`Cout = (A AND B) OR (B AND Cin) OR (A AND Cin)`
The logic functions are to be implemented using PMOS and NMOS CMOS transistor networks. Save the cell as `full_adder_1bit.sch`.

## Step 3: Hierarchical 4-bit Adder Design
Four 1-bit full adders are connected in cascade. The carry output of each stage is connected to the carry input of the next stage. The first stage receives external Cin and the fourth stage produces Carry_out.
Save the top-level schematic as `adder_4bit.sch`.

## Verilog Design
The project includes `full_adder.v` and `four_bit_adder.v`. The four-bit design instantiates four one-bit full adders in a ripple-carry arrangement.

## Verilog Simulation
The self-checking testbench is `tb_four_bit_adder.v`. Run it using:
```bash
iverilog -g2012 -o adder_sim verilog/full_adder.v verilog/four_bit_adder.v testbench/tb_four_bit_adder.v
vvp adder_sim
gtkwave build/adder.vcd
```
Alternatively run `./scripts/run_verilog.sh`.

## Test Cases and Expected Results
| Test | A | B | Cin | Cout | Sum | Decimal total |
|---|---|---|---:|---:|---:|---:|
| 1 | 0001 | 0011 | 0 | 0 | 0100 | 4 |
| 2 | 0101 | 0110 | 1 | 0 | 1100 | 12 |
| 3 | 1111 | 1111 | 0 | 1 | 1110 | 30 |
| 4 | 0000 | 0000 | 0 | 0 | 0000 | 0 |
| 5 | 1111 | 1111 | 1 | 1 | 1111 | 31 |

**Correction to supplied handout:** Test Case 2 in the handout states Sum=1000 and Cout=1. The arithmetic is 5+6+1=12, so the correct 5-bit result is `01100`, i.e. Cout=0 and Sum=1100.

## Learning Outcomes
- CMOS Logic: understand PMOS/NMOS implementation of logic gates.
- Simulation Skills: verify digital behavior using simulation.
- Layout Skills: translate a schematic into physical layout and perform DRC/LVS.
- Tool Proficiency: gain experience with open-source EDA tools.

## Completion / Verification Status
The supplied archive includes the RTL design, testbench, expected results, schematic construction guide and report draft. Actual Xschem transistor-level schematic capture, Sky130 Ngspice simulation, Magic layout/DRC and Netgen LVS must be completed and captured on the target Ubuntu installation. Do not report these physical-design stages as verified until the tools have produced successful results.
