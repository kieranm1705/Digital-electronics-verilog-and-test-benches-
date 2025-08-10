module mux4 (
    input  wire a, b, c, d,
    input  wire sel0, sel1,
    output wire y
);
    assign y = (sel1 == 1'b0 && sel0 == 1'b0) ? a :
               (sel1 == 1'b0 && sel0 == 1'b1) ? b :
               (sel1 == 1'b1 && sel0 == 1'b0) ? c :
                                               d;
endmodule
