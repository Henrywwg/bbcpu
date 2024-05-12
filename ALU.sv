'import ALUparams.sv;
module alu(
    input clk,
    input rst_n,
    input sop,
    input [2:0]op, //cmd contains the operation to perform
    input [15:0]A,
    input [15:0]B,
    output logic [15:0]out,
    output logic Cout,
    output rdy
);

endmodule