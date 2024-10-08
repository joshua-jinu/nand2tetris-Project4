// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(INIT)
    @8192
    D=A
    @n
    M=D

(LOOP)
    @n
    M=M-1
    D=M
    @INIT
    D;JLT
    @KBD
    D=M
    @CLEAR
    D;JEQ
    @FILL
    0;JGT

    
    (FILL)
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1
    @LOOP
    0;JMP
    
    
    (CLEAR)
    @SCREEN
    D=A
    @n
    A=D+M
    M=0
    @LOOP
    0;JMP