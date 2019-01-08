.pos 0x100

avg:
ld $24, r0      # r0 = 24
ld $n, r1       # r1 = &n
ld (r1), r1     # r1 = n
ld $s, r3       # r3 = &s
ld (r3), r3     # r3 = base
avgloop:
beq r1, sort #if n=0, end loop
ld $0, r2       # r2 = 0 = tempvar
ld 4(r3), r4    # r4 = grade[0]
add r4, r2
ld 8(r3), r4    # r4 = grade[1]
add r4, r2
ld 12(r3), r4   # r4 = grade[2]
add r4, r2
ld 16(r3), r4   # r4 = grade[3]
add r4, r2
shr $2, r2      # r2 = temp/4
st r2, 20(r3)   # s.average = r2
dec r1          # n--
add r0, r3      # base + 24
br avgloop      # go back to loop

sort:
ld $n, r0
ld (r0), r0     # r0 = n;
dec r0          # r0 = n-1
outerloop:
beq r0, end_outerloop
mov r0, r2      # r2 = n-1
ld  $1, r1      # j = 1

innerloop:
beq r2, end_innerloop

gpc $6, r6
j conditionalswap

inc r1
dec r2
br innerloop

end_innerloop:
dec r0
br outerloop

conditionalswap:
ld $s, r3
ld (r3), r3     # base
mov r1, r4      # r4 = j
mov r1, r5      # r5 = j
shl $3, r4
shl $4, r5
add r4, r5      # r5 = 24j
mov r1, r4      # r4 = j
dec r4          # r4 = j-1
mov r4, r7
shl $3, r7
shl $4, r4
add r4, r7      # r7 = 24(j-1)
add r3, r5      # r5 = &s[j]
add r3, r7      # r7 = &s[j-1]
ld 20(r5), r4   # r4 = s[j].avg
ld 20(r7), r3   # r3 = s[j-1].avg
not r4
inc r4
add r3, r4
bgt r4, swap
br else

swap:
ld (r5), r4     # t = s[j]
ld (r7), r3     # r3 = s[j-1]
st r3, (r5)
st r4, (r7)

ld 4(r5), r4   # t = s[j]->value
ld 4(r7), r3   # r3 = s[j-1]->value
st r3, 4(r5)
st r4, 4(r7)

ld 8(r5), r4   # t = s[j]->value
ld 8(r7), r3   # r3 = s[j-1]->value
st r3, 8(r5)
st r4, 8(r7)

ld 12(r5), r4   # t = s[j]->value
ld 12(r7), r3   # r3 = s[j-1]->value
st r3, 12(r5)
st r4, 12(r7)

ld 16(r5), r4   # t = s[j]->value
ld 16(r7), r3   # r3 = s[j-1]->value
st r3, 16(r5)
st r4, 16(r7)

ld 20(r5), r4   # t = s[j]->value
ld 20(r7), r3   # r3 = s[j-1]->value
st r3, 20(r5)
st r4, 20(r7)


else:
j 0(r6)

end_outerloop:
ld $n, r0
ld (r0), r0
shr $1, r0
mov r0, r1
shl $3, r0
shl $4, r1
add r1, r0
ld $s, r1
ld (r1), r1
add r1, r0
ld (r0), r0
ld $m, r2
st r0, (r2)


halt

.pos 0x3000
n:    .long 3     # just one student
m:    .long 0     # put the answer here
s:    .long base  # address of the array
base: .long 1234  # student ID
      .long 80    # grade 0
      .long 60    # grade 1
      .long 78    # grade 2
      .long 90    # grade 3
      .long 0     # computed average
      .long 1235  # student ID
      .long 40    # grade 0
      .long 40    # grade 1
      .long 40    # grade 2
      .long 40    # grade 3
      .long 0     # computed average
      .long 1236  # student ID
      .long 50    # grade 0
      .long 50    # grade 1
      .long 50    # grade 2
      .long 50    # grade 3
      .long 0     # computed average


