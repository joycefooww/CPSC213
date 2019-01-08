.pos 0x100
                 ld   $t, r0                # r0 = address of t
                 ld   $0x2000, r1           # r1 = address of array
                 ld   $8, r2                # r2 = value 8
                 add  r1, r2                # r2 = address of array[2]
                 ld   (r2), r3              # r3 = value of array[2]
                 st   r3, (r0)              # t = array[2]
                 ld   $4, r4                # r4 = value 4
                 add  r3, r4                # t = t + 4
                 st   r4, (r0)              # update t in memory
                 add  r4, r3                # r3 = array[2] + t
                 ld   $4, r2                # r2 = 4
                 add  r1, r2                # address of array[1]
                 st   r3, (r2)              # array[1] = array[2] + t
                 st   r4, (r1)              # array[0] = t

                 halt





.pos 0x1000
t:                 .long 0x0                # t

.pos 0x2000
array:             .long 0x0         # array[0] = 0
                   .long 0x0         # array[1] = 0
                   .long 0x5         # array[2] = 5