	.ORIG x3000

	LD R6,INITIAL	; initialize the stack pointer

	LD R0,KBISR	; set up the keyboard interrupt vector table entry
	STI R0,KBIV
		
	LD R0,IE	; enable keyboard interrupts
	STI R0,KBSR
			
FRSTLN	AND R1,R1,#0	; start of actual user program to print Texas checkerboard
	AND R2,R2,#0
	ADD R1,R1,#4
FOUR	ADD R2,R2,#7
	LD R0,T
	OUT
	LD R0,E
	OUT
	LD R0,X
	OUT
	LD R0,A
	OUT
	LD R0,S
	OUT

		
SPCING	LD R0,SPACE
	OUT
	ADD R2,R2,#-1
	BRnp SPCING
	
	ADD R1,R1,#-1
	BRnp FOUR
	LD R0,NEWLN
	OUT
	JSR DELAY

SCNDLN	ADD R1,R1,#3
THREE	ADD R2,R2,#7

	
SPCIN2	LD R0,SPACE
	OUT
	ADD R2,R2,#-1
	BRnp SPCIN2

	LD R0,T
	OUT
	LD R0,E
	OUT
	LD R0,X
	OUT
	LD R0,A
	OUT
	LD R0,S
	OUT	
	ADD R1,R1,#-1
	BRnp THREE
	LD R0,NEWLN
	OUT
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
T	.STRINGZ "T"
E	.STRINGZ "e"
X	.STRINGZ "x"
A	.STRINGZ "a"
S	.STRINGZ "s"
SPACE	.FILL x20
NEWLN 	.FILL x000A
COUNT   .FILL #2500
Save_R1 .BLKW 1
SAVE_R7	.BLKW 1
KBIV	.FILL x180
KBISR	.FILL x1500
KBSR	.FILL xFE00
IE	.FILL x4000
	.END