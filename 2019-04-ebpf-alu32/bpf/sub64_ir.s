
bpf/sub64_ir.o:	file format ELF64-BPF

Disassembly of section .text:
sub64_ir:
       0:	w3 = 1
       1:	w4 = w2
       2:	r4 <<= 32
       3:	r4 >>= 32
       4:	w5 = w1
       5:	r5 <<= 32
       6:	r5 >>= 32
       7:	if r4 > r5 goto +1 <LBB0_2>
       8:	w3 = 0

LBB0_2:
       9:	r4 = r2
      10:	r4 >>= 32
      11:	r0 = r1
      12:	r0 >>= 32
      13:	w0 -= w4
      14:	w0 -= w3
      15:	w1 -= w2
      16:	r0 <<= 32
      17:	r0 |= r1
      18:	exit
