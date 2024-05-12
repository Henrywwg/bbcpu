//////////////////////////////////////////////
// Title: register file
// Sets up 7 gpr and 1 instruction register
//////////////////////////////////////////////

module register_file(
    input clk,
    input rst_n,
    input we,
    input [2:0]waddr,
    input [15:0]dataIn,
    output logic [15:0]gpr1, //general purpose registers
    output logic [15:0]gpr2, //
    output logic [15:0]gpr3, //
    output logic [15:0]gpr4, //
    output logic [15:0]gpr5, //
    output logic [15:0]gpr6, //
    output logic [15:0]gpr7, //end of gpr
    output logic [15:0]ir    //Register holding current instruction
);

//Setup general purpose registers
// reset to 0 otherwise get dataIn if selected
always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr1 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b000)
        gpr1 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr2 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b001)
        gpr2 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr3 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b010)
        gpr3 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr4 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b011)
        gpr4 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr5 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b100)
        gpr5 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr6 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b101)
        gpr6 <= dataIn; 

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        gpr7 <= 16'h0000;  //clear on reset
    else if(waddr == 3'b110)
        gpr7 <= dataIn; 

////////////////////////
//Instruction register//
////////////////////////
always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        ir <= 16'h0000;  //clear on reset
    else if(waddr == 3'b111)
        ir <= dataIn; 

endmodule