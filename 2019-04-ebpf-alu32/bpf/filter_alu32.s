
bpf/filter_alu32.o:	file format ELF64-BPF

Disassembly of section socket2:
filter_alu32:
; {
       0:	*(u64 *)(r10 - 96) = r1
       1:	w1 = 0
       2:	*(u32 *)(r10 - 76) = r1
       3:	r2 = r10
; u64 *v = bpf_map_lookup_elem(&args, &key);
       4:	r2 += -76
       5:	r1 = 0 ll
       7:	call 1
       8:	*(u64 *)(r10 - 88) = r0
; return v ? *v : 0;
       9:	r1 = *(u64 *)(r10 - 88)
      10:	if r1 == 0 goto +4 <LBB0_2>
      11:	goto +0 <LBB0_1>

LBB0_1:
      12:	r1 = *(u64 *)(r10 - 88)
      13:	r1 = *(u64 *)(r1 + 0)
      14:	goto +2 <LBB0_3>

LBB0_2:
      15:	r1 = 0
      16:	goto +0 <LBB0_3>

LBB0_3:
; a = args_get(ARG_0);
      17:	*(u64 *)(r10 - 104) = r1
      18:	w1 = 1
      19:	*(u32 *)(r10 - 60) = r1
      20:	r2 = r10
      21:	r2 += -60
; u64 *v = bpf_map_lookup_elem(&args, &key);
      22:	r1 = 0 ll
      24:	call 1
      25:	*(u64 *)(r10 - 72) = r0
; return v ? *v : 0;
      26:	r1 = *(u64 *)(r10 - 72)
      27:	if r1 == 0 goto +4 <LBB0_5>
      28:	goto +0 <LBB0_4>

LBB0_4:
      29:	r1 = *(u64 *)(r10 - 72)
      30:	r1 = *(u64 *)(r1 + 0)
      31:	goto +2 <LBB0_6>

LBB0_5:
      32:	r1 = 0
      33:	goto +0 <LBB0_6>

LBB0_6:
; b = args_get(ARG_1);
      34:	*(u64 *)(r10 - 112) = r1
; r = sub64_alu32(a, b);
      35:	r1 = *(u64 *)(r10 - 104)
      36:	r2 = *(u64 *)(r10 - 112)
      37:	*(u64 *)(r10 - 24) = r1
      38:	*(u64 *)(r10 - 32) = r2
; xl = x;
      39:	r1 = *(u64 *)(r10 - 24)
      40:	*(u32 *)(r10 - 40) = r1
; yl = y;
      41:	r1 = *(u64 *)(r10 - 32)
      42:	*(u32 *)(r10 - 48) = r1
; lo = xl - yl;
      43:	r1 = *(u32 *)(r10 - 40)
      44:	r2 = *(u32 *)(r10 - 48)
      45:	w1 -= w2
      46:	*(u32 *)(r10 - 56) = r1
; xh = x >> 32;
      47:	r1 = *(u32 *)(r10 - 20)
      48:	*(u32 *)(r10 - 36) = r1
; yh = y >> 32;
      49:	r1 = *(u32 *)(r10 - 28)
      50:	*(u32 *)(r10 - 44) = r1
; hi = xh - yh - (lo > xl); /* underflow? */
      51:	r1 = *(u32 *)(r10 - 36)
      52:	r2 = *(u32 *)(r10 - 44)
      53:	w1 -= w2
      54:	r2 = *(u32 *)(r10 - 56)
      55:	r3 = *(u32 *)(r10 - 40)
      56:	w4 = w2
      57:	r4 <<= 32
      58:	r4 >>= 32
      59:	w3 = w3
      60:	r3 <<= 32
      61:	r3 >>= 32
      62:	w2 = 1
      63:	if r4 > r3 goto +1 <LBB0_8>
      64:	w2 = 0

LBB0_8:
      65:	w1 -= w2
      66:	*(u32 *)(r10 - 52) = r1
; return ((u64)hi << 32) | (u64)lo;
      67:	r1 = *(u32 *)(r10 - 52)
      68:	r1 <<= 32
      69:	r2 = *(u32 *)(r10 - 56)
      70:	r1 |= r2
; r = sub64_alu32(a, b);
      71:	*(u64 *)(r10 - 120) = r1
; args_put(RES_0, r);
      72:	r1 = *(u64 *)(r10 - 120)
      73:	w2 = 2
      74:	*(u32 *)(r10 - 4) = r2
      75:	*(u64 *)(r10 - 16) = r1
      76:	r2 = r10
; hi = xh - yh - (lo > xl); /* underflow? */
      77:	r2 += -4
      78:	r3 = r10
      79:	r3 += -16
; bpf_map_update_elem(&args, &key, &v, BPF_ANY);
      80:	r1 = 0 ll
      82:	r4 = 0
      83:	call 2
; return SK_PASS;
      84:	w0 = 1
      85:	exit
