module ALU_Control (
	output reg [2:0] ALU_Cnt,
	input [6:0] funct7,
	input [2:0] funct3, 
	input [6:0] opcode);

	always @ (*) begin
		case(opcode)
			7'b0000011:	begin // Lxx
				ALU_Cnt = 3'b000; 
			end
			7'b0010011:	begin
				case(funct3)
					3'b000:	ALU_Cnt = 3'b000; // ADDI
					3'b001:	ALU_Cnt = 3'b011; // SLLI
					3'b010:	ALU_Cnt = 3'b111; // SLTI
					3'b011:	ALU_Cnt = 3'b111; // SLTIU
					3'b100:	ALU_Cnt = 3'b010; // XORI
					3'b101:	ALU_Cnt = 3'b100; // SRLI, SRAI
					3'b110:	ALU_Cnt = 3'b110; // ORI
					3'b111:	ALU_Cnt = 3'b101; // ANDI
				endcase
			end
			7'b0010111:	ALU_Cnt = 3'b000; // add upper immediate pc
			7'b0100011:	begin // S-type
				ALU_Cnt = 3'b000;
			end
			7'b0110011:	// R-type
				case(funct3)
					3'b000: begin
						case(funct7)
							7'b0000000: ALU_Cnt = 3'b000; // add
							7'b0100000: ALU_Cnt = 3'b001; // sub
						endcase
					end
					3'b001: ALU_Cnt = 3'b011; // shift left logical
					3'b010: ALU_Cnt = 3'b111; // set less than
					3'b011: ALU_Cnt = 3'b111; // set less than unsigned
					3'b100: ALU_Cnt = 3'b010; // xor
					3'b101: begin
						case(funct7)
							7'b0000000: ALU_Cnt = 3'b100; // shift right logical
							7'b0100000: ALU_Cnt = 3'b100; // shift right arimethic
						endcase
					end
					3'b110: ALU_Cnt = 3'b110; // or
					3'b111: ALU_Cnt = 3'b111; // and
				endcase
			7'b0110111: ALU_Cnt = 3'b000;// load upper immediate (dont care about the arithmetic)
		endcase
	end

endmodule
