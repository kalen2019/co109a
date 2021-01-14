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

// Put your code here.

@8192   //16384~24575  screen
D=A
@R0
M=D     // R0 = 8192
@24576
D=M
@LOOP1
D;JNE   // if press keyboard go to LOOP1
@LOOP2
D;JEQ   // if do not press any keyboard go to LOOP2
(LOOP1)
@R0
D=M     // D = R0
M=M-1   // R0 = R0 - 1
@R0
D;JEQ   // if D == 0 JUMP
@24576
A=A-D   // read every screen address
M=-1    // set screen black
@LOOP1
0;JMP   // go to LOOP
(LOOP2)
@R0     
D=M     // D = R0
M=M-1   // R0 = R0 - 1
@R0
D;JEQ   // if D == 0 JUMP
@16383
A=D+A   // read every screen address
M=0     // set screen white
@LOOP2
0;JMP   // go to LOOP2
