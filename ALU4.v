module alu_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [1:0] op,         // 00:ADD 01:SUB 10:AND 11:OR
    output wire [3:0] result,
    output wire cout
);
    wire [3:0] c;                 // internal carries
    wire cin0 = (op == 2'b01);    // SUB starts with cin=1, ADD cin=0

    alu_1bit u0 (.a(a[0]), .b(b[0]), .cin(cin0), .op(op), .result(result[0]), .cout(c[0]));
    alu_1bit u1 (.a(a[1]), .b(b[1]), .cin(c[0]), .op(op), .result(result[1]), .cout(c[1]));
    alu_1bit u2 (.a(a[2]), .b(b[2]), .cin(c[1]), .op(op), .result(result[2]), .cout(c[2]));
    alu_1bit u3 (.a(a[3]), .b(b[3]), .cin(c[2]), .op(op), .result(result[3]), .cout(cout));
endmodule
