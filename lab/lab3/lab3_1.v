/* CSED273 lab3 experiment 1 */
/* lab3_1.v */


/* Active Low 2-to-4 Decoder
 * You must use this module to implement Active Low 4-to-16 decoder */
module decoder(
    input wire en,
    input wire [1:0] in,
    output wire [3:0] out 
    );

    nand(out[0], ~in[0], ~in[1], ~en);
    nand(out[1],  in[0], ~in[1], ~en);
    nand(out[2], ~in[0],  in[1], ~en);
    nand(out[3],  in[0],  in[1], ~en);

endmodule


/* Implement Active Low 4-to-16 Decoder
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level modeling (and, or, not) */
module lab3_1(
    input wire en,
    input wire [3:0] in,
    output wire [15:0] out
    );

    ////////////////////////
    wire [3:0] a;
    decoder d0(en, in[3:2], a); // en 물려주는 2X4 decoder , output은 [3:0] wire여야 함
    decoder d1(a[0], in[1:0], out[3:0]); // output 0~3
    decoder d2(a[1], in[1:0], out[7:4]); // output 4~7
    decoder d3(a[2], in[1:0], out[11:8]); // output 8~11
    decoder d4(a[3], in[1:0], out[15:12]); // output 12~15
    
    /* Add your code here */
    ////////////////////////

endmodule
