.pos 0x0
        ld   $sb, r5                    # sp = address of last word of stack
        inca r5                         # sp = address of word after stack
        gpc  $6, r6                     # r6 = pc + 6
        j    0x300                      # call function at 0x300
        halt
	
.pos 0x100
        .long 0x00001000
	
.pos 0x200
        ld   0x0(r5), r0        # r0 = a0
        ld   0x4(r5), r1        # r1 = a1
        ld   $0x100, r2         # r2 = 0x100 (x pointer)
        ld   0x0(r2), r2        # r2 = 0x00001000 (x)
        ld   (r2, r1, 4), r3    # r3 = x[a1] = 0
        add  r3, r0             # r0 = a0 + x[a1] = 3
        st   r0, (r2, r1, 4)    # x[a1] = r0 = 3
        j    0x0(r6)            # go back to function
	
.pos 0x300
        ld   $0xfffffff4, r0    # r0 = -12
        add  r0, r5             # allocate frame
        st   r6, 0x8(r5)        # store return address to stack
        ld   $0x1, r0           # r0 = l0 = 1
        st   r0, 0x0(r5)        # l0 = 1
        ld   $0x2, r0           # r0 = l1 = 2
        st   r0, 0x4(r5)        # l1 = 2
        ld   $0xfffffff8, r0    # r0 = -8
        add  r0, r5             # allocate frame
        ld   $0x3, r0           # r0 = a0 = 3
        st   r0, 0x0(r5)        # a0 = 3
        ld   $0x4, r0           # r0 = a1 = 4
        st   r0, 0x4(r5)        # a1 = 4
        gpc  $6, r6             # set return address
        j    0x200              # ping(a0, a1)
        ld   $0x8, r0           # deallocate frame (arguments)
        add  r0, r5             # deallocate frame (arguments)
        ld   0x0(r5), r1        # r1 = l0 = 1
        ld   0x4(r5), r2        # r2 = l1 = 2
        ld   $0xfffffff8, r0    # r0 = -8
        add  r0, r5             # allocate frame again
        st   r1, 0x0(r5)        # a0 = l0
        st   r2, 0x4(r5)        # a1 = l1
        gpc  $6, r6             # set return address
        j    0x200              # call ping(a0, a1)
        ld   $0x8, r0           # r0 = 8
        add  r0, r5             # deallocate frame
        ld   0x8(r5), r6        # load return address
        ld   $0xc, r0           # r0 = 12
        add  r0, r5             # deallocate callee part of this function
        j    0x0(r6)            # jump back to main

.pos 0x1000
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000         
        .long 0x00000000
	
.pos 0x8000
	# These are here so you can see (some of) the stack contents.
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
sb: 	.long 0
