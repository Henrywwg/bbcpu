
'import ALUparams.sv;
module fp_alu(
    input clk,
    input rst_n,
    input sop,
    input [2:0]op,
    input [15:0]fpA,
    input [15:0]fpB,
    output logic [15:0]fpOut,
    output logic rdy,
    output logic flags[4:0]
);

typedef enum logic [1:0]{IDLE, SCOP, MTP, DVD} state_t;
state_t state, nxt_state;

//Internal signals
logic op_finished, genop;
logic [15:0]fpInt;

/////////////
//  fpOut  //
/////////////
always_ff @(posedge clk, negedge rst_n) begin
    if(!rst_n)
        fpOut <= NaN;//default to NaN
    else if(op_finished) begin
        fpOut = fpInt;
    end

end


/////////////////
//  rdy logic  //
/////////////////
always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        rdy <= 0;
    else if(sop)
        rdy <= 0;
    else if(op_finished)
        rdy <= 1;

///////////////////
//  SM FF logic  //
///////////////////
always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
        state <= IDLE;
    else
        state <= nxt_state;

/////////////////////
//  SM comb logic  //
/////////////////////
always_comb begin
    //default signals
    rdy = 0;
    fpInt = '0;
    op_finished = 0;
    nxt_state = state;


    case(state)
        IDLE: begin
            if(sop)
                case(op)
                    MUL:
                    DIV:
                    default: begin 
                        case(op)
                            ADD: fpInt = A + B; 
                            SUB: fpInt = A - B;
                            default: fpInt = NaN;
                        endcase
                        op_finished = 1;
                    end
                endcase
        end

end



endmodule