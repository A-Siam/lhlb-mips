module maindec(input logic [5:0] op,
    output logic memtoreg, memwrite,
    output logic branch, 
    output logic [1:0] alusrc,
    output logic regdst, regwrite,
    output logic jump,
    output logic ne,
    output logic half,
    output logic b,
    output logic [1:0] aluop);

logic [11:0] controls;

assign {regwrite, regdst, alusrc, branch, memwrite,
        memtoreg, jump, aluop, ne,half, b} = controls;


always_comb
    case(op)
        6'b000000: controls <= 13'b1100000010000; // RTYPE
        6'b100011: controls <= 13'b1001001000000; // LW
        6'b101011: controls <= 13'b0001010000000; // SW
        6'b000100: controls <= 13'b0000100001000; // BEQ
        6'b001000: controls <= 13'b1001000000000; // ADDI
        6'b001101: controls <= 13'b1011000011000; // ORI
        6'b000010: controls <= 13'b0000000100000; // J
        6'b000101: controls <= 13'b0000100001100;  // BNQ
        6'b100001: controls <= 13'b1001001000010; // LH
        6'b100000: controls <= 13'b1001001000011; // LB
        default: controls <= 13'bxxxxxxxxxxxxx; // illegal op
    endcase
endmodule