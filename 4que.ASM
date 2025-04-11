
        AREA PRIME_CHECK, CODE, READONLY
ENTRY
        LDR     r0, =num         
        LDR     r1, [r0]         
        MOV     r2, #2           
        MOV     r3, #0           

        CMP     r1, #2
        BLT     not_prime        

loop
        MOV     r4, r1
        MOV     r5, r2

        MOV     r6, #0           
div_loop
        CMP     r4, r5           
        BLT     done_div         
        SUB     r4, r4, r5       
        ADD     r6, r6, #1       
        B       div_loop         

done_div
        MUL     r7, r6, r2       
        CMP     r7, r1
        BEQ     not_prime        

        ADD     r2, r2, #1       
        CMP     r2, r1
        BLT     loop             

        B       is_prime         

not_prime
        MOV     r3, #1           

is_prime
        LDR     r8, =result
        STR     r3, [r8]         

end
        B       end              

        AREA DATA_SECTION, DATA, READWRITE

num     DCD     29         
result  DCD     0               

        END
