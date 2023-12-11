`include "Parameter.v"
module DataMemory(
	input clk,
	// Address input port
	input [7:0] mem_access_addr,
	// Write port
	input [31:0] mem_write_data,
	input mem_write_en,
	// Read port
	input mem_read,
	output [31:0] mem_read_data);
	
	reg [`col - 1:0] memory [`row_d - 1:0];
	integer i;
	initial begin
		for(i = 0; i < 256; i = i + 1)
			memory[i] = 32'd0;
	end
	always @ (posedge clk) begin
		if (mem_write_en) begin
			memory[mem_access_addr] = mem_write_data;
		end
	end
	assign mem_read_data = (mem_read == 1'b1) ? memory[mem_access_addr] : 32'b0;

endmodule
