
.pos 0x100


                 ld   $array, r0        # r0 = address of 'array'
                 ld   (r0), r0          # r0 = address of array
                 ld   $2, r1
                 ld   (r0, r1, 4), r1   # t = r1 = array[2]
                 mov  r1, r2            # r2 = array[2]
                 inca r1                # t = t + 4
                 ld   $t, r3            # r3 = address of t
                 st   r1, (r3)          # t = r1
                 add  r1, r2            # r2 = array[2] + t
                 ld   $1, r3            # r3 = 1
                 st   r2, (r0, r3, 4)   # array[1] = r2 = array[2] + t
                 st   r1, (r0)          # array[0] = t

                 halt                   # halt


.pos 0x1000
t:     .long 0x0
array: .long 0x2000

.pos 0x2000
array_data: .long 0
            .long 0
            .long 0

