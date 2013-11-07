module controller_interface(
	input PCLK, 				// clock 
 	//input PRESERN, 				// system reset 
 
 	/*APB3 BUS INTERFACE 
	input PSEL, 				// peripheral select 
	input PENABLE, 			// distinguishes access phase 
	output wire PREADY, 		// peripheral ready signal 
	output wire PSLVERR, 		// error signal 
	input PWRITE,				// read/write control bit 
	input [31:0] PADDR, 		// IO address 
	input wire [31:0] PWDATA, 	// (processor) bus is writing data to 
	 							// this device 32 bits 
 	output reg [31:0] PRDATA, 	// (processor) bus is reading data from this device*/

	//Controller in/out
	input wire contRead,	//bi-directional wire for red data line
	output wire contWrite,	
	output wire contCLK
);

	//Divided clock to 4 us period
	//wire contCLK;
	clockDiv c1(PCLK, contCLK);
	
	reg write;
	always @(posedge contCLK)
	begin
		write <= ~write;
	end

	assign contWrite = write;

endmodule

module clockDiv(input wire PCLK, output wire contCLK);
	reg [8:0]count;
	reg divCLK;

	always @(posedge PCLK)
	begin
		if (count < 200)
		begin
			count <= count + 1;
			divCLK <= 0;
		end
		else if (count < 400)
		begin
			count <= count + 1;
			divCLK <= 1;
		end
		else
			count <= 0;
	end
	
	assign contCLK = divCLK;
endmodule