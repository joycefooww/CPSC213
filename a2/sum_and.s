.pos 0x100
                 ld   $b, r0                # r0 = address of b/b[0]
                 ld   $4, r2                # r2 = value 4
                 add  r0, r2                # r2 = address of b[1]
                 ld   $sum, r3              # r3 = address of sum
                 ld   $and, r4              # r4 = address of and
                 ld   (r0), r0              # r0 = b[0]
                 mov  r0,  r1               # r1 = b[0]
                 ld   (r2), r5              # r5 = b[1]
                 add  r5, r1                # r1 = b[0] + b[1]
                 st   r1, (r3)              # sum = r1
                 and  r5, r0                # r0 = b[0] & b[1]
                 st   r0, (r4)              # and = r1
                 halt





.pos 0x1000
sum:               .long 0x0                # sum
and:               .long 0x0                # and
.pos 0x2000
b:               .long 0xA         # b[0] = 2
                 .long 0xB         # b[1] = 3