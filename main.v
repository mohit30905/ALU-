module Alu #(
    parameter width = 4
)(
    
    input  [width-1:0] A,
    input  [width-1:0] B,
    input  [2:0] Sel,
    output reg [width-1:0] Y,
    output reg [4:0] flags   // [4]=sign, [3]=zero, [2]=overflow, [1]=parity, [0]=carry/borrow
);

    // -------------------------
    // Internal wires
    // -------------------------
    wire [width-1:0] add_result;
    wire [4:0] add_flags;

    wire [width-1:0] sub_result;
    wire [4:0] sub_flags;

    wire [width-1:0] logic_result;
    wire [width-1:0] shift_result;
    // -------------------------
    // Submodule instantiations
    // -------------------------
    addition #(.width(width)) add_inst (
        .A(A),
        .B(B),
        .Y(add_result),
        .flags(add_flags)
    );

    subtraction #(.width(width)) sub_inst (
        .A(A),
        .B(B),
        .Y(sub_result),
        .flag(sub_flags)
    );

    logical_operations #(.width(width)) log_inst (
        .A(A),
        .B(B),
        .operation(Sel),
        .Y(logic_result)
    );

    shift_operations #(.width(width)) shift_inst (
        .A(A),
        .B(B),
        .direction(Sel),
        .Y(shift_result)
    );

    // -------------------------
    // ALU select logic
    // -------------------------
    always @(*) begin
        // defaults
        Y = {width{1'b0}};
        flags = 5'b00000;

        case (Sel)
            3'b000: begin // ADD
                Y = add_result;
                flags = add_flags;
            end

            3'b001: begin // SUB
                Y = sub_result;
                flags = sub_flags;
            end

            3'b010, 3'b011, 3'b100, 3'b101: begin // LOGIC
                Y = logic_result;
                flags[4]= Y[width-1];               // sign
                flags[3]= ~|Y;      // zero
                flags[1]= ^Y;                  // parity
            end

            3'b110, 3'b111: begin // SHIFT
                Y = shift_result;
                flags[4]= Y[width-1];               // sign
                flags[3]= ~|Y;      // zero
                flags[1]= ^Y;                  // parity
            end
        endcase
    end

endmodule
