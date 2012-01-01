;;; This version of os.asm by Amir Roth ammended by CJT 8.11.10 and again 4.11.11
		.OS
		.CODE
		.ADDR x8000
; the TRAP vector table
	JMP BAD_TRAP	; x00
	JMP BAD_TRAP	; x01
	JMP BAD_TRAP	; x02
	JMP BAD_TRAP	; x03
	JMP BAD_TRAP	; x04
	JMP BAD_TRAP	; x05
	JMP BAD_TRAP	; x06
	JMP BAD_TRAP	; x07
	JMP BAD_TRAP	; x08
	JMP BAD_TRAP	; x09
	JMP BAD_TRAP	; x0A
	JMP BAD_TRAP	; x0B
	JMP BAD_TRAP	; x0C
	JMP BAD_TRAP	; x0D
	JMP BAD_TRAP	; x0E
	JMP BAD_TRAP	; x0F
	JMP BAD_TRAP	; x10
	JMP BAD_TRAP	; x11
	JMP BAD_TRAP	; x12
	JMP BAD_TRAP	; x13
	JMP BAD_TRAP	; x14
	JMP BAD_TRAP	; x15
	JMP BAD_TRAP	; x16
	JMP BAD_TRAP	; x17
	JMP BAD_TRAP	; x18
	JMP BAD_TRAP	; x19
	JMP BAD_TRAP	; x1A
	JMP BAD_TRAP	; x1B
	JMP BAD_TRAP	; x1C
	JMP BAD_TRAP	; x1D
	JMP BAD_TRAP	; x1E
	JMP BAD_TRAP	; x1F
	JMP BAD_TRAP	; x20
	JMP BAD_TRAP	; x21
	JMP BAD_TRAP	; x22
	JMP BAD_TRAP	; x23
	JMP BAD_TRAP	; x24
	JMP TRAP_HALT	; x25
	JMP BAD_TRAP	; x26
	JMP BAD_TRAP	; x27
	JMP BAD_TRAP	; x28
	JMP BAD_TRAP	; x29
	JMP BAD_TRAP	; x2A
	JMP BAD_TRAP	; x2B
	JMP BAD_TRAP	; x2C
	JMP BAD_TRAP	; x2D
	JMP BAD_TRAP	; x2E
	JMP BAD_TRAP	; x2F
	JMP BAD_TRAP	; x30
	JMP BAD_TRAP	; x31
	JMP BAD_TRAP	; x32
	JMP BAD_TRAP	; x33
	JMP BAD_TRAP	; x34
	JMP BAD_TRAP	; x35
	JMP BAD_TRAP	; x36
	JMP BAD_TRAP	; x37
	JMP BAD_TRAP	; x38
	JMP BAD_TRAP	; x39
	JMP BAD_TRAP	; x3A
	JMP BAD_TRAP	; x3B
	JMP BAD_TRAP	; x3C
	JMP BAD_TRAP	; x3D
	JMP BAD_TRAP	; x3E
	JMP TRAP_DRAW_8x8 ; x3F
	JMP TRAP_DRAW_1 ; x40
	JMP BAD_TRAP
	JMP TRAP_DRAW_4X4W; x42
	JMP BAD_TRAP	; x43
	JMP BAD_TRAP	; x44
	JMP BAD_TRAP	; x45
	JMP BAD_TRAP	; x46
	JMP BAD_TRAP	; x47
	JMP BAD_TRAP	; x48
	JMP BAD_TRAP	; x49
	JMP BAD_TRAP	; x4A
	JMP BAD_TRAP	; x4B
	JMP BAD_TRAP	; x4C
	JMP BAD_TRAP	; x4D
	JMP TRAP_RESET_VMEM; x4E
	JMP TRAP_BLT_VMEM; x4F
	JMP TRAP_GET_EVENT; x50
	JMP BAD_TRAP	; x51
	JMP BAD_TRAP	; x52
	JMP BAD_TRAP	; x53
	JMP BAD_TRAP	; x54
	JMP BAD_TRAP	; x55
	JMP BAD_TRAP	; x56
	JMP BAD_TRAP	; x57
	JMP BAD_TRAP	; x58
	JMP BAD_TRAP	; x59
	JMP BAD_TRAP	; x5A
	JMP BAD_TRAP	; x5B
	JMP BAD_TRAP	; x5C
	JMP BAD_TRAP	; x5D
	JMP BAD_TRAP	; x5E
	JMP BAD_TRAP	; x5F
	JMP TRAP_PUTS	; x60
	JMP BAD_TRAP	; x61
	JMP BAD_TRAP	; x62
	JMP BAD_TRAP	; x63
	JMP BAD_TRAP	; x64
	JMP BAD_TRAP	; x65
	JMP BAD_TRAP	; x66
	JMP BAD_TRAP	; x67
	JMP BAD_TRAP	; x68
	JMP BAD_TRAP	; x69
	JMP BAD_TRAP	; x6A
	JMP BAD_TRAP	; x6B
	JMP BAD_TRAP	; x6C
	JMP BAD_TRAP	; x6D
	JMP BAD_TRAP	; x6E
	JMP BAD_TRAP	; x6F
	JMP BAD_TRAP	; x70
	JMP BAD_TRAP	; x71
	JMP BAD_TRAP	; x72
	JMP BAD_TRAP	; x73
	JMP BAD_TRAP	; x74
	JMP BAD_TRAP	; x75
	JMP BAD_TRAP	; x76
	JMP BAD_TRAP	; x77
	JMP BAD_TRAP	; x78
	JMP BAD_TRAP	; x79
	JMP BAD_TRAP	; x7A
	JMP BAD_TRAP	; x7B
	JMP BAD_TRAP	; x7C
	JMP BAD_TRAP	; x7D
	JMP BAD_TRAP	; x7E
	JMP BAD_TRAP	; x7F
	JMP BAD_TRAP	; x80
	JMP BAD_TRAP	; x81
	JMP BAD_TRAP	; x82
	JMP BAD_TRAP	; x83
	JMP BAD_TRAP	; x84
	JMP BAD_TRAP	; x85
	JMP BAD_TRAP	; x86
	JMP BAD_TRAP	; x87
	JMP BAD_TRAP	; x88
	JMP BAD_TRAP	; x89
	JMP BAD_TRAP	; x8A
	JMP BAD_TRAP	; x8B
	JMP BAD_TRAP	; x8C
	JMP BAD_TRAP	; x8D
	JMP BAD_TRAP	; x8E
	JMP BAD_TRAP	; x8F
	JMP BAD_TRAP	; x90
	JMP BAD_TRAP	; x91
	JMP BAD_TRAP	; x92
	JMP BAD_TRAP	; x93
	JMP BAD_TRAP	; x94
	JMP BAD_TRAP	; x95
	JMP BAD_TRAP	; x96
	JMP BAD_TRAP	; x97
	JMP BAD_TRAP	; x98
	JMP BAD_TRAP	; x99
	JMP BAD_TRAP	; x9A
	JMP BAD_TRAP	; x9B
	JMP BAD_TRAP	; x9C
	JMP BAD_TRAP	; x9D
	JMP BAD_TRAP	; x9E
	JMP BAD_TRAP	; x9F
	JMP BAD_TRAP	; xA0
	JMP BAD_TRAP	; xA1
	JMP BAD_TRAP	; xA2
	JMP BAD_TRAP	; xA3
	JMP BAD_TRAP	; xA4
	JMP BAD_TRAP	; xA5
	JMP BAD_TRAP	; xA6
	JMP BAD_TRAP	; xA7
	JMP BAD_TRAP	; xA8
	JMP BAD_TRAP	; xA9
	JMP BAD_TRAP	; xAA
	JMP BAD_TRAP	; xAB
	JMP BAD_TRAP	; xAC
	JMP BAD_TRAP	; xAD
	JMP BAD_TRAP	; xAE
	JMP BAD_TRAP	; xAF
	JMP BAD_TRAP	; xB0
	JMP BAD_TRAP	; xB1
	JMP BAD_TRAP	; xB2
	JMP BAD_TRAP	; xB3
	JMP BAD_TRAP	; xB4
	JMP BAD_TRAP	; xB5
	JMP BAD_TRAP	; xB6
	JMP BAD_TRAP	; xB7
	JMP BAD_TRAP	; xB8
	JMP BAD_TRAP	; xB9
	JMP BAD_TRAP	; xBA
	JMP BAD_TRAP	; xBB
	JMP BAD_TRAP	; xBC
	JMP BAD_TRAP	; xBD
	JMP BAD_TRAP	; xBE
	JMP BAD_TRAP	; xBF
	JMP BAD_TRAP	; xC0
	JMP BAD_TRAP	; xC1
	JMP BAD_TRAP	; xC2
	JMP BAD_TRAP	; xC3
	JMP BAD_TRAP	; xC4
	JMP BAD_TRAP	; xC5
	JMP BAD_TRAP	; xC6
	JMP BAD_TRAP	; xC7
	JMP BAD_TRAP	; xC8
	JMP BAD_TRAP	; xC9
	JMP BAD_TRAP	; xCA
	JMP BAD_TRAP	; xCB
	JMP BAD_TRAP	; xCC
	JMP BAD_TRAP	; xCD
	JMP BAD_TRAP	; xCE
	JMP BAD_TRAP	; xCF
	JMP BAD_TRAP	; xD0
	JMP BAD_TRAP	; xD1
	JMP BAD_TRAP	; xD2
	JMP BAD_TRAP	; xD3
	JMP BAD_TRAP	; xD4
	JMP BAD_TRAP	; xD5
	JMP BAD_TRAP	; xD6
	JMP BAD_TRAP	; xD7
	JMP BAD_TRAP	; xD8
	JMP BAD_TRAP	; xD9
	JMP BAD_TRAP	; xDA
	JMP BAD_TRAP	; xDB
	JMP BAD_TRAP	; xDC
	JMP BAD_TRAP	; xDD
	JMP BAD_TRAP	; xDE
	JMP BAD_TRAP	; xDF
	JMP BAD_TRAP	; xE0
	JMP BAD_TRAP	; xE1
	JMP BAD_TRAP	; xE2
	JMP BAD_TRAP	; xE3
	JMP BAD_TRAP	; xE4
	JMP BAD_TRAP	; xE5
	JMP BAD_TRAP	; xE6
	JMP BAD_TRAP	; xE7
	JMP BAD_TRAP	; xE8
	JMP BAD_TRAP	; xE9
	JMP BAD_TRAP	; xEA
	JMP BAD_TRAP	; xEB
	JMP BAD_TRAP	; xEC
	JMP BAD_TRAP	; xED
	JMP BAD_TRAP	; xEE
	JMP BAD_TRAP	; xEF
	JMP BAD_TRAP	; xF0
	JMP BAD_TRAP	; xF1
	JMP BAD_TRAP	; xF2
	JMP BAD_TRAP	; xF3
	JMP BAD_TRAP	; xF4
	JMP BAD_TRAP	; xF5
	JMP BAD_TRAP	; xF6
	JMP BAD_TRAP	; xF7
	JMP BAD_TRAP	; xF8
	JMP BAD_TRAP	; xF9
	JMP BAD_TRAP	; xFA
	JMP BAD_TRAP	; xFB
	JMP BAD_TRAP	; xFC
	JMP BAD_TRAP	; xFD
	JMP BAD_TRAP	; xFE
	JMP BAD_TRAP	; xFF

;;; OS_START - operating system entry point (always starts at x8200)

		.CODE
		.ADDR x8200
OS_START
	;; initialize timer
	LC R0, TIM_INIT
	LC R1, OS_TIR_ADDR
	STR R0, R1, #0

	;; R7 <- User code address (x0000)
	LC R7, USER_CODE_ADDR 
	RTI			; RTI removes the privilege bit

;;; OS memory address constants
USER_CODE_ADDR 	.UCONST x0000
OS_CODE_ADDR 	.UCONST x8000
		
OS_STACK_ADDR 	.UCONST xBFFF
OS_VIDEO_ADDR 	.UCONST xC000
				
OS_KBSR_ADDR	.UCONST xFE00		; keyboard status register
OS_KBDR_ADDR	.UCONST xFE02		; keyboard data register
OS_ADSR_ADDR	.UCONST xFE04		; display status register
OS_ADDR_ADDR	.UCONST xFE06		; display data register
OS_TSR_ADDR	.UCONST xFE08		; timer register
OS_TIR_ADDR	.UCONST xFE0A		; timer interval register
OS_VDCR_ADDR	.UCONST xFE0C	        ; video display control register
OS_MCR_ADDR	.UCONST xFFEE		; machine control register

TIM_INIT 	.UCONST #200		; Timer Interval in milliseconds

MASK_L15 	.UCONST x7FFF
MASK_H4		.UCONST xF000
			
.DATA
.ADDR xC000	
OS_VIDEO_MEM .BLKW x3E00

OS_VIDEO_NUM_COLS .UCONST #128
OS_VIDEO_NUM_ROWS .UCONST #124		
	
;;; TRAP_HALP - trap handler for halting machine

;;; BAD_TRAP - code to execute for undefined trap
.CODE
BAD_TRAP
	JMP TRAP_HALT	; execute HALT

;;; TRAP_HALT - halts the program and jumps to OS_START
.CODE
TRAP_HALT	
	; clear run bit in MCR
	LC R3, OS_MCR_ADDR
	LDR R0, R3, #0
	LC R1, MASK_L15
	AND R0,R0,R1
	STR R0, R3, #0
	JMP OS_START 	; restart machine

	
.CODE
;;; TRAP_DRAW_8x8
;;; Input
;;;   r0 - video column (left)
;;;   r1 - video row (upper) 
;;;   r2 - color
;;; Output
;;;   video memory will be updated to place block of approriate color
TRAP_DRAW_8x8
	LC R4, OS_STACK_ADDR	; OS stack pointer (x7FFF) -> R4
	STR R6, R4, #0		; save USER stack pointer
	ADD R6, R4, #0		; begin using general stack pointer (R6) here

;;; Register allocation
;;;  r3 - loop counter
;;;  r4 - address in video memory
;;;  r5 - scratch variable
	

	LEA R4, OS_VIDEO_MEM
	LC  R5, OS_VIDEO_NUM_COLS
	MUL R5, R5, R1		; Multiply row by 128 (VIDEO_COL_NUM)
	ADD R5, R5, R0		; Add col
	ADD R4, R4, R5		; Add to base address

	LC  R5, OS_VIDEO_NUM_COLS ; This value is used to increment the address on each iteration

	CONST R3, 0		; i = 0
	JMP TEST

;;;  Note the loop unrolling to fill in 8 entries on each row
LOOP	STR R2, R4, #0
	STR R2, R4, #1
	STR R2, R4, #2
	STR R2, R4, #3

	STR R2, R4, #4
	STR R2, R4, #5
	STR R2, R4, #6
	STR R2, R4, #7

	ADD R4, R4, R5		; Update the address by adding OS_VIDEO_NUM_COLS
	ADD R3, R3, #1		; Increment the loop counter

TEST	CMPI R3, #8
	BRn LOOP

;;; If you initialized the loop counter to 8 and decremented on each iteration you could eliminate the CMPI
;;;  and just do a BRp test since JMP doesn't change the NZP

	LDR R6, R6, #0		; Restore user stack pointer

	RTI 

.CODE
;;; TRAP_DRAW_1
;;; Input
;;;   r0 - video column (left)
;;;   r1 - video row (upper) 
;;;   r2 - color
;;; Output
;;;   video memory will be updated to place block of approriate color
TRAP_DRAW_1
	LC R4, OS_STACK_ADDR	; OS stack pointer (x7FFF) -> R4
	STR R6, R4, #0		; save USER stack pointer
	ADD R6, R4, #0		; begin using general stack pointer (R6) here

	LC R5, OS_VIDEO_NUM_COLS
	MUL R5, R1, R5		; Multiply row by 128 (VIDEO_COL_NUM)
	ADD R5, R5, R0		; Add col
	LEA R4, OS_VIDEO_MEM
	ADD R5, R5, R4		; Add video mem begin
	STR R2, R5, #0
	
	LDR R6, R6, #0
	RTI 

;;; TRAP_DRAW_4X4W - draws with 4x4 bitmap with screen "wraparound",
;;; i.e., if part of the bitmap is "off the screen" it wraps around to
;;; the other side of the screen.
;;; Input
;;;   r0 - video column (left)
;;;   r1 - video row (upper) 
;;;   r2 - color
;;;   r3 - bitmap
;;; Output
;;;   video memory will be updated to place block of approriate color
.CODE
TRAP_DRAW_4x4W
	LC R4, OS_STACK_ADDR	; OS stack pointer (x7FFF) -> R4
	STR R6, R4, #0		; save USER stack pointer
	ADD R6, R4, #0		; begin using general stack pointer (R6) here

	;; need to save some registers because we need a lot of temporaries
	STR R7, R6, #-1
	STR R0, R6, #-2
	STR R1, R6, #-3

	;; R7 is i
	CONST R7, #0
D4X4W_ROW_LOOP
	CMPI R7, #4
	BRzp D4X4W_ROW_LOOP_EXIT

	LC R4, MASK_H4
	AND R4, R3, R4
	BRnp D4X4W_DO_ROW
	SLL R3, R3, #4
	JMP D4X4W_ROW_LOOP_IND
D4X4W_DO_ROW	
	;; R5 is j
	CONST R5, #0
D4X4W_COL_LOOP
	CMPI R5, #4
	BRzp D4X4W_COL_LOOP_EXIT
	
	CMPI R3, #0
	BRzp D4X4W_SKIP_PIXEL

	;; compute post-mod y
	LDR R1, R6, #-3
	ADD R1, R7, R1
	LC R4, OS_VIDEO_NUM_ROWS
	ADD R1, R1, R4
	MOD R1, R1, R4
	;; scale y by number of columns
	LC R4, OS_VIDEO_NUM_COLS
	MUL R1, R1, R4

	;; compute post-mod x
	LDR R0, R6, #-2
	ADD R0, R5, R0
	ADD R0, R0, R4
	MOD R0, R0, R4

	ADD R0, R0, R1
	LEA R4, OS_VIDEO_MEM
	ADD R4, R0, R4
	STR R2, R4, #0
D4X4W_SKIP_PIXEL
	
	SLL R3, R3, #1
	ADD R5, R5, #1
	JMP D4X4W_COL_LOOP
D4X4W_COL_LOOP_EXIT

D4X4W_ROW_LOOP_IND	
	ADD R7, R7, #1
	JMP D4X4W_ROW_LOOP
D4X4W_ROW_LOOP_EXIT		
	;; epilogue
	LDR R1, R6, #-3
	LDR R0, R6, #-2
	LDR R7, R6, #-1
	LDR R6, R6, #0		; Restore user stack pointer
	RTI 
	
;;; TRAP_GET_EVENT - for getting a keyboard or timer event
;;; Input
;;;   none
;;; Output
;;;   r5 - an integer indicating what event has happened
;;;        0 (timer) 
;;;        non-0 (keyboard character)

.CODE
TRAP_GET_EVENT			
	LC R4, OS_STACK_ADDR	; OS stack pointer (x7FFF) -> R4
	STR R6, R4, #0		; save USER stack pointer
	ADD R6, R4, #0		; begin using general stack pointer (R6) here

	;; no need to save anything (or even switch stacks really)

GE_LOOP
	LC R0, OS_KBSR_ADDR
	LDR R0, R0, #0
	BRz GE_CHK_TIMER	; If status = 0 (unchanged) check timer
	LC R0, OS_KBDR_ADDR	; else load the character
	LDR R5, R0, #0
	JMP GE_EXIT

GE_CHK_TIMER			; Check timer register MSB
	LC R0, OS_TSR_ADDR
	LDR R0, R0, #0
	BRz GE_LOOP		; If not on (TR=0) 
	CONST R5, #0

GE_EXIT
	LDR R6, R6, #0		; Restore user stack pointer
	RTI

;;; TRAP_RESET_VMEM - In double-buffered video mode, resets the video
;;; display, i.e., turns it to black.
;;; Inputs - none
;;; Outputs - none
.CODE
TRAP_RESET_VMEM
	LC R4, OS_VDCR_ADDR
	CONST R5, #1
	STR R5, R4, #0
	RTI

;;; TRAP_BLT_VMEM - In double-buffered video mode, copies the contents
;;; of video memory to the video display.
;;; Inputs - none
;;; Outputs - none
		.CODE
TRAP_BLT_VMEM
	LC R4, OS_VDCR_ADDR
	CONST R5, #2
	STR R5, R4, #0
	RTI
	
		.CODE
TRAP_PUTS
	LC R4, OS_STACK_ADDR	; OS stack pointer (x7FFF) -> R4
	STR R6, R4, #0		; save USER stack pointer
	ADD R6, R4, #0		; begin using general stack pointer (R6) here

PUTS_CHARLOOP
	LDR R1, R0, #0
	BRz PUTS_EXIT

PUTS_ADSRLOOP
	LC R2, OS_ADSR_ADDR
	LDR R2, R2, #0
	BRzp PUTS_ADSRLOOP
	LC R2, OS_ADDR_ADDR
	STR R1, R2, #0
	
	ADD R0, R0, #1		; goto next character
	JMP PUTS_CHARLOOP
PUTS_EXIT
	LDR R6, R6, #0
	RTI


	





	

	
