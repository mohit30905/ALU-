module addition (A,B,Y,flags); // 4-bit ripple carry adder
    parameter width = 4;

    input [width-1:0] A;
    input [width-1:0] B;
    output [width-1:0] Y;
    output [4:0] flags; // flags[4]: sign, flags[3]: zero, flags[2]: overflow, flags[1]: parity, flags[0]: carry
    wire   [width:0] c;
    assign c[0]=1'b0;

    genvar i;
    generate
        for (i = 0; i < width; i = i + 1) begin : GEN_FA
            full_adder fa0 (.a(A[i]), .b(B[i]), .cin(c[i]), .sum(Y[i]), .cout(c[i+1]));
        end
    endgenerate

    assign flags[0] = c[width]; // Carry flag
    assign flags[1] = ^Y; // Parity flag
    assign flags[2] = (A[width-1] & B[width-1] & ~Y[width-1]) | (~A[width-1] & ~B[width-1] & Y[width-1]); // Overflow flag
    assign flags[3] = ~|Y; // Zero flag
    assign flags[4] = Y[width-1]; // Sign flag
endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module subtraction (A,B,Y,flag); // 4-bit subtractor using addition
    parameter width = 4;

    input [width-1:0] A;
    input [width-1:0] B;
    output [width-1:0] Y;
    output [4:0] flag; // flags[4]: sign, flags[3]: zero, flags[2]: overflow, flags[1]: parity, flags[0]: carry

    wire [width-1:0] B_complement;
    wire [4:0] temp_flags;

    assign B_complement = ~B + 1; // Two's complement for subtraction
    addition add_inst (.A(A), .B(B_complement), .Y(Y), .flags(temp_flags));
    assign flag= temp_flags;
    assign flag[0] = ~temp_flags[0]; // borrow is inverse of carry
endmodule