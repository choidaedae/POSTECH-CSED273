/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    /* Add your code here */
     assign out_m[0]=in_a[0]&in_b[0]; // 최하위 비트, 별도의 carry가 필요하지 않음 
    
     wire [4:0] A;
     wire [4:0] B;
     
     
     assign A[0]=(in_a[1]&in_b[0]);
     assign A[1]=(in_a[2]&in_b[0]);
     assign A[2]=(in_a[3]&in_b[0]);
     assign A[3]=(in_a[4]&in_b[0]);
     assign A[4]=0;
     
     assign B[0]=(in_a[0]&in_b[1]);
     assign B[1]=(in_a[1]&in_b[1]);
     assign B[2]=(in_a[2]&in_b[1]);
     assign B[3]=(in_a[3]&in_b[1]);
     assign B[4]=(in_a[4]&in_b[1]);
 
     wire c1;
     wire [4:0] s1; //위  ripple adder의 sum값 저장
    
     wire cin1;
     assign cin1 = 0;
     lab4_2 RA1 (A, B, cin1, s1, c1); // 그림에서 위에 해당하는 ripple adder
     
     assign out_m[1]=s1[0]; //두 번째로 작은 비트 설정 
        
     wire [4:0] C;
     
     assign C[0]=s1[1]; // 위의 ripple adder 값을 끌어씀 
     assign C[1]=s1[2];
     assign C[2]=s1[3];
     assign C[3]=s1[4];
     assign C[4]=c1;
   
     wire [4:0] D;
     
     assign D[0]=(in_a[0]&in_b[2]);
     assign D[1]=(in_a[1]&in_b[2]);
     assign D[2]=(in_a[2]&in_b[2]);
     assign D[3]=(in_a[3]&in_b[2]);
     assign D[4]=(in_a[4]&in_b[2]);
    
    
     wire c2;///carry 저장할 wire
     wire [4:0] s2; //아래 ripple adder의 sum값 저장
  
     wire cin2;
     assign cin2 = 0;
     lab4_2 RA2 (C, D, cin2, s2, c2);//그림에서 아래에 해당하는 ripple adder, cin 은 0임 
        
     assign out_m[2]=s2[0];
     assign out_m[3]=s2[1];
     assign out_m[4]=s2[2];
     assign out_m[5]=s2[3];
     assign out_m[6]=s2[4];
     
     assign out_m[7]=c2; //최상위 비트 : carry out만 더해주면 됨 
     
    ////////////////////////
    
endmodule