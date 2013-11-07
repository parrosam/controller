//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Nov 07 12:52:34 2013
// Version: v11.0 11.0.0.23
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// controller
module controller(
    // Inputs
    MSS_RESET_N,
    contRead,
    // Outputs
    contCLK,
    contWrite
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  MSS_RESET_N;
input  contRead;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output contCLK;
output contWrite;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   contCLK_net_0;
wire   contRead;
wire   controller_MSS_0_FAB_CLK;
wire   contWrite_net_0;
wire   MSS_RESET_N;
wire   contCLK_net_1;
wire   contWrite_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign contCLK_net_1   = contCLK_net_0;
assign contCLK         = contCLK_net_1;
assign contWrite_net_1 = contWrite_net_0;
assign contWrite       = contWrite_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------controller_interface
controller_interface controller_interface_0(
        // Inputs
        .PCLK      ( controller_MSS_0_FAB_CLK ),
        .contRead  ( contRead ),
        // Outputs
        .contWrite ( contWrite_net_0 ),
        .contCLK   ( contCLK_net_0 ) 
        );

//--------controller_MSS
controller_MSS controller_MSS_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        // Outputs
        .FAB_CLK     ( controller_MSS_0_FAB_CLK ) 
        );


endmodule
