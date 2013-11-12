//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Nov 11 17:44:22 2013
// Version: v11.0 11.0.0.23
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// controller
module controller(
    // Inputs
    contREAD,
    // Outputs
    RDATA,
    contWRITE
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  contREAD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output RDATA;
output contWRITE;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   contREAD;
wire   controller_MSS_0_FAB_CLK;
wire   contWrite;
wire   RDATA_net_0;
wire   contWrite_net_0;
wire   RDATA_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign contWrite_net_0 = contWrite;
assign contWRITE       = contWrite_net_0;
assign RDATA_net_1     = RDATA_net_0;
assign RDATA           = RDATA_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------controller_interface
controller_interface controller_interface_0(
        // Inputs
        .PCLK      ( controller_MSS_0_FAB_CLK ),
        .contREAD  ( contREAD ),
        // Outputs
        .contWRITE ( contWrite ),
        .RDATA     ( RDATA_net_0 ) 
        );

//--------controller_MSS
controller_MSS controller_MSS_0(
        // Outputs
        .FAB_CLK ( controller_MSS_0_FAB_CLK ) 
        );


endmodule
