.pos 0x1000

gpc:    gpc   $6, r2
        gpc   $2, r3
        gpc   $1234, r4
        halt

br:     br bgt
        br add
        halt


beq:    ld  $7, r1
        beq r1, j
        ld  $0, r1
        beq r1, add

        halt

bgt:    ld  $7, r1
        bgt r1, add
        ld  $0, r1
        bgt r1, and

        halt

j:      j add
        j and
        halt

jo:    ld  $4, r1
       ld  $8, r2
       j 0(r1)
       j 0(r2)
       halt


add:  ld  $1, r1
      ld  $2, r2
      add r1, r2            # r2 <= 1 + 2
      halt
and:  ld  $10, r1
      ld  $6, r2
      and r1, r2            # r2 <= 10 & 6 == 0b1010 & 0b0110 == 0b0010 == 2

      halt
