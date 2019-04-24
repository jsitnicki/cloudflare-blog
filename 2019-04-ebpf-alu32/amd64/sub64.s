
amd64/sub64.o:	file format ELF64-x86-64

Disassembly of section .text:
sub64:
; {
       0:	pushq	%rbp
       1:	movq	%rsp, %rbp
; xh = (uint32_t) (x >> 32);
       4:	movq	%rdi, %rax
       7:	shrq	$32, %rax
; yh = (uint32_t) (y >> 32);
       b:	movq	%rsi, %rcx
       e:	shrq	$32, %rcx
; hi = xh - yh - (lo > xl); /* underflow? */
      12:	subl	%ecx, %eax
; lo = xl - yl;
      14:	subl	%esi, %edi
; hi = xh - yh - (lo > xl); /* underflow? */
      16:	sbbl	$0, %eax
; return ((uint64_t)hi << 32) | (uint64_t)lo;
      19:	shlq	$32, %rax
      1d:	orq	%rax, %rdi
      20:	movq	%rdi, %rax
      23:	popq	%rbp
      24:	retq
