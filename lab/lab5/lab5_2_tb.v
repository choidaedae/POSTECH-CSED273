/* CSED273 lab5 experiment 2 */
/* lab5_2_tb.v */

`timescale 1ns / 1ps

module lab5_2_tb();    
    reg reset_n, j, k, clk;
    wire q, q_;
    
    lab5_2 JK_FF (
        .reset_n(reset_n),
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .q_(q_)
    );  
    
    /* Clock is high for 5ns and low for another 5ns */
    always begin
        clk = !clk;  #5;
    end

    initial begin
        j = 0;
        k = 0; 
        reset_n = 1; 
        clk = 0;
        
        /* Reset a flip-flop to initialize q and q_ */

        ////////////////////////

        
       reset_n=0;
       #10 reset_n=1;
   
        
 
        /* Add your code here */
        ////////////////////////

        /* Test each j, k combinations */
        #10 j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;
        #20 j = 0; k = 0;

        /* Test glitches
         * Show both glitch mitigated with master-slave design
         * and glitch cannot be mitigated with master-slave design */

        ////////////////////////
        /* Add your code here */
        
        #1 j = 0; k = 1; // clock 값 0일 때 K의 noise 유도  
        #1 j = 0; k = 0;
        #14 j = 1; k = 0; // clock 값 1일 때 J의 noise 유도 
        #1 j = 0; k = 0;
        
        ////////////////////////

        #20 $finish;
    end
endmodule
