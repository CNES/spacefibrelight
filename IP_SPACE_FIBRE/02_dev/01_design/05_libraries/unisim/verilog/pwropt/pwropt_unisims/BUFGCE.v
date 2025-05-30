///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2015 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2015.4
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Buffer
// /___/   /\     Filename : BUFG.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    04/01/08 - Initial version.
// End Revision
///////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

`celldefine

module BUFGCE (O, CE, I);

`ifdef XIL_TIMING //Simprim
 
  parameter LOC = "UNPLACED";

`endif

   output   O;
   input   CE;
   input   I;

   assign  O = CE & I;

endmodule

`endcelldefine
