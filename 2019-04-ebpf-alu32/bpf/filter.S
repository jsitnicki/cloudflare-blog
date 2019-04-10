
bpf/filter.o:	file format ELF64-BPF

Disassembly of section socket1:
filter1:
; {
       0:	r6 = 0
; {
       1:	*(u32 *)(r10 - 16) = r6
       2:	r2 = r10
; int filter2(struct __sk_buff *skb _unused_)
       3:	r2 += -16
; u64 *v = bpf_map_lookup_elem(&args, &key);
       4:	r1 = 0 ll
       6:	call 1
; return v ? *v : 0;
       7:	r7 = 0
       8:	if r0 == 0 goto +1 <LBB0_2>
       9:	r7 = *(u64 *)(r0 + 0)

LBB0_2:
      10:	r1 = 1
      11:	*(u32 *)(r10 - 16) = r1
      12:	r2 = r10
; static _inline_ u64 sub64(u64 x, u64 y)
      13:	r2 += -16
; u64 *v = bpf_map_lookup_elem(&args, &key);
      14:	r1 = 0 ll
      16:	call 1
; return v ? *v : 0;
      17:	if r0 == 0 goto +1 <LBB0_4>
      18:	r6 = *(u64 *)(r0 + 0)

LBB0_4:
; xl = x;
      19:	r7 -= r6
      20:	*(u64 *)(r10 - 16) = r7
      21:	r1 = 2
; yl = y;
      22:	*(u32 *)(r10 - 4) = r1
      23:	r2 = r10
      24:	r2 += -4
; hi = xh - yh - (lo > xl); /* underflow? */
      25:	r3 = r10
      26:	r3 += -16
      27:	r1 = 0 ll
; yh = y >> 32;
      29:	r4 = 0
; xh = x >> 32;
      30:	call 2
      31:	r0 = 1
; hi = xh - yh - (lo > xl); /* underflow? */
      32:	exit
Disassembly of section socket2:
filter2:
; {
       0:	r6 = 0
; {
       1:	*(u32 *)(r10 - 16) = r6
       2:	r2 = r10
; int filter2(struct __sk_buff *skb _unused_)
       3:	r2 += -16
; u64 *v = bpf_map_lookup_elem(&args, &key);
       4:	r1 = 0 ll
       6:	call 1
; return v ? *v : 0;
       7:	r7 = 0
       8:	if r0 == 0 goto +1 <LBB1_2>
       9:	r7 = *(u64 *)(r0 + 0)

LBB1_2:
      10:	r1 = 1
      11:	*(u32 *)(r10 - 16) = r1
      12:	r2 = r10
; static _inline_ u64 sub64(u64 x, u64 y)
      13:	r2 += -16
; u64 *v = bpf_map_lookup_elem(&args, &key);
      14:	r1 = 0 ll
      16:	call 1
; return v ? *v : 0;
      17:	if r0 == 0 goto +1 <LBB1_4>
      18:	r6 = *(u64 *)(r0 + 0)

LBB1_4:
; xl = x;
      19:	r2 = r7
      20:	r2 <<= 32
      21:	r2 >>= 32
; yl = y;
      22:	r3 = r6
      23:	r3 <<= 32
      24:	r3 >>= 32
; hi = xh - yh - (lo > xl); /* underflow? */
      25:	r1 = 1
      26:	if r3 > r2 goto +1 <LBB1_6>
      27:	r1 = 0

LBB1_6:
; yh = y >> 32;
      28:	r2 = r6
      29:	r2 >>= 32
; xh = x >> 32;
      30:	r3 = r7
      31:	r3 >>= 32
; hi = xh - yh - (lo > xl); /* underflow? */
      32:	r3 -= r2
      33:	r2 = 2
      34:	*(u32 *)(r10 - 4) = r2
      35:	r3 -= r1
; lo = xl - yl;
      36:	r7 -= r6
; return ((u64)hi << 32) | (u64)lo;
      37:	r3 <<= 32
      38:	r7 <<= 32
      39:	r7 >>= 32
      40:	r3 |= r7
      41:	*(u64 *)(r10 - 16) = r3
      42:	r2 = r10
; yh = y >> 32;
      43:	r2 += -4
      44:	r3 = r10
      45:	r3 += -16
; bpf_map_update_elem(&args, &key, &v, BPF_ANY);
      46:	r1 = 0 ll
      48:	r4 = 0
      49:	call 2
; return SK_PASS;
      50:	r0 = 1
      51:	exit
