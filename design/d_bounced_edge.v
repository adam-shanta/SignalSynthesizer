module d_bounce_edge (sig,btn,clk);
	input btn, clk;
	output reg sig;
	reg [13:0] holdin = 14'h3A98;
	reg [1:0] q;
	reg out;
	
	always @(posedge clk) begin
	
		if(btn == 1'd1 && holdin != 14'd0) begin
			holdin <= holdin - 1'b1;
			out <= 1'b0;
		end else if (btn == 1'd1 && holdin == 14'd0) begin 
			out <= 1'b1;
			holdin <= holdin;
		end else if (btn == 1'd0)begin
			out <= 1'b0;
			holdin <= 14'h3A98;
		end
		
		q[0] <= out;
		q[1] <= q[0];
		sig <= ~q[1] & q[0];
	end
	
/*	dff check1 (.q(q[0]),.d(out),.clk(clk));
	dff check2 (.q(q[1]),.d(q[0]),.clk(clk));
	
	assign sig = ~q[1]&q[0];*/
	
endmodule

/*module dff (q,d,clk);
	input d, clk;
	output reg q;
	
	always @(posedge clk) begin
		q <= d;
	end
endmodule*/