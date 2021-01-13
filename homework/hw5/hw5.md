1. Bit

CHIP Bit {
    IN in, load;
    OUT out;

    PARTS:
    // Put your code here:
    Mux(a=outdf, b=in, sel=load, out=outmux);
    DFF(in=outmux, out=out, out=outdf)
}

<img src="hw5_pic/Bit.jpg" width="800" height="600"  align=center />

2.Register

