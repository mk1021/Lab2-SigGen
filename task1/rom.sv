module sreg4 (
    input logic    clk,      // input clock
    input logic    rst,      // reset
    input logic    data_in,  // serial data in
    input logic    data_out  // serial data out
); 
// End of port list

    logic [4:1]    sreg;     // shift register

    always_ff @ (posedge ck)
        if (rst)
            sreg <= 4'b0;
        else begin 
            sreg[4] <= sreg[3];
            sreg[3] <= sreg[2];
            sreg[2] <= sreg[1];
            sreg[1] <= data_in;
        end
    assign data_out = sreg[4];

endmodule
