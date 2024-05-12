//Contains params

localparam  ADD = 3'b000,
            SUB = 3'b001,
            ASL = 3'b010,
            ASR = 3'b011,
            SL = 3'b100,
            SR = 3'b101,
            MUL = 3'b110,
            DIV = 3'b111;

localparam  INF = 16'h7C00,
            NaN = 16'h7E00;