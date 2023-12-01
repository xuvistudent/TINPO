module RegisterFiles (
	input clk,
	// Write
	input reg_write_en,
	input [4:0] reg_write_dest,
	input [31:0] reg_write_data,
	// Read port 1
	input [4:0] reg_read_addr_1,
	output [31:0] reg_read_data_1,
	// Read port 2
	input [4:0] reg_read_addr_2,
	output [31:0] reg_read_data_2);
	
	reg [31:0] reg_array [31:0];
	integer i;
	// Write port
	// Reg [4:0] i
	initial begin
		for (i = 0; i < 32; i = i + 1)
			reg_array[i] = 32'd0;
	end
	always @ (posedge clk) begin
		if (reg_write_en) begin
			reg_array[reg_write_dest] <= reg_write_data;
		end
	end
	
	assign reg_read_data_1 = reg_array[reg_read_addr_1];
	assign reg_read_data_2 = reg_array[reg_read_addr_2];

endmodule
