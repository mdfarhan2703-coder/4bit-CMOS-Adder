`timescale 1ns/1ps
module tb_four_bit_adder;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;
    integer pass_count = 0;
    integer fail_count = 0;

    four_bit_adder uut (
        .A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout)
    );

    task check;
        input [3:0] a_in, b_in;
        input       cin_in;
        input [4:0] expected;
        begin
            A = a_in; B = b_in; Cin = cin_in;
            #10;
            if ({Cout, Sum} === expected) begin
                $display("PASS A=%b B=%b Cin=%b => Cout=%b Sum=%b",
                         A, B, Cin, Cout, Sum);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL A=%b B=%b Cin=%b => got %b_%b expected %b",
                         A, B, Cin, Cout, Sum, expected);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("build/adder.vcd");
        $dumpvars(0, tb_four_bit_adder);

        // Test Case 1: 1 + 3 + 0 = 4
        check(4'b0001, 4'b0011, 1'b0, 5'b00100);
        // Test Case 2: 5 + 6 + 1 = 12 (corrected arithmetic)
        check(4'b0101, 4'b0110, 1'b1, 5'b01100);
        // Test Case 3: 15 + 15 + 0 = 30
        check(4'b1111, 4'b1111, 1'b0, 5'b11110);
        // Test Case 4: 0 + 0 + 0 = 0
        check(4'b0000, 4'b0000, 1'b0, 5'b00000);
        // Test Case 5: 15 + 15 + 1 = 31
        check(4'b1111, 4'b1111, 1'b1, 5'b11111);

        $display("--------------------------------");
        $display("TOTAL PASS=%0d FAIL=%0d", pass_count, fail_count);
        $finish;
    end
endmodule
