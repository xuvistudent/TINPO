module ALU (
	input [31:0] a, // src 1
	input [31:0] b, // src 2
	input [2:0] alu_control, // function select
	output reg [31:0] result, // result
	output is_zero);
	
	always @ (*) begin
		case(alu_control) 
			3'b000: result = a + b; // add
			3'b001: result = a - b; // sub
			3'b010: result = a ^ b; // xor
			3'b011: result = a << b; // shift left
			3'b100: result = a >> b; // shift right
			3'b101: result = a & b; // and
			3'b110: result = a | b; // or
			3'b111: begin if (a < b) result = 32'd1;
					else result = 32'd0;
					end
			default: result = a + b; // add for default
		endcase
	end
	assign is_zero = (result == 32'd0) ? 1'b1 : 1'b0;
endmodule
