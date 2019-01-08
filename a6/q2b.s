.pos 0x100
start:
	ld $sb, r5                  # sp = address of last word of stack
	inca    r5                  # sp = address of word after stack
	gpc $6, r6                  # store return address
	j main                      # jump to main
	halt
	
f:	
	deca r5             # decrement stack
	ld $0, r0           # j = r0 = 0
	ld 4(r5), r1        # r1 = a0
	ld $0x80000000, r2  # l0 = r2 = 0x80000000
f_loop:
	beq r1, f_end       # if a0 = 0, f_end
	mov r1, r3          # l1 = r3 = a0
	and r2, r3          # l1 = r3 = a0 & r2
	beq r3, f_if1       # if l1 = 0, go to f_if1
	inc r0              # j++
f_if1:
	shl $1, r1          # r1 = a0 = a0 * 2
	br f_loop           # go back to loop
f_end:
	inca r5             # increment stack and free argument
	j(r6)               # return
	
main:
	deca r5                 # allocate callee part of main frame
	deca r5                 # allocate callee part of main frame
	st r6, 4(r5)            # store ra in last word of stack
	ld $8, r4               # r4 = i = 8
main_loop:
	beq r4, main_end        # if i = 0, end loop
	dec r4                  # i--
	ld $x, r0               # r0 = &x
	ld (r0,r4,4), r0        # r0 = x[i]
	deca r5                 # allocate callee part of loop
	st r0, (r5)             # a0 = x[i] in stack
	gpc $6, r6              # store ra
	j f                     # f(a0)
	inca r5                 # increment stack again
	ld $y, r1               # r1 = address of y
	st r0, (r1,r4,4)        # y[i] = f(a0)
	br main_loop            # go back to main loop
main_end:
	ld 4(r5), r6            # reload return address
	inca r5                 # deallocate stack
	inca r5                 # deallocate stack
	j (r6)                  # jump to start
	
.pos 0x2000
x:
	.long 1
	.long 2
	.long 3
	.long 0xffffffff
	.long 0xfffffffe
	.long 0
	.long 184
	.long 340057058
	
y:
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	
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

