// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/SetFill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(InfLoop)
	// Keyboard address is address 24576
	@24576
	D=M

	@KeyPressed
	D;JGT

	@NoKeyPressed
	0;JMP

(KeyPressed)
	// If pressed, enter set SetFill to ON and enter While Loop
	@R0
	M=-1

	@SetFill
	0;JMP

(NoKeyPressed)
	// If no key is pressed, set SetFill to off
	// to wait for input
	@R0
	M=0

	@SetFill
	0;JMP
	
(SetFill)
	// 2^8 * 32  (number of addresses * lines on screen)
	// == 8192, so fill from 0 to 8191
	@8191
	D=A
	@R1
	M=D

(While)
	@R1
	D=M
	@Position
	M=D

	//Screen value is address 16384
	@16384
	D=A
	@Position
	M=M+D

	@R0
	D=M
	@Position
	A=M
	M=D

	// --R1
	@R1
	D=M-1
	M=D

	// Condition for exit: while(count >= 0)
	@While
	D;JGE

	// Inifinite Loop
	@InfLoop
	0;JMP