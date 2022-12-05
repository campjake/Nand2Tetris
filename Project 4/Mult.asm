// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Multiplication = Repeated Addition
// Begin a loop that will add two positive nums
// Confirm that R1 & R2 >= 0

// First set undefined R2 to 0
(Start)
	@R2
	M=0

(Expression)
	//Check if R0 is negative, else step into next op
	@R0
	D=M
	@End
	D;JLT
	
	// Check if R1 is > 0 (avoid setting R2 to 0)
	@R1
	D=M
	@Product
	D;JLE

	// If successful, add R0 to R2
	@R0
	D=M
	@R2
	M=M+D

	// Then --R1
	@R1
	M=M-1
	D=M

	// Loop again if R1 > 0
	@Expression
	D;JGT

// End program

(End)
@End
0;JMP
