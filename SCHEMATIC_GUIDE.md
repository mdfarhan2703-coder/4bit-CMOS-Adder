# Xschem schematic construction guide (handout Step 2 and Step 3)

## 1-bit cell: `full_adder_1bit.sch`
Ports:
- Inputs: `A`, `B`, `Cin`
- Outputs: `Sum`, `Cout`

Boolean equations:
- `X1 = A XOR B`
- `Sum = X1 XOR Cin`
- `Cout = (A AND B) OR (B AND Cin) OR (A AND Cin)`

Implement the XOR, AND and OR functions using PMOS/NMOS CMOS transistor networks as required by the handout. Label every pin and save as `full_adder_1bit.sch`.

## 4-bit top cell: `adder_4bit.sch`
Instantiate four copies of `full_adder_1bit`:
- FA0: A[0], B[0], Cin -> Sum[0], c1
- FA1: A[1], B[1], c1 -> Sum[1], c2
- FA2: A[2], B[2], c2 -> Sum[2], c3
- FA3: A[3], B[3], c3 -> Sum[3], Carry_out

Top-level inputs: `A[3:0]`, `B[3:0]`, `Cin`
Top-level outputs: `Sum[3:0]`, `Carry_out`

The exact transistor symbol names and model properties depend on the installed Sky130 PDK library. Do not substitute generic symbols and claim Sky130 DRC/LVS success.
