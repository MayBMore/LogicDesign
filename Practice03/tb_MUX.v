module	tb_MUX	;

reg	in0	;
reg	in1	;
reg	sel	;

wire	out1	;

wire	out2	;

wire	out3	;

mux2to1_cond	dut_1(	.in0	(in0),
			.in1	(in1),
			.sel	(sel),
			.out	(out1));


mux2to1_if	dut_2(	.in0	(in0),
			.in1	(in1),
			.sel	(sel),
			.out	(out2));

mux2to1_case	dut_3(	.in0	(in0),
			.in1	(in1),
			.sel	(sel),
			.out	(out3));

initial begin
	$display("Conditional Expression	:	out1");
	$display("If Behavior	:	out2")	;
	$display("Case Behavior	:	out3")	;
	$display("=====================================================")	;
	$display("	sel	in1	in0	out1	out2	out3")	;
	$display("=====================================================")	;

	#(50)	{sel, in1, in0}	=	3'b_000;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_001;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_010;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_011;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_100;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_101;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_110;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	{sel, in1, in0}	=	3'b_111;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b", sel, in1, in0, out1, out2, out3);
	#(50)	$finish	;
end

endmodule

module	tb_4to1MUX	;

reg		in0	;
reg		in1	;
reg		in2	;
reg		in3	;
reg	[1:0]	sel	;

wire	out1	;
wire	out2	;
wire	out3	;

mux4to1_inst	dut_1(	.in0	(in0),
			.in1	(in1),
			.in2	(in2),
			.in3	(in3),
			.sel	(sel),
			.out	(out1)	);

mux4to1_if	dut_2(	.in0	(in0),
			.in1	(in1),
			.in2	(in2),
			.in3	(in3),
			.sel	(sel),
			.out	(out2)	);


mux4to1_case	dut_3(	.in0	(in0),
			.in1	(in1),
			.in2	(in2),
			.in3	(in3),
			.sel	(sel),
			.out	(out3)	);

initial begin
	$display("Instantiation	:	out1");
	$display("If Behavior	:	out2")	;
	$display("Case Behavior	:	out3")	;
	$display("=====================================================================================")	;
	$display("	sel[0]	sel[1]	in0	in1	in2	in3	out1	out2	out3")	;
	$display("=====================================================================================")	;

	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_000000;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_000001;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_010010;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_010100;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_100000;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_100010;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_110010;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	{sel[0], sel[1], in0, in1, in2, in3}	=	6'b_110100;	#(50)	$display("	%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", sel[0], sel[1], in0, in1, in2, in3, out1, out2, out3);
	#(50)	$finish	;
end

endmodule

