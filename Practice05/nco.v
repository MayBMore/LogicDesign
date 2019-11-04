// Numerical Controlled Oscillator
module nco (	clk_1hz,
		num,
		clk,
		rst_n);

output		clk_1hz	;	// 1Hz CLK

input	[31:0]	num	;	//50Mhz CLK
input		clk	;
input		rst_n	;

reg	[31:0]	cnt	;
reg		clk_1hz	;

always	@(posedge clk or negedge rst_n) begin
		if(rst_n == 1'b0) begin
			cnt	<=	32'd0	;
			clk_1hz	<=	1'd0	;
		end else begin
			if(cnt >= num/2-1) begin
				cnt	<= 32'd0	;
				clk_1hz	<= ~clk_1hz	;
			end else begin
				cnt	<= cnt + 1'b1	;
			end
		end
end

endmodule

module top_cnt(	out,
		num,
		clk,
		rst_n);

output	[5:0]	out	;

input	[31:0]	num	;
input		clk	;
input		rst_n	;

wire		clk_1hz	;

nco	u_nco(	.clk_1hz	( clk_1hz	),
		.num		( num		),
		.clk		( clk		),
		.rst_n		( rst_n		));

cnt6	u_cnt6(	.out		( out		),
		.clk		( clk_1hz	),
		.rst_n		( rst_n		));

endmodule

