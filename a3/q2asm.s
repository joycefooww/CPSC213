

.pos 0x100


    # a[0] = s[tos] + tos
    ld $0, r0               # r0 = value of tos and tmp
    ld $s, r1               # r1 = address of s
    ld (r1), r1             # r1 = value of s/address of s_ar
    ld (r1), r2             # r2 = value of s_ar/s[tos]
    add r0, r2              # r2 = s[tos] + tos
    ld $a, r0               # r0 = address of a
    st r2, (r0)             # a[0] = s[tos] + tos

    ld $1, r2               # r2 = tos++

    # a[1] = s[tos] + tos
    ld (r1, r2, 4), r3      # r3 = s[tos]
    add r2, r3              # r3 = s[tos] + tos
    st r3, (r0, r2, 4)      # a[1] = s[tos] + tos


    # a[2] = s[tos] + tos;
    inc r2                  # r2 = tos++
    ld (r1, r2, 4), r3      # r3 = s[tos]
    add r2, r3              # r3 = s[tos] + tos
    st r3, (r0, r2, 4)      # a[2] = s[tos] + tos

    inc r2
    dec r2
    ld $tmp, r4             # r4 = address of tmp
    ld (r0, r2, 4), r3      # r3 = a[tos]
    st r3, (r4)             # tmp = a[tos]

    dec r2                  # tos--
    ld (r0, r2, 4), r5      # r5 = a[tos]
    add r5, r3              # r3 = tmp + a[tos]
    st r3, (r4)             # tmp = tmp + a[tos]

    dec r2                  # tos--
    ld (r0, r2, 4), r5      # r5 = a[tos]
    add r5, r3              # r3 = tmp = tmp + a[tos]
    st r3, (r4)             # tmp = tmp + a[tos]
    st r3, (r1)             # s[0] = tmp





    halt


.pos 0x2000
a:   .long 0
     .long 0
     .long 0
s:   .long 0x3000
tos: .long 0
tmp: .long 0

.pos 0x3000
s_ar:.long 0
     .long 0
     .long 0
     .long 0
     .long 0
