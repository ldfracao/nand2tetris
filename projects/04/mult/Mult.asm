// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// initializes R2 to zero
@R2
M=0

// if any of the numbers are 0, result is 0 and program can end
// accesses R0 and stores it in var0
@R0
D=M
@var0
M=D
@END
D;JEQ
// accesses R1 and stores it in var1
@R1
D=M
@var1
M=D
@END
D;JEQ

(LOOP)
// accesses var0 and stores its value in the data register
@var0
D=M
// accesses R2 and stores its contents plus the data register which holds R0
@R2
M=M+D
// accesses var1, stores it in the data register, decrement it by 1, and stores the value back to R1
@var1
D=M
D=D-1
M=D
// while the value of R1 is greater than 0 loop.
@LOOP
D;JGT

(END)
    @END
    0;JMP