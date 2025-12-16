`timescale 1ns / 1ps

module alu_tb;
    parameter width = 4;

    reg  [width-1:0] A;
    reg  [width-1:0] B;
    reg  [2:0] Sel;
    wire [width-1:0] Y;
    wire [4:0] flags;

    Alu dut (.A(A), .B(B), .Sel(Sel), .Y(Y), .flags(flags));
    
    // -------------------------
    // Test sequence
    // -------------------------
    initial begin
        A = {width{1'b0}};
        B = {width{1'b0}};
        Sel = 3'b000;
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);
        $monitor("Time=%0d A=%b B=%b Sel=%b => Y=%b Flags=%b", $time, A, B, Sel, Y, flags);
        #10;
        // ADDITION
        A = 4'd5;  B = 4'd3;  Sel = 3'b000;  // 5 + 3 = 8
        #10;
        A = 4'd7;  B = 4'd9;  Sel = 3'b000;  // overflow case
        #10;
        // SUBTRACTION
        A = 4'd8;  B = 4'd3;  Sel = 3'b001;  // 8 - 3 = 5
        #10;
        A = 4'd3;  B = 4'd5;  Sel = 3'b001;  // borrow case
        #10;
        // LOGICAL OPERATIONS
        A = 4'b1010; B = 4'b1100; 
        Sel = 3'b010; // AND
        #10;
        Sel = 3'b011; // OR
        #10;
        Sel = 3'b100; // XOR
        #10;
        Sel = 3'b101; // NOT A
        #10;
        // SHIFT OPERATIONS
        A = 4'b0011; B = 4'd1;
        Sel = 3'b110; // left shift
        #10;
        Sel = 3'b111; // right shift
        #10; $finish;
    end

endmodule
