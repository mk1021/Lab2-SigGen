module sinegen #(
    parameter       A_WIDTH = 8,
                    D_WIDTH = 8
)(
    // interface signals
    input logic                 clk,   // clock
    input logic                 rst,   // reset
    input logic                 en,    // enable
    input logic [D_WIDTH-1:0]   incr,  // increment for addr counter
    input logic [D_WIDTH-1:0]   offset,// offset between two sine waves
    output logic [D_WIDTH-1:0]  dout1, // output data1
    output logic [D_WIDTH-1:0]  dout2 // output data2
);

    logic [A_WIDTH-1:0]     address1;    // interconnect wire

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address1)
);

rom sineRom (
    .clk (clk),
    .addr1 (address1),
    .dout1 (dout1),
    .addr2 (address1+offset),
    .dout2 (dout2)
);

endmodule
