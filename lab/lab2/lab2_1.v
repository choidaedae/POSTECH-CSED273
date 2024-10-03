/* CSED273 lab2 experiment 1 */
/* lab2_1.v */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    /* Add your code here */

      assign outGT = (~inA[1]&inA[0]&~inB[1]&~inB[0])|(inA[1]&inA[0]&~inB[1]&~inB[0])|(inA[1]&inA[0]&~inB[1]&inB[0])|(inA[1]&inA[0]&inB[1]&~inB[0])|(inA[1]&~inA[0]&~inB[1]&~inB[0])|(inA[1]&~inA[0]&~inB[1]&inB[0]);
     // 0100 or 1100 or 1101 or 1110 or 1000 or 1001
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
                  
    ////////////////////////
    /* Add your code here */
   
   assign outEQ =(~inA[1]&~inA[0]&~inB[1]&~inB[0])|(~inA[1]&inA[0]&~inB[1]&inB[0])|(inA[1]&inA[0]&inB[1]&inB[0])|(inA[1]&~inA[0]&inB[1]&~inB[0]);
    // 0000 or 0101 or 1111 or 1010     
    ////////////////////////
endmodule

/* Implement output about "A<B" */
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    ////////////////////////
    /* Add your code here */

      assign outLT = (~inA[1]&~inA[0]&~inB[1]&inB[0])|(~inA[1]&~inA[0]&inB[1]&inB[0])|(~inA[1]&~inA[0]&inB[1]&~inB[0])|(~inA[1]&inA[0]&inB[1]&inB[0])|(~inA[1]&inA[0]&inB[1]&~inB[0])|(inA[1]&~inA[0]&inB[1]&inB[0]);
    //0001 or 0011 or 0010 or 0101 or 0110 or 1011 
    ////////////////////////
endmodule