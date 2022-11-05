module sigdelay #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input logic                     clk,
    input logic                     rst,
    input logic                     en,
    input logic                     wr_en,
    input logic                     rd_en,
    input logic [DATA_WIDTH-1:0]    incr,
    input logic [DATA_WIDTH-1:0]    offset,
    input logic [DATA_WIDTH-1:0]    din, // mic_signal
    output logic [DATA_WIDTH-1:0]   dout // delayed_signal
);

logic [ADDRESS_WIDTH-1:0]     address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

ram2ports #(.ADDRESS_WIDTH(9)) sineram (
    .clk (clk),
    .wr_addr (address),
    .rd_addr (address+offset),
    .wr_en (wr_en),
    .rd_en (rd_en),
    .din (din),
    .dout (dout)
);

endmodule
