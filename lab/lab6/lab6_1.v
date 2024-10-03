/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    /* Add your code here */
    wire [3:0] ncount;
    edge_trigger_JKFF D(reset_n,count[2]&count[1]&count[0],count[0],clk,count[3],ncount[3]); // J_D = ABC , K_D = A
    edge_trigger_JKFF C(reset_n,count[1]&count[0],count[1]&count[0],clk,count[2],ncount[2]); // J_C = AB , K_C = AB
    edge_trigger_JKFF B(reset_n,~count[3]&count[0],count[0],clk,count[1],ncount[1]); // J_B = AD' , K_B = A
    edge_trigger_JKFF A(reset_n,1'b1,1'b1,clk,count[0],ncount[0]); // J_D = 1 , K_D = 1
    
    ////////////////////////
	
endmodule