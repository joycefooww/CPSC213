.pos 0x100

    # i  = a[j]
    ld $j, r0           # r0 = address of j
    ld (r0), r0         # r0 = value of j
    ld $a, r1           # r1 = address of a
    mov r1, r5          # r5 = address of a
    ld (r1, r0, 4), r2  # r2 = a[j]
    ld $i, r1           # r1 = address of i
    st r2, (r1)         # m[r[1]] = a[j]

    # i = i & 9
    ld $9, r3           # r3 = 9
    and r2, r3          # r3 = i & 9
    st r3, (r1)         # i = i & 9

    # i  = a[i]
    ld (r5, r3, 4), r4  # r4 = a[i]
    st r4, (r1)         # i = a[i]

    # p  = &j
    ld $p, r1           # r1 = address of p
    ld $j, r0           # r0 = address of j
    mov r0, r6
    st r0, (r1)         # p = &j
    ld (r0), r0         # r0 = value of j
    dec r0              # j++ & *p = *p - 2
    st r0, (r6)         # j++ & *p = *p - 2


    ld (r5, r0, 4), r4  # r4 = a[j]
    shl $2, r4          # r4 = a[j] * 4
    add r5, r4          # r4 = &a[a[j]]
    st r4, (r1)

    ld $16, r2          # r2 = 16
    add r2, r5          # address of a[4]
    ld (r5), r2         # r2 = value of a[4]
    ld (r4), r1         # r1 = p*
    add r1, r2          # r2 = *p + a[4]
    st r2, (r4)         # *p = *p + a[4]



    halt


.pos 0x1000
i:               .long 0               # i
j:               .long 3               # j
p:               .long 0x3000          # p
.pos 0x2000
a:  .long 10            # a[0]
    .long 9             # a[1]
    .long 8             # a[2]
    .long 7             # a[3]
    .long 6             # a[4]
    .long 5             # a[5]
    .long 4             # a[6]
    .long 3             # a[7]
    .long 2             # a[8]
    .long 1             # a[9]
