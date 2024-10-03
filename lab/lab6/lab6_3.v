/* CSED273 lab6 experiment 3 */
/* lab6_3.v */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] ncount;
    edge_trigger_D_FF DD(reset_n,(count[1]&~count[0])|(count[3]&~count[2]),clk,count[3],ncount[3]);
    edge_trigger_D_FF DC(reset_n,count[0],clk,count[2],ncount[2]);
    edge_trigger_D_FF DB(reset_n,(count[2]&~count[1])|(~count[3]&~count[2]),clk,count[1],ncount[1]);
    edge_trigger_D_FF DA(reset_n,(count[3]&~count[2])|~count[0],clk,count[0],ncount[0]);
    ////////////////////////
	
endmodule
