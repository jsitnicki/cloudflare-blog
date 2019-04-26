
bpf/filter.o:	file format ELF64-BPF

Disassembly of section .text:
sub64_ir:
       0:	r0 = r1
       1:	w1 -= w2
       2:	w3 = 1
       3:	w4 = w0
       4:	r4 <<= 32
       5:	r4 >>= 32
       6:	if r1 > r4 goto +1 <LBB4_2>
       7:	w3 = 0

LBB4_2:
       8:	r2 >>= 32
       9:	r0 >>= 32
      10:	w0 -= w2
      11:	w0 -= w3
      12:	r0 <<= 32
      13:	r0 |= r1
      14:	exit
Disassembly of section socket1:
filter1:
       0:	w1 = 0
       1:	*(u32 *)(r10 - 16) = r1
       2:	r2 = r10
       3:	r2 += -16
       4:	r1 = 0 ll
       6:	call 1
       7:	r7 = 0
       8:	r6 = 0
       9:	if r0 == 0 goto +1 <LBB0_2>
      10:	r6 = *(u64 *)(r0 + 0)

LBB0_2:
      11:	w1 = 1
      12:	*(u32 *)(r10 - 16) = r1
      13:	r2 = r10
      14:	r2 += -16
      15:	r1 = 0 ll
      17:	call 1
      18:	if r0 == 0 goto +1 <LBB0_4>
      19:	r7 = *(u64 *)(r0 + 0)

LBB0_4:
      20:	r6 -= r7
      21:	*(u64 *)(r10 - 16) = r6
      22:	w1 = 2
      23:	*(u32 *)(r10 - 4) = r1
      24:	r2 = r10
      25:	r2 += -4
      26:	r3 = r10
      27:	r3 += -16
      28:	r1 = 0 ll
      30:	r4 = 0
      31:	call 2
      32:	w0 = 1
      33:	exit
Disassembly of section socket2:
filter2:
       0:	w1 = 0
       1:	*(u32 *)(r10 - 16) = r1
       2:	r2 = r10
       3:	r2 += -16
       4:	r1 = 0 ll
       6:	call 1
       7:	r7 = 0
       8:	r6 = 0
       9:	if r0 == 0 goto +1 <LBB1_2>
      10:	r6 = *(u64 *)(r0 + 0)

LBB1_2:
      11:	w1 = 1
      12:	*(u32 *)(r10 - 16) = r1
      13:	r2 = r10
      14:	r2 += -16
      15:	r1 = 0 ll
      17:	call 1
      18:	if r0 == 0 goto +1 <LBB1_4>
      19:	r7 = *(u64 *)(r0 + 0)

LBB1_4:
      20:	w2 = w7
      21:	r2 <<= 32
      22:	r2 >>= 32
      23:	w3 = w6
      24:	r3 <<= 32
      25:	r3 >>= 32
      26:	w1 = 1
      27:	if r2 > r3 goto +1 <LBB1_6>
      28:	w1 = 0

LBB1_6:
      29:	r2 = r7
      30:	r2 >>= 32
      31:	r3 = r6
      32:	r3 >>= 32
      33:	r3 -= r2
      34:	w2 = 2
      35:	*(u32 *)(r10 - 4) = r2
      36:	r3 -= r1
      37:	r6 -= r7
      38:	r3 <<= 32
      39:	r6 <<= 32
      40:	r6 >>= 32
      41:	r3 |= r6
      42:	*(u64 *)(r10 - 16) = r3
      43:	r2 = r10
      44:	r2 += -4
      45:	r3 = r10
      46:	r3 += -16
      47:	r1 = 0 ll
      49:	r4 = 0
      50:	call 2
      51:	w0 = 1
      52:	exit
Disassembly of section socket3:
filter3:
       0:	w1 = 0
       1:	*(u32 *)(r10 - 16) = r1
       2:	r2 = r10
       3:	r2 += -16
       4:	r1 = 0 ll
       6:	call 1
       7:	r7 = 0
       8:	r6 = 0
       9:	if r0 == 0 goto +1 <LBB2_2>
      10:	r6 = *(u64 *)(r0 + 0)

LBB2_2:
      11:	w1 = 1
      12:	*(u32 *)(r10 - 16) = r1
      13:	r2 = r10
      14:	r2 += -16
      15:	r1 = 0 ll
      17:	call 1
      18:	if r0 == 0 goto +1 <LBB2_4>
      19:	r7 = *(u64 *)(r0 + 0)

LBB2_4:
      20:	w1 = w6
      21:	w1 -= w7
      22:	w3 = w6
      23:	r3 <<= 32
      24:	r3 >>= 32
      25:	w2 = 1
      26:	if r1 > r3 goto +1 <LBB2_6>
      27:	w2 = 0

LBB2_6:
      28:	r7 >>= 32
      29:	r6 >>= 32
      30:	w6 -= w7
      31:	w6 -= w2
      32:	w2 = 2
      33:	*(u32 *)(r10 - 4) = r2
      34:	r6 <<= 32
      35:	r6 |= r1
      36:	*(u64 *)(r10 - 16) = r6
      37:	r2 = r10
      38:	r2 += -4
      39:	r3 = r10
      40:	r3 += -16
      41:	r1 = 0 ll
      43:	r4 = 0
      44:	call 2
      45:	w0 = 1
      46:	exit
Disassembly of section socket4:
filter4:
       0:	w1 = 0
       1:	*(u32 *)(r10 - 16) = r1
       2:	r2 = r10
       3:	r2 += -16
       4:	r1 = 0 ll
       6:	call 1
       7:	r7 = 0
       8:	r6 = 0
       9:	if r0 == 0 goto +1 <LBB3_2>
      10:	r6 = *(u64 *)(r0 + 0)

LBB3_2:
      11:	w1 = 1
      12:	*(u32 *)(r10 - 16) = r1
      13:	r2 = r10
      14:	r2 += -16
      15:	r1 = 0 ll
      17:	call 1
      18:	if r0 == 0 goto +1 <LBB3_4>
      19:	r7 = *(u64 *)(r0 + 0)

LBB3_4:
      20:	r2 = r7
      21:	r2 >>= 32
      22:	r1 = r6
      23:	r1 >>= 32
      24:	w1 -= w2
      25:	w3 = w7
      26:	r3 <<= 32
      27:	r3 >>= 32
      28:	w4 = w6
      29:	r4 <<= 32
      30:	r4 >>= 32
      31:	w2 = 1
      32:	if r3 > r4 goto +1 <LBB3_6>
      33:	w2 = 0

LBB3_6:
      34:	w1 -= w2
      35:	w6 -= w7
      36:	*(u32 *)(r10 - 4) = r6
      37:	*(u32 *)(r10 - 16) = r1
      38:	r1 <<= 32
      39:	r1 |= r6
      40:	*(u64 *)(r10 - 16) = r1
      41:	w1 = 2
      42:	*(u32 *)(r10 - 4) = r1
      43:	r2 = r10
      44:	r2 += -4
      45:	r3 = r10
      46:	r3 += -16
      47:	r1 = 0 ll
      49:	r4 = 0
      50:	call 2
      51:	w0 = 1
      52:	exit
