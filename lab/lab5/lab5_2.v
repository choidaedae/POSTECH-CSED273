/* CSED273 lab5 experiment 2 */
/* lab5_2.v */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r,
    output q, q_
    );
   
    ////////////////////////
    assign q=~(r|q_);
    assign q_=~(q|s);
    /* Add your code here */
    ////////////////////////

endmodule

/* Implement master-slave JK flip-flop with srLatch module */
module lab5_2(
    input reset_n, j, k, clk,
    output q, q_
    );
    
    ////////////////////////


    assign rm = clk & q & k &reset_n | ~reset_n;
    assign sm = clk & q_ & j & reset_n;
    
    srLatch master(sm, rm, qm, q_m);
    assign rs = q_m & ~clk;
    assign ss = qm & ~clk;
    
    srLatch slave(ss, rs, q, q_);

    ////////////////////////
    
endmodule