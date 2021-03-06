1.Not

<img src="hw1_pic/Not.jpg" width="300" height="200"  align=center />

/**
 * Not gate:
 * out = not in
 */

CHIP Not {
    IN in;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=in, b=in, out=out);
}

2.And

<img src="hw1_pic/And.jpg" width="300" height="200"  align=center />

/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=a, b=b, out=AnandB);
    Not(in=AnandB,out=out);
}

3.Or

<img src="hw1_pic/Or.jpg" width="300" height="200"  align=center />

/**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=a, out=na);
    Not(in=b, out=nb);
    Nand(a=na, b=nb, out=out);
}

4.Xor

<img src="hw1_pic/Xor.jpg" width="300" height="200"  align=center />

/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=a, out=na);
    Not(in=b, out=nb);
    And(a=a, b=nb, out=aa);
    And(a=na, b=b, out=ab);
    Or(a=aa, b=ab, out=out);
}

5.Mux

<img src="hw1_pic/Mux.jpg" width="300" height="200"  align=center />

/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in=sel, out=nsel);
    And(a=a, b=nsel, out=ans);
    And(a=b, b=sel, out=bs);
    Or(a=ans, b=bs, out=out);
}

6.DMux

<img src="hw1_pic/DMux.jpg" width="300" height="200"  align=center />

/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    // Put your code here:
    Not(in=sel, out=nsel);
    And(a=in, b=nsel, out=a);
    And(a=in, b=sel, out=b);
}
