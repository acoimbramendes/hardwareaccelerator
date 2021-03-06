// Testbench
//memory interface

`timescale 1ns/100ps



module tb_ukf();
								reg [31:0] diag,lower1,lower2,lower3,lower4;
								reg [3:0] matrix_size,parallel_units;
								reg clk,aclr,start;
								wire [31:0] 	diag_out,lower1_out;//,lower2_out,lower3_out,lower4_out;
								localparam dly = 100;
ukf a0 (      
.clock(clk),
.reset(aclr),
.start(start),
.diag(diag),
.lower1(lower1),
.lower2(lower2),
.lower3(lower3),
.lower4(lower4),
.matrix_size(matrix_size),
.parallel_units(parallel_units),
	.diag_out(diag_out),
	.lower1_out(lower1_out));
											 
 initial begin 
    clk = 0;
	forever begin
    #50 clk = ~clk;
	end 
end

   initial
   begin
  $display ("reset high");
      aclr <= 1'b1;
      #100;
		start<= 1'b0;
		diag<= 32'b0;
		lower1<= 32'b0;
		lower2<= 32'b0;
		lower3<= 32'b0;
		lower4<= 32'b0;
		matrix_size <= 4'b1100;
		parallel_units<=4'b0100;
		
		
  $display ("reset low");
		#100
		aclr <= 1'b0;
      #100;
		start<= 1'b1;
      write_data(32'h40000000); 
      #50;
		#(dly*23)
		write_data_lower(32'h3f800000,32'h3f800000,32'h3f800000,32'h3f800000);
		#1000;
      $display("Successful completion. All transfers passed");
      //$finish;
		$stop;
   end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
task write_data;
input [31:0] diag1;
begin
		diag<= diag1;
end
endtask
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
task write_data_lower;
input [31:0] data1,data2,data3,data4;
begin
		lower1<= data1;
		lower2<= data2;
		lower3<= data3;
		lower4<= data4;

end
endtask


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//localparam CLK_SPEED = 2;  // IF clk = 122.88Mhz = 8.14nS, For half of clock, CLK_SPEED = 8.14nS/2 = 4.07nS

/*
always 
	#5 clk= ~clk; */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

endmodule
