module reg_file (
    input  wire        clk,
    input  wire        we,           // write enable
    input  wire [3:0]  raddr1,
    input  wire [3:0]  raddr2,
    input  wire [3:0]  waddr,
    input  wire [7:0]  wdata,
    output wire [7:0]  rdata1,
    output wire [7:0]  rdata2
);
    reg [7:0] mem [15:0];

    // Write on falling edge (as per your brief/notes)
    always @(negedge clk) begin
        if (we) mem[waddr] <= wdata;
    end

    // Dual async reads
    assign rdata1 = mem[raddr1];
    assign rdata2 = mem[raddr2];
endmodule
