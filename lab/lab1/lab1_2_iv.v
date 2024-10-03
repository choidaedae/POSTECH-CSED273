/* CSED273 lab1 experiment 2_iv */
/* lab1_2_iv.v */


module lab1_2_iv(outAND, outOR, outNOT, inA, inB);
    output wire outAND, outOR, outNOT;
    input wire inA, inB;

    AND(outAND, inA, inB);
    OR(outOR, inA, inB);
    NOT(outNOT, inA);

endmodule


/* Implement AND, OR, and NOT modules with {NOR}
 * You are only allowed to wire modules below
 * i.e.) No and, or, not, etc. Only nor, AND, OR, NOT are available*/
module AND(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB; 
    wire nA, nB;
    ////////////////////////
    /* Add your code here */
    nor(nA, inA, inA);
    nor(nB, inB, inB);
    nor(outAND, nA, nB);
    ////////////////////////

endmodule

module OR(outOR, inA, inB); 
    output wire outOR;
    input wire inA, inB;
    wire anorb;
    ////////////////////////
    /* Add your code here */
    nor(anorb, inA, inB);
    nor(outOR, anorb, anorb);
    ////////////////////////

endmodule

module NOT(outNOT, inA);
    output wire outNOT;
    input wire inA; 

    ////////////////////////
    /* Add your code here */
    nor(outNOT, inA, inA);
    ////////////////////////

endmodule