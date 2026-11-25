#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
mkdir -p build
iverilog -g2012 -o build/adder_sim \
  verilog/full_adder.v verilog/four_bit_adder.v \
  testbench/tb_four_bit_adder.v
vvp build/adder_sim
echo
echo "VCD created at: $ROOT/build/adder.vcd"
if command -v gtkwave >/dev/null 2>&1; then
  gtkwave build/adder.vcd
else
  echo "GTKWave not installed. Install with: sudo apt install gtkwave"
fi
