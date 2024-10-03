/* CSED273 lab3 experiment 2 */
/* lab3_2.v */


/* Implement Prime Number Indicator & Multiplier Indicator
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
 
/* 11: out_mul[4], 7: out_mul[3], 5: out_mul[2],
 * 3: out_mul[1], 1: out_mul[0] */
module lab3_2(
    input wire [3:0] in,
    output wire out_prime,
    output wire [4:0] out_mul
    );

    ////////////////////////
    /* Add your code here */
    assign out_mul[0] = ~in[0]&(in[1]|in[2]|in[3]); // 2의 배수 검출기 
    assign out_mul[1] = (in[0]&in[1]&~in[2]&~in[3])|(~in[0]&in[1]&in[2]&~in[3])|(~in[0]&~in[1]&in[2]&in[3])|(in[0]&in[1]&in[2]&in[3])|(in[0]&~in[1]&~in[2]&in[3]);// 3의 배수 검출기 
    assign out_mul[2] = (in[0]&~in[1]&in[2]&~in[3])|(in[0]&in[1]&in[2]&in[3])|(~in[0]&in[1]&~in[2]&in[3]);// 5의 배수 검출기 
    assign out_mul[3] = (~in[0]&in[1]&in[2]&in[3])|(in[0]&in[1]&in[2]&~in[3]);// 7의 배수 검출기 
    assign out_mul[4] = (in[0]&in[1]&~in[2]&in[3]);// 11의 배수 검출기 
    assign out_prime = (in[0]&in[1]&~in[3])|(in[1]&~in[2]&~in[3])|(in[0]&in[1]&~in[2])|(in[0]&~in[1]&in[2]); // prime number indicator
    ////////////////////////

endmodule