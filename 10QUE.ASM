	AREA BlockTransfer, CODE, READONLY   ; Define code section
        ENTRY                               ; Mark entry point

        LDR r0, =SourceAddr                
        LDR r1, =DestAddr                  
        LDR r2, =BlockSize                 

TransferLoop
        LDMIA r0!, {r3-r6}                 ; Load multiple values from source (increment r0)
        STMIA r1!, {r3-r6}                 ; Store multiple values to destination (increment r1)
        SUB r2, r2, #16                    ; Decrease block size counter (by 16 bytes)
        CMP r2, #0                         ; Check if the block is fully transferred
        BNE TransferLoop                   ; If not, continue the loop


        AREA BlockData, DATA, READWRITE    

SourceAddr    DCD 0x11111111, 0x22222222, 0x33333333, 0x44444444 ; Source data
DestAddr      SPACE 16                     ; Reserve space for destination (16 bytes)
BlockSize     DCD 16                       ;Define block size (in bytes)
	END