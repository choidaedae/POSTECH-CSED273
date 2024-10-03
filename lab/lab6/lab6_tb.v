/* CSED273 lab6 experiments */
/* lab6_tb.v */

`timescale 1ps / 1fs

module lab6_tb();

    integer Passed;
    integer Failed;

    /* Define input, output and instantiate module */
    ////////////////////////
    /* Add your code here */
    reg reset_n_task1, reset_n_task2, reset_n_task3, clk;
    wire [3:0] count_task1; // BCD counter
    wire [7:0] count_task2; // 두 자릿수 BCD counter
    wire [3:0] count_task3; // 369 counter
    
    //모듈 초기화 
    
    decade_counter task1(
        .reset_n(reset_n_task1),
        .clk(clk),
        .count(count_task1)
        );
        
    decade_counter_2digits task2(
        .reset_n(reset_n_task2),
        .clk(clk),
        .count(count_task2)
        );
        
    counter_369 task3(
        .reset_n(reset_n_task3),
        .clk(clk),
        .count(count_task3)
        );
    ////////////////////////

    initial begin
        Passed = 0;
        Failed = 0;

        lab6_1_test;
        lab6_2_test;
        lab6_3_test;

        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end

    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////
        /* Add your code here */
        integer i,j; 
        reg [3:0] count_lab_6_1;
        
        begin
        reset_n_task1=0; reset_n_task2=0; reset_n_task3=0;
        
        #1
        reset_n_task1=1;
        clk=1;
        for(i=0; i<10; i=i+1)
        begin
        count_lab_6_1=4'b0000;
            for(j=0;j<10;j=j+1)
                begin
                if(count_task1===count_lab_6_1)
                begin Passed=Passed+1;
                end
                else begin Failed=Failed+1;
                end
        
            #1
            clk=0;
            #1
            clk=1;
            count_lab_6_1=count_lab_6_1+4'b0001; // 1씩 더해줌 
            end
        end
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        /* Add your code here */
    integer i,j,k; 
    reg [3:0] count_lab_6_2_ud; // 1의 자리 counter register
    reg [3:0] count_lab_6_2_td; // 10의자리 counter register
    
    begin
    #1
    reset_n_task2=1;
    clk = 1;
        
        for(k=0;k<5;k =k+1)
        begin count_lab_6_2_td=4'b0000;
        
            for(i=0;i<10;i=i+1)
            begin count_lab_6_2_ud=4'b0000;
        
                for(j=0;j<10;j=j+1)
                begin
                    if(count_task2==={count_lab_6_2_td,count_lab_6_2_ud}) begin Passed=Passed+1;
                    end
                    else begin Failed=Failed+1;
                    end
                    #1
                    clk = 0;
                    #1
                    clk = 1;
                    count_lab_6_2_ud=count_lab_6_2_ud+4'b0001; // 1씩 더해줌 
                 end
            count_lab_6_2_td = count_lab_6_2_td+4'b0001;
            end
        end
     end
        ////////////////////////
    endtask

    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        /* Add your code here */
        integer i;
        reg [3:0] count_lab_6_3;
        
        begin
        count_lab_6_3=4'b0000;
        reset_n_task3=1;
        
        for(i=0;i<50;i=i+1)
            begin
            if(count_task3===count_lab_6_3) begin Passed=Passed+1;
            end
            else begin Failed=Failed+1;
            end
            
            #1 
            clk=0;
            #1
            clk=1;
            
            if (count_lab_6_3===4'b0000)
            begin count_lab_6_3=4'b0011;
            end
            
            else if(count_lab_6_3===4'b0011)
            begin count_lab_6_3=4'b0110;
            end
            
            else if(count_lab_6_3===4'b0110)
            begin count_lab_6_3=4'b1001;
            end
            
            else if(count_lab_6_3===4'b1001)
            begin count_lab_6_3=4'b1101;
            end
            
            else if(count_lab_6_3===4'b1101)
            begin count_lab_6_3=4'b0110;
            end
        end
        end
        
        ////////////////////////
    endtask

endmodule