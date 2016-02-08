	.ORIG x3000

	LD R6,INITIAL	; initialize the stack pointer

	LD R0,KBISR	; set up the keyboard interrupt vector table entry
	STI R0,KBIV
		
	LD R0,IE	; enable keyboard interrupts
	STI R0,KBSR
			
FRSTLN	LEA R0,FIRST
	PUTS
	LD R0,NEWLN
	OUT
	JSR DELAY
	JSR DELAY
	JSR DELAY
	JSR DELAY
 

SCND	LEA R0,SECOND
	PUTS
	LD R0,NEWLN
	OUT
	JSR DELAY
	JSR DELAY
	JSR DELAY
	JSR DELAY
	BR FRSTLN
	

DELAY   ST R1,Save_R1
	ST R7,SAVE_R7
        LD R1,COUNT
REP     ADD R1,R1,#-1
        BRp REP
        LD R1,Save_R1
	LD R7,SAVE_R7
        RET
	
	

END	HALT

INITIAL	.FILL x3000
FIRST	.STRINGZ "Texas       Texas       Texas       Texas"
SECOND	.STRINGZ "       Texas       Texas       Texas"
SPACE	.FILL x20
NEWLN 	.FILL x000A
COUNT   .FILL #9999
Save_R1 .BLKW 1
SAVE_R7	.BLKW 1
KBIV	.FILL x180
KBISR	.FILL x1500
KBSR	.FILL xFE00
IE	.FILL x4000
	.END