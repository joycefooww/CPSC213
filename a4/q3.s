.pos 0x1000
code:

        #v0 = s.x[i]
        ld $i, r0           #r0 = address of i
        ld (r0), r0         #r0 = value of i
        ld $s, r1           #r1 = base address of struct S
        ld (r1, r0, 4), r2  #r2 = s.x[i]
        ld $v0, r3          #r3 = address of v0
        st r2, (r3)         #v0 = s.x[i]

        #v1 = s.y[i]
        ld $2, r2           #r2 = 2
        ld (r1, r2, 4), r2  #r2 = address of s_y
        ld (r2, r0, 4), r2  #r2 = s.y[i]
        ld $v1, r3          #r3 = address of v1
        st r2, (r3)         #v1 = s.y[i]

        #v2 = s.z->x[i]
        ld $3, r2           #r2 = 3
        ld (r1, r2, 4), r2  #r2 = address of s.z
        ld (r2, r0, 4), r4  #r4 = s.z->x[i]
        ld $v2, r3          #r3 = address of v2
        st r4, (r3)         #v2 = s.z->x[i]

        #v3 = s.z->z->y[i]
        ld $3, r5           #r5 = 3
        ld (r2, r5, 4), r2  #r2 = address of s.z->z
        dec r5              #r5 = 2
        ld (r2, r5, 4), r2  #r2 = address of s.z->z->y
        ld (r2, r0, 4), r2  #r2 = address of s.z->z->y[i]
        ld $v3, r3          #r3 = address of v3
        st r2, (r3)         #v3 = s.z->z->y[i]




.pos 0x2000
static:
i:      .long 0         #i
v0:     .long 0         #v0
v1:     .long 0         #v1
v2:     .long 0         #v2
v3:     .long 0         #v3
s:      .long 0         #x[0]
        .long 0         #x[1]
        .long s_y       #address of s.y
        .long s_z       #address of s.z


.pos 0x3000
heap:
s_y:     .long 0 # s.y[0]
         .long 0 # s.y[1]
s_z:     .long 0 # s.z->x[0]
         .long 0 # s.z->x[1]
         .long 0 # s.z->y
         .long s_z_z # s.z->z
s_z_z:   .long 0 # s.z->z->x[0]
         .long 0 # s.z->z->x[1]
         .long s_z_z_y #s.z->z->y
         .long 0 # s.z->z->z
s_z_z_y:  .long 0 # s.z->z->y[0]
         .long 0 # s.z->z->y[1]

