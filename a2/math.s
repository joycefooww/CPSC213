.pos 0x100
                 ld   $a, r0              # r0 = address of a
                 ld   $b, r1              # r1 = address of b
                 ld   (r1), r2            # r2 = value of b
                 mov  r2, r3              # r3 = temp value of b
                 shr  $1, r3              # r3 = b/2
                 inc  r2                  # r2 = b + 1
                 add  r2, r3              # r3 = (b+1) + b/2
                 dec  r2                  # b
                 and  r2, r3              # r3 = ((b+1) + b/2) & b
                 shl  $2, r3              # r3 = (((b+1) + b/2) & b) << 2
                 st   r3, (r0)            # a = (((b+1) + b/2) & b) << 2

                 halt                     # halt
.pos 0x1000
a:               .long 0xFFFFFFF8                #
b:               .long 0x7
