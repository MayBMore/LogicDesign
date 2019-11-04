module	tb_decoder	;

reg	[2:0]	in	;
reg		en	;

wire	[7:0]	out1	;
wire	[7:0]	out2	;


dec3to8_shift	dut1	(	.in	(	in	),
				.en	(	en	),
				.out	(	out1	));

dec3to8_case	dut2	(	.in	(	in	),
				.en	(	en	),
				.out	(	out2	));

initial begin
	$display("input : in")	;
	$display("enable : en")	;
	$display("shift : out1")	;
	$display("case&if : out2")	;
	$display("===============================================");
	$display("	in	en	out1	ou2")	;
	$display("===============================================");
	#(50)	{in, en}	=	4'b_0001;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_0011;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_0101;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_0111;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_1001;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_1011;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_1101;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	{in, en}	=	4'b_1111;	#(50)	$display("	%b\t%b\t%b\t%b", in, en, out1, out2);
	#(50)	$finish	;
end
endmodule
