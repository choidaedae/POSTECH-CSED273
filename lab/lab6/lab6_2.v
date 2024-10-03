/* CSED273 lab6 experiment 2 */
/* lab6_2.v */

`timescale 1ps / 1fs

/* Implement 2-decade BCD counter (0-99)
 * You must use decade BCD counter of lab6_1.v */
module decade_counter_2digits(input reset_n, input clk, output [7:0] count);

    ////////////////////////
    /* Add your code here */
    decade_counter C_ud(reset_n,clk,count[3:0]); // ud, ���� �ڸ� 
    decade_counter C_td(reset_n,count[3],count[7:4]); // td, ���� �ڸ�, count[3]�� 1->0 ���� �ٲ� �� ���� ��ȣ�� �޾Ƽ� ���� state�� �Ѿ. 
    ////////////////////////
	
endmodule
