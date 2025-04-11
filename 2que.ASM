 AREA FIBONACCI, CODE, READONLY
        ENTRY

        MOV     r0, #0          
        MOV     r1, #1          
        LDR     r4, =fib_array  
        MOV     r5, #10         
        MOV     r6, #0         

store_loop
        CMP     r6, #10         
        BEQ     end             

        STR     r0, [r4], #4    

        ADD     r2, r0, r1      
        MOV     r0, r1          
        MOV     r1, r2          
        ADD     r6, r6, #1      
        B       store_loop      

end
        B       end             

        AREA FIB_DATA, DATA, READWRITE
fib_array
        SPACE   40              

        END