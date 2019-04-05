
bpf/filter.o:	file format ELF64-BPF

Disassembly of section socket:
filter:
; {
       0:	r6 = 0
       1:	*(u32 *)(r10 - 16) = r6
       2:	r2 = r10
; int filter(struct __sk_buff *skb UNUSED)
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
; u64 a, b, r;
      13:	r2 += -16
; u64 *v = bpf_map_lookup_elem(&args, &key);
      14:	r1 = 0 ll
      16:	call 1
; return v ? *v : 0;
      17:	if r0 == 0 goto +1 <LBB0_4>
      18:	r6 = *(u64 *)(r0 + 0)

LBB0_4:
; r = a - b;
      19:	r7 -= r6
      20:	*(u64 *)(r10 - 16) = r7
      21:	r1 = 2
      22:	*(u32 *)(r10 - 4) = r1
      23:	r2 = r10
; u64 a, b, r;
      24:	r2 += -4
      25:	r3 = r10
      26:	r3 += -16
; bpf_map_update_elem(&args, &key, &v, BPF_ANY);
      27:	r1 = 0 ll
      29:	r4 = 0
      30:	call 2
; return SK_PASS;
      31:	r0 = 1
      32:	exit
