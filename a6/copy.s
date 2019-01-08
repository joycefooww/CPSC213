.pos 0x100
start:           ld   $stackBtm, r5       # [01] sp = address of last word of stack
                 inca r5                  # [02] sp = address of word after stack
                 gpc  $6, r6              # [03] ra = pc + 6
                 j    main                # [04] call main()
                 halt

.pos 0x200
main:            deca r5                  # [05] allocate callee part of main's frame
                 st   r6, (r5)            # [06] save ra on stack

                 gpc  $6, r6              # [13] r6 = pc + 6
                 j    copy                # [14] call copy()


                 ld   0x0(r5), r6         # load return address
                 inca r5                  # restore stack pointer
                 j    0x0(r6)             # jump back to start


.pos 0x300
copy:            ld   $0xfffffff4, r0    # r0 = -12
                 add  r0, r5             # allocate frame
                 st   r6, 0x8(r5)        # store ra
                 ld   $0x0, r1           # r1 = 0
                 st   r1, 0x0(r5)        # dst[0] = 0
                 ld   $0x0, r2           # r2 = 0
                 st   r2, 0x4(r5)        # dst[1] = 0
                 deca r5                 # allocate for i
                 ld   $0x0, r0           # r0 = 0
                 st   r0, 0x0(r5)        # i = 0
                 ld   $src, r3
                 inca r5                 # deallocate for loop

loop:
                 ld   (r3, r0, 4), r4    # r3 = src[i]
                 beq r4, end_loop        # if src[i], goto end_loop
                 st r4, (r5, r0, 4)      # dst[i] = src[i]
                 inc r0                  # i++
                 br loop                 # go back loop

end_loop:        ld $0, r4               # r4 = 0
                 st r4, (r5, r0, 4)      # dst[i] = 0
                 deca r5
                 st r0, (r5)             # i
                 inca r5
                 ld  0x8(r5), r6         # load ra from stack
                 ld $12, r4              # r4 = 12 deallocate frame
                 add r4, r5
                 j    0x0(r6)            # go back to main








.pos 0x1000
src: .long 0x1
	 .long 0x1
     .long 0x1010
	 .long 0xff000000 # nop
	 .long 0xffffffff # series of nops
	 .long 0xff000100 # nop & load -1 into r1
	 .long 0xffffffff # r1 = -1
	 .long 0xff000200 # nop & load -1 into r2
	 .long 0xffffffff # r2 = -1
	 .long 0xff000300 # nop & load -1 into r3
	 .long 0xffffffff # r3 = -1
	 .long 0xff000400 # nop & load -1 into r4
	 .long 0xffffffff # r4 = -1
	 .long 0xff000500 # nop & load -1 into r5
	 .long 0xffffffff # r5 = -1
	 .long 0xff000600 # nop & load -1 into r6
	 .long 0xffffffff # r6 = -1
	 .long 0xff000700 # nop & load -1 into r7
	 .long 0xffffffff # r7 = -1
	 .long 0xff000000 # nop & load -1 into r0
	 .long 0xffffffff # r0 = -1
	 .long 0xf000f000 # halt




.pos 0x7000
stackTop:        .long 0x00000000
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
stackBtm:        .long 0x00000000
