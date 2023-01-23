// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(RESET)
// the screen is 512 x 256, and each buffer has 16bits, so each column has 512/16 (32) sets of 16bits and 256 rows, so one can fit 32 X 256 = 8192 16bit sets into this buffer
// counters for the "blackens" and "whitens" functions
@8192
D=A
@count
M=D
@8192
D=A
@count2
M=D

// Declares screen_array variable which contains the address of the screen buffer
@SCREEN
D=A
@screen_array
M=D

// offset variable used to sweep the entire screen buffer
@i
M=0
@j
M=0

// loops until a key is pressed
(INPUT)
@KBD
D=M
@BLACKENS
D;JGT
@INPUT
D;JEQ

// when a key is pressed blackens the screen by writing -1 to the entire buffer, when no keys are pressed jumps to "whitens"
(BLACKENS)
@KBD
D=M
@WHITENS
D;JEQ

@screen_array
D=M
@i
A=D+M
M=-1

@i // i++
M=M+1

@count //count--
M=M-1
D=M
@RESET // jumps to the beginning when count reaches 0
D;JEQ

@BLACKENS
D=M
D;JGT

// when no keys are pressed, keeps writing 0s to the screen buffer
(WHITENS)
@KBD
D=M
@BLACKENS
D;JGT

@screen_array
D=M
@j
A=D+M
M=0

@j //j++
M=M+1

@count2 // jumps to the beginning when count2 reaches 0
M=M-1
D=M
@RESET
D;JEQ

@WHITENS
D=M
D;JEQ

(END)
@END
0;JMP