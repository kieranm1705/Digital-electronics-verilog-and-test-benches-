module alu_1bit (
    input  wire a,
    input  wire b,
    input  wire cin,           // carry in for ADD/SUB chain
    input  wire [1:0] op,      // 00:ADD 01:SUB 10:AND 11:OR
    output wire result,
    output wire cout
);
    // For SUB, invert b; for ADD leave as is. Logic ops ignore adder.
    wire binvert = (op == 2'b01);
    wire b_eff   = binvert ? ~b : b;

    wire sum, cadd;
    assign {cadd, sum} = a + b_eff + cin;

    assign result = (op == 2'b10) ? (a & b) :
                    (op == 2'b11) ? (a | b) :
                                    sum;

    assign cout = (op[1] == 1'b1) ? 1'b0 : cadd; // logic ops -> cout=0
endmodule
