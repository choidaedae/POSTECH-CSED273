/* CSED273 lab5 experiment 1 */
/* lab5_1.v */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    /* Add your code here */
    
    // 0비트, 1 bit full adder 를 연속적으로 구현함 .
    
    assign xxory_0=x[0]^y[0];
    assign xandy_0=x[0]&y[0];
    assign out[0] = c_in^xxory_0;
    assign w_0=c_in & xxory_0;
    assign c_1= w_0 | xandy_0;
    
    // 1비트

    assign xxory_1=x[1]^y[1];
    assign xandy_1=x[1]&y[1];
    assign out[1] = c_1^xxory_1;
    assign w_1=c_1 & xxory_1;
    assign c_2= w_1 | xandy_1;
    
    
    // 2비트
    
    assign xxory_2=x[2]^y[2];
    assign xandy_2=x[2]&y[2];
    assign out[2] = c_2^xxory_2;
    assign w_2=c_2 & xxory_2;
    assign c_3= w_2 | xandy_2;
    
    // 3비트
    
    assign xxory_3=x[3]^y[3];
    assign xandy_3=x[3]&y[3];
    assign out[3] = c_3^xxory_3;
    assign w_3=c_3 & xxory_3;
    assign c_out= w_3 | xandy_3;

  
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    wire [3:0] w;
    
    assign w[3]= select[2]&~y[3]|select[1]&y[3];
    assign w[2]= select[2]&~y[2]|select[1]&y[2];
    assign w[1]= select[2]&~y[1]|select[1]&y[1];
    assign w[0]= select[2]&~y[0]|select[1]&y[0];

    adder A(w[3:0], x[3:0], select[0], out[3:0], c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////

    assign out = (select[1]) ? (select[0]? in[3] : in[2]) : (select[0]? in[1] : in[0]); //3항 연산자를 통해 구현 
    /* Add your code here */
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    /* Add your code here */

    wire [3:0] w0; // 0비트 연산을 처리 
    wire [3:0] w1; // 1비트 연산을 처리
    wire [3:0] w2; // 2비트 연산을 처리
    wire [3:0] w3; // 3비트 연산을 처리
    
    assign w0[0]=x[0]&y[0]; // and 연산
    assign w0[1]=x[0]|y[0]; // or 연산
    assign w0[2]=x[0]^y[0]; // xor 연산
    assign w0[3]=~x[0];
    
    assign w1[0]=x[1]&y[1];
    assign w1[1]=x[1]|y[1];
    assign w1[2]=x[1]^y[1];
    assign w1[3]=~x[1];

    assign w2[0]=x[2]&y[2];
    assign w2[1]=x[2]|y[2];
    assign w2[2]=x[2]^y[2];
    assign w2[3]=~x[2];
    
    assign w3[0]=x[3]&y[3]; 
    assign w3[1]=x[3]|y[3]; 
    assign w3[2]=x[3]^y[3]; 
    assign w3[3]=~x[3];
    

    mux4to1 m1(w3, select[1:0], out[3]);
    mux4to1 m2(w2, select[1:0], out[2]);
    mux4to1 m3(w1, select[1:0], out[1]);
    mux4to1 m4(w0, select[1:0], out[0]);
    
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    /* Add your code here */
    assign out = select ? in[1] : in[0]; // 삼항연산자로 구현 
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    /* Add your code here */
    
   wire [3:0] arith; //산술 연산 회로 파트
   wire [3:0] logic; // 논리 연산 회로 파트
   
   arithmeticUnit A (x,y,select[2:0],arith,c_out);
   
   logicUnit L (x,y,select[1:0],logic);
   
    mux2to1 m1({logic[0],arith[0]}, select[3],out[0]);
    mux2to1 m2({logic[1],arith[1]}, select[3],out[1]);
    mux2to1 m3({logic[2],arith[2]}, select[3],out[2]);
    mux2to1 m4({logic[3],arith[3]}, select[3],out[3]);
    ////////////////////////

endmodule