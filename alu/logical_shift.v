module logical_operations (A, B, Y, operation);
    parameter width = 4;
    input [width-1:0] A;
    input [width-1:0] B;
    input [2:0] operation; // 010: AND, 011: OR, 100: XOR, 101: NOT A
    output reg [width-1:0] Y;

    always @(*) begin
        case (operation)
            3'b010: Y = A & B; // AND
            3'b011: Y = A | B; // OR
            3'b100: Y = A ^ B; // XOR
            3'b101: Y = ~A;    // NOT A
            default: Y = {width{1'b0}};
        endcase
    end

endmodule

module shift_operations (A, B,Y, direction);
    parameter width = 4;
    input [width-1:0] A;
    input [width-1:0] B;
    input [2:0] direction; // 110: left shift, 111: right shift
    output reg [width-1:0] Y;

    always @(*) begin
        if (direction == 3'b110) begin
            Y = A << B; // Left shift
        end
        else if (direction == 3'b111) begin
            Y = A >> B; // Right shift
        end
        else begin
            Y = {width{1'b0}};
        end
    end


endmodule
