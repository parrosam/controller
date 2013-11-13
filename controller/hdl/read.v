// read.v

module read(
	input PCLK, // clock 
	input PRESERN, // system reset 
 
	//APB3 BUS INTERFACE 
	input PSEL, // peripheral select 
	input PENABLE, // distinguishes access phase 
	output wire PREADY, // peripheral ready signal 
	output wire PSLVERR, // error signal 
	input PWRITE, // read/write control bit 
	input [31:0] PADDR, // IO address 
	input wire [31:0] PWDATA, // (processor) bus is writing data to 
	output reg [31:0] PRDATA, // (processor) bus is reading data from this device 

	//MODULE I/O
	input ready,
	input data, 
	output reg [4:0] buttonData,
	output reg sample
);

assign PSLVERR = 0; //assumes no error generation 
assign PREADY = 1; //assumes zero wait 
//assign buttonData[7:0] = PRDATA[31:24];

reg[20:0] count;
reg A, B, X, Y, Start, L, R, Z, D_Up, D_Down, D_Left, D_Right;
reg [4:0] buttonCount;
reg [1:0] dataSync;

//Associate each button with correct negedge
always @(posedge PCLK)
begin
	buttonData[4] <= Start;
	buttonData[3] <= Y;
	buttonData[2] <= X;
	buttonData[1] <= B;
	buttonData[0] <= A;
//	PRDATA[31] <= Start;
//	PRDATA[30] <= Y;
//	PRDATA[29] <= X;
//	PRDATA[28] <= B;
//	PRDATA[27] <= A;
//	PRDATA[26] <= L;
//	PRDATA[25] <= R;
//	PRDATA[24] <= Z;
//	PRDATA[23] <= D_Up;
//	PRDATA[22] <= D_Down;
//	PRDATA[21] <= D_Left;
//	PRDATA[20] <= D_Right;
//	PRDATA[19:0] <= 0;
	
	//Detect a negedge on data
	dataSync[1] <= data;
	dataSync[0] <= dataSync[1];

	if (~dataSync[1] & dataSync[0])
	begin
		if (ready)
			buttonCount <= buttonCount + 1;
		else
			buttonCount <= 0;
	end

	if(ready)
	begin
		if(~dataSync[1] & dataSync[0])
			count <= 0;
		else
			count <= count + 1;

		if(count >= 175 && count <= 225)
		begin
			sample <= 1;

			if(buttonCount == 3)
				Start <= dataSync[0];
			else if(buttonCount == 4)
				Y <= dataSync[0];
			else if(buttonCount == 5)
				X <= dataSync[0];
			else if(buttonCount == 6)
				B <= dataSync[0];
			else if(buttonCount == 7)
				A <= dataSync[0];
			else if(buttonCount == 9)
				L <= dataSync[0];
			else if(buttonCount == 10)
				R <= dataSync[0];
			else if(buttonCount == 11)
				Z <= dataSync[0];
			else if(buttonCount == 12)
				D_Up <= dataSync[0];
			else if(buttonCount == 13)
				D_Down <= dataSync[0];
			else if(buttonCount == 14)
				D_Right <= dataSync[0];
			else if(buttonCount == 15)
				D_Left <= dataSync[0];
		end
		else
			sample <= 0;
	end
end

//reg countReset;
////Count each negedge after poll command has been sent
//always @(negedge data)
//begin		
//	countReset <= 0;
//	if(ready)
//		buttonCount <= buttonCount + 1;
//	else
//		buttonCount <= 0;
//end
//


endmodule