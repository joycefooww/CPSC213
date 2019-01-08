.pos 0x1000

ldi:    ld    $0x11223344, r0
        ld    $0x11223344, r7
        halt

ownadd: ld  $data, r1
        ld  $3,    r2
        ld  $7,    r3
        ld  $9,    r4
        add r2, r3
        add r2, r4
        halt

ld:   ld  $data, r1
      ld  $1,    r2
      ld  4(r1), r3
      halt

st:   ld  $data, r1
      ld  $1,    r2
      ld  $3,    r3
      st  r2, 4(r1)
      st  r3, 8(r1)
      halt

li:   ld  $data, r1
      ld  $0,    r2
      ld  $1,    r3
      ld  (r1,r2,4), r4     # r4 <= m[data + 0]
      ld  (r1,r3,4), r5     # r5 <= m[data + 4]
      halt
si:   ld  $data, r1
      ld  $0, r2
      ld  $3, r3
      ld  $1, r4
      st  r3, (r1, r2, 4)   # m[data + 0] <= 3
      st  r4, (r1, r4, 4)   # m[data + 4] <= 1
      halt
rmov: ld  $1, r1
      mov r1, r2            # r2 <= 1
      halt
add:  ld  $1, r1
      ld  $2, r2
      add r1, r2            # r2 <= 1 + 2
      halt
and:  ld  $10, r1
      ld  $6, r2
      and r1, r2            # r2 <= 10 & 6 == 0b1010 & 0b0110 == 0b0010 == 2
      halt
inc:  ld  $1, r1
      inc r1                # r1 <= 1 + 1
      halt
inca: ld  $1, r1
      inca r1               # r1 <= 1 + 4
      halt
dec:  ld  $2, r1
      dec r1                # r1 <= 2 - 1
      halt
deca: ld  $5, r1
      deca r1               # r1 <= 5 - 4
      halt
not:  ld  $0xffff0000, r1
      not r1                # r1 <= ! 0xffff0000 == 0x0000ffff
      halt
shl:  ld  $0x12345678, r1
      shl $17, r1            # r1 <= 0x1234567 << 17 == 0xacf0000
      halt

.pos 0x2000
data: .long 1
      .long 2
