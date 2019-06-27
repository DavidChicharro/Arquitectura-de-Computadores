$ cat daxpy.s
	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta el tama\303\261o y la constante\n"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para las matrices"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o de N:%u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L22
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$200000000, %ebx
	call	strtol
	cmpl	$200000000, %eax
	movq	16(%rbp), %rdi
	movl	$10, %edx
	cmovbe	%eax, %ebx
	xorl	%esi, %esi
	movl	%ebx, %r12d
	salq	$3, %r12
	call	strtol
	movq	%r12, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %r12
	je	.L3
	testq	%rax, %rax
	je	.L3
	xorl	%edx, %edx
	testl	%ebx, %ebx
	je	.L23
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rdx, 0(%rbp,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %ebx
	ja	.L11
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	%r13d, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rax, %rcx
	imulq	0(%rbp,%rdx,8), %rcx
	addq	%rcx, (%r12,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %ebx
	ja	.L8
.L9:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC3, %esi
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	40(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L24
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L9
.L24:
	call	__stack_chk_fail
.L3:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L22:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$32, %edx
	movl	$1, %esi
	call	fwrite
	orl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
