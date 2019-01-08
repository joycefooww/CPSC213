.pos 0x100
start:
        ld   $sb, r5            # load stack bottom
        inca r5                 # address of word after stack bottom
        gpc  $6, r6             # pc + 6
        j    main               # jump to main
        halt

.pos 0x200
main:
	deca r5                     # address of stackbottom
	st   r6, (r5)               # store return address
	ld   $-12, r1               # allocate frame
	add  r1, r5                 # allocate frame of size 3
	ld   $a, r0                 # r0 = &a
	st   r0, 0x0(r5)            # a0 = store address of a in stack
	ld   $val, r0               # r0 = $val
	ld   (r0), r0               # r0 = val
	st   r0, 0x4(r5)            # a1 = store val in stack
	ld   $size, r0              # r0 = &size
	ld   (r0), r0               # r0 = size of a
	st   r0, 0x8(r5)            # a2 = size
	gpc  $6, r6                 # pc + 6
	j    search                 # go to search
	ld   $12, r1
	add  r1, r5
	ld   $ret, r1
	st   r0, (r1)
	ld   (r5), r6
	inca r5
	j    (r6)

.pos 0x300
search:
	ld   0x8(r5), r0            # r0 = a2
	beq  r0, L3                 # if a2 = 0 goto L3
	ld   0x0(r5), r1            # r1 = a0 = start
	ld   0x4(r5), r2            # r2 = a1
	mov  r0, r3                 # r3 = a2 = size
	shr  $1, r3                 # size/2
	mov  r3, r4                 # r4 = size/2
	shl  $2, r4                 # r4 = size * 2
	add  r1, r4                 # r4 = a0 + r4 = half
	ld   (r4), r7               # r7 = value of a[a0+r4]
	not  r7
	inc  r7                     # -value of a[a0+r4]
	add  r2, r7                 # r7 = r2 + r7
	beq  r7, L2                 # if r7 = value
	bgt  r7, L0                 # if value > a[a0+r4]
	br   L1                     # go back to loop
L0:
	mov  r4, r1                 # move end to start
	inca r1                     # r1 + 1
	not  r3                     # -size/2
	add  r0, r3                 # size - size/2 - 1
L1:
	st   r3, 0x8(r5)
	j    search
    add  r1, r5
    br   L3
L2:
	mov  r4, r0
L3:
	j    (r6)

.pos 0x1000
a:	.long 0x1
    .long 0x3
    .long 0x4
	.long 0x7
	.long 0x9
    .long 0xA
    .long 0xC
	.long 0x10
	.long 0x12
    .long 0x13
	.long 0x14
	.long 0x17
	.long 0x1A
	.long 0x1B
	.long 0x1F

size:	.long 15
val:	.long 0x12
ret:	.long 0xFFFFFFFF

.pos 0x8000
stack:
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

