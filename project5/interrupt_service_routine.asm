	.ORIG x1500
	
	ST R0,SAVER0	
	ST R1,SAVER1
	ST R2,SAVER2
	ST R3,SAVER3
	ST R4,SAVER4
	ST R5,SAVER5
	ST R6,SAVER6
	ST R7,SAVER7

	LD R1,A	; the code
	LD R2,Z
	LDI R0,KBDR
	NOT R1,R1
	ADD R1,R1,#1
	ADD R1,R0,R1
	BRn INVLD
	NOT R2,R2
	ADD R2,R2,#1
	ADD R2,R2,R0
	BRp INVLD
	
	


POLL	LDI R2,DSR	
	BRzp POLL
	
	LD R0,NEWLN
	STI R0,DDR
	
	AND R1,R1,#0
	ADD R1,R1,#10
CPTL	LDI R2,DSR	
	BRzp CPTL
	LDI R0,KBDR
	STI R0,DDR
	ADD R1,R1,#-1
	BRnp CPTL
	
	ADD R0,R0,xF
	ADD R0,R0,xF
	ADD R0,R0,x2
	AND R1,R1,#0
	ADD R1,R1,#10
LOWER	LDI R2,DSR	
	BRzp LOWER
	STI R0,DDR
	ADD R1,R1,#-1
	BRnp LOWER
	
POLL2	LDI R2,DSR	
	BRzp POLL2
	LD R0,NEWLN
	STI R0,DDR 



INVLD	LD R0,SAVER0	
	LD R1,SAVER1
	LD R2,SAVER2
	LD R3,SAVER3
	LD R4,SAVER4
	LD R5,SAVER5
	LD R6,SAVER6
	LD R7,SAVER7

	RTI
	
MASK	.FILL x8000
KBDR	.FILL xFE02
DSR	.FILL xFE04
DDR	.FILL xFE06
SAVER0	.BLKW 1
SAVER1	.BLKW 1
SAVER2	.BLKW 1
SAVER3	.BLKW 1
SAVER4	.BLKW 1
SAVER5	.BLKW 1
SAVER6	.BLKW 1
SAVER7	.BLKW 1
A	.FILL x41
Z	.FILL x5A
NEWLN	.FILL x000A
	.END