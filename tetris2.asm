		.DATA
shapes 		.FILL #1632
		.FILL #1632
		.FILL #1632
		.FILL #1632
		.FILL #61440
		.FILL #17476
		.FILL #61440
		.FILL #17476
		.FILL #36352
		.FILL #25664
		.FILL #3616
		.FILL #17600
		.FILL #11776
		.FILL #17504
		.FILL #3712
		.FILL #50240
		.FILL #50688
		.FILL #19584
		.FILL #50688
		.FILL #19584
		.FILL #27648
		.FILL #35904
		.FILL #27648
		.FILL #35904
		.FILL #19968
		.FILL #17984
		.FILL #3648
		.FILL #19520
		.DATA
colors 		.FILL #31744
		.FILL #51
		.FILL #13056
		.FILL #32752
		.FILL #62976
		.FILL #1904
		.FILL #65535
uconst
		.UCONST #239
		.DATA
score 		.FILL #0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;print_num;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
print_num
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-6	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRnp L2_tetris
	LEA R7, L4_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L3_tetris
L2_tetris
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R7, R5, #-6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_utoa
	ADD R6, R6, #3	;; free space for arguments
	ADD R7, R5, #-6
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L5_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L3_tetris
L1_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;clear_tetris_array;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
clear_tetris_array
	LEA R2, cells
	CONST R3, #0
	CONST R7, #0
	LC R5, uconst, #0
LOOP
	CMP R3, R5
	BRp  END_LOOP
	STR  R2, R7 ,#0
	ADD R3, R3, #1
	ADD R2, R2, #1
	JMP LOOP
END_LOOP
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_cells;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_cells
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
L16_tetris
	CONST R7, #0
	STR R7, R5, #-1
L20_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R2, R3, #4
	LEA R1, cells
	ADD R2, R2, R1
	ADD R2, R7, R2
	LDR R2, R2, #0
	ADD R6, R6, #-1
	STR R2, R6, #0
	SLL R3, R3, #3
	ADD R3, R3, #4
	ADD R6, R6, #-1
	STR R3, R6, #0
	SLL R7, R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_8x8
	ADD R6, R6, #3	;; free space for arguments
L21_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #16
	CMP R7, R3
	BRn L20_tetris
L17_tetris
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #15
	CMP R7, R3
	BRn L16_tetris
L15_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	JSR lc4_reset_vmem
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_cells
	ADD R6, R6, #0	;; free space for arguments
	JSR lc4_blt_vmem
	ADD R6, R6, #0	;; free space for arguments
L24_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;test_for_collision;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
test_for_collision
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-6	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-3
	LDR R7, R5, #4
	STR R7, R5, #-2
	JMP L29_tetris
L26_tetris
	LDR R7, R5, #5
	STR R7, R5, #-1
	JMP L33_tetris
L30_tetris
	LDR R7, R5, #-2
	STR R7, R5, #-4
	CONST R3, #15
	CMP R7, R3
	BRzp L38_tetris
	CONST R7, #0
	STR R7, R5, #-5
	LDR R3, R5, #-4
	CMP R3, R7
	BRn L38_tetris
	LDR R7, R5, #-1
	STR R7, R5, #-6
	LDR R3, R5, #-5
	CMP R7, R3
	BRn L38_tetris
	CONST R7, #16
	LDR R3, R5, #-6
	CMP R3, R7
	BRn L34_tetris
L38_tetris
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #128
	AND R7, R7, R3
	CONST R3, #0
	CMP R7, R3
	BRz L34_tetris
	CONST R7, #1
	JMP L25_tetris
L34_tetris
	CONST R7, #0
	LDR R3, R5, #3
	CONST R2, #0
	HICONST R2, #128
	AND R3, R3, R2
	CMP R3, R7
	BRz L39_tetris
	LDR R3, R5, #-1
	LDR R2, R5, #-2
	SLL R2, R2, #4
	LEA R1, cells
	ADD R2, R2, R1
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R3, R7
	BRz L39_tetris
	CONST R7, #1
	JMP L25_tetris
L39_tetris
	LDR R7, R5, #3
	SLL R7, R7, #1
	STR R7, R5, #3
L31_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L33_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #5
	ADD R3, R3, #4
	CMP R7, R3
	BRn L30_tetris
L27_tetris
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
L29_tetris
	LDR R7, R5, #-2
	LDR R3, R5, #4
	ADD R3, R3, #4
	CMP R7, R3
	BRn L26_tetris
	LDR R7, R5, #-3
L25_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_shape;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_shape
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #4
	STR R7, R5, #-2
	JMP L45_tetris
L42_tetris
	LDR R7, R5, #5
	STR R7, R5, #-1
	JMP L49_tetris
L46_tetris
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #128
	AND R7, R7, R3
	CONST R3, #0
	CMP R7, R3
	BRz L50_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #4
	LEA R2, cells
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #6
	STR R3, R7, #0
L50_tetris
	LDR R7, R5, #3
	SLL R7, R7, #1
	STR R7, R5, #3
L47_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L49_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #5
	ADD R3, R3, #4
	CMP R7, R3
	BRn L46_tetris
L43_tetris
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
L45_tetris
	LDR R7, R5, #-2
	LDR R3, R5, #4
	ADD R3, R3, #4
	CMP R7, R3
	BRn L42_tetris
L41_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;remove_filled_rows;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
remove_filled_rows
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-5	;; allocate stack space for local variables
	;; function body
	CONST R7, #14
	STR R7, R5, #-3
L53_tetris
	CONST R7, #0
	STR R7, R5, #-1
	STR R7, R5, #-4
	STR R7, R5, #-5
	JMP L60_tetris
L57_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #-3
	SLL R3, R3, #4
	LEA R2, cells
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L61_tetris
	LDR R7, R5, #-4
	ADD R7, R7, #1
	STR R7, R5, #-4
L61_tetris
L58_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L60_tetris
	LDR R7, R5, #-1
	CONST R3, #16
	CMP R7, R3
	BRn L57_tetris
	LDR R7, R5, #-4
	CONST R3, #16
	CMP R7, R3
	BRnp L63_tetris
	CONST R7, #1
	STR R7, R5, #-5
L63_tetris
	LDR R7, R5, #-5
	CONST R3, #0
	CMP R7, R3
	BRz L65_tetris
	LEA R7, score
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #-3
	STR R7, R5, #-2
	JMP L70_tetris
L67_tetris
	CONST R7, #0
	STR R7, R5, #-1
L71_tetris
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #4
	LEA R2, cells
	ADD R1, R3, R2
	ADD R1, R7, R1
	ADD R2, R2, #-16
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R1, #0
L72_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #16
	CMP R7, R3
	BRn L71_tetris
L68_tetris
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
L70_tetris
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRp L67_tetris
	LDR R7, R5, #-3
	ADD R7, R7, #1
	STR R7, R5, #-3
L65_tetris
L54_tetris
	LDR R7, R5, #-3
	ADD R7, R7, #-1
	STR R7, R5, #-3
	LDR R7, R5, #-3
	CONST R3, #-1
	CMP R7, R3
	BRp L53_tetris
L52_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-12	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-3
	JSR clear_tetris_array
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, L76_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L77_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L78_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L79_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L80_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L81_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #-1
	STR R7, R5, #-1
	JMP L83_tetris
L82_tetris
	JSR lc4_get_event
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-2
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRnp L85_tetris
	LDR R7, R5, #-2
	CONST R3, #32
	CMP R7, R3
	BRnp L85_tetris
	JSR clear_tetris_array
	ADD R6, R6, #0	;; free space for arguments
	CONST R7, #-1
	STR R7, R5, #-1
	CONST R7, #1
	STR R7, R5, #-3
	LEA R7, L87_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L85_tetris
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L88_tetris
	LDR R7, R5, #-1
	CONST R3, #-1
	CMP R7, R3
	BRnp L90_tetris
	CONST R7, #0
	STR R7, R5, #-1
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-10
	CONST R3, #4
	ADD R6, R6, #-1
	STR R3, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-11
	CONST R3, #2
	ADD R6, R6, #-1
	STR R3, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LDR R3, R5, #-10
	LDR R2, R5, #-11
	ADD R3, R3, R2
	ADD R7, R3, R7
	STR R7, R5, #-4
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-12
	CONST R3, #4
	ADD R6, R6, #-1
	STR R3, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LDR R3, R5, #-12
	ADD R7, R3, R7
	STR R7, R5, #-5
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_rand_power2
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-6
	LDR R7, R5, #-4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-5
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_for_collision
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #3	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L92_tetris
	CONST R7, #0
	STR R7, R5, #-3
	LEA R7, L94_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR print_num
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L95_tetris
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L92_tetris
L90_tetris
	LDR R7, R5, #-4
	STR R7, R5, #-7
	LDR R7, R5, #-1
	STR R7, R5, #-9
	LDR R7, R5, #-6
	STR R7, R5, #-8
	LDR R7, R5, #-2
	CONST R3, #106
	CMP R7, R3
	BRnp L96_tetris
	LDR R7, R5, #-4
	ADD R7, R7, #-1
	STR R7, R5, #-7
	JMP L97_tetris
L96_tetris
	LDR R7, R5, #-2
	CONST R3, #107
	CMP R7, R3
	BRnp L98_tetris
	LDR R7, R5, #-4
	ADD R7, R7, #1
	STR R7, R5, #-7
	JMP L99_tetris
L98_tetris
	LDR R7, R5, #-2
	CONST R3, #97
	CMP R7, R3
	BRnp L100_tetris
	LDR R7, R5, #-6
	ADD R7, R7, #-1
	AND R7, R7, #3
	STR R7, R5, #-8
	JMP L101_tetris
L100_tetris
	LDR R7, R5, #-2
	CONST R3, #115
	CMP R7, R3
	BRnp L102_tetris
	LDR R7, R5, #-6
	ADD R7, R7, #1
	AND R7, R7, #3
	STR R7, R5, #-8
	JMP L103_tetris
L102_tetris
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-9
L103_tetris
L101_tetris
L99_tetris
L97_tetris
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-6
	LDR R3, R5, #-5
	SLL R3, R3, #2
	LEA R2, shapes
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_shape
	ADD R6, R6, #4	;; free space for arguments
	LDR R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-8
	LDR R3, R5, #-5
	SLL R3, R3, #2
	LEA R2, shapes
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_for_collision
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #3	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRnp L104_tetris
	LDR R7, R5, #-9
	STR R7, R5, #-1
	LDR R7, R5, #-7
	STR R7, R5, #-4
	LDR R7, R5, #-8
	STR R7, R5, #-6
	LDR R7, R5, #-5
	LEA R3, colors
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-4
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-1
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-6
	SLL R7, R7, #2
	LEA R2, shapes
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_shape
	ADD R6, R6, #4	;; free space for arguments
	JMP L105_tetris
L104_tetris
	LDR R7, R5, #-5
	LEA R3, colors
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-4
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-1
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R5, #-6
	SLL R7, R7, #2
	LEA R2, shapes
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_shape
	ADD R6, R6, #4	;; free space for arguments
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRnp L106_tetris
	JSR remove_filled_rows
	ADD R6, R6, #0	;; free space for arguments
	CONST R7, #-1
	STR R7, R5, #-1
L106_tetris
L105_tetris
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
L88_tetris
L83_tetris
	JMP L82_tetris
	CONST R7, #0
L75_tetris
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
cells 		.BLKW 240
		.DATA
L95_tetris 		.STRINGZ "Game Over\n"
		.DATA
L94_tetris 		.STRINGZ "Score:\n"
		.DATA
L87_tetris 		.STRINGZ "Game On!\n"
		.DATA
L81_tetris 		.STRINGZ "Press space bar to start\n"
		.DATA
L80_tetris 		.STRINGZ "Press a to rotate counter-clockwise\n"
		.DATA
L79_tetris 		.STRINGZ "Press s to rotate clockwise\n"
		.DATA
L78_tetris 		.STRINGZ "Press k to go right\n"
		.DATA
L77_tetris 		.STRINGZ "Press j to go left\n"
		.DATA
L76_tetris 		.STRINGZ "!!! Welcome to Tetris !!!\n"
		.DATA
L5_tetris 		.STRINGZ "\n"
		.DATA
L4_tetris 		.STRINGZ "0\n"
