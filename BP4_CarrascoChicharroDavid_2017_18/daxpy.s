	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta el tama\303\261o y la constante\n"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para las matrices"
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o de N:%u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.section	.text.startup,"ax",@progbits
.LHOTB6:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L52
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
	movl	%ebx, %r13d
	salq	$3, %r13
	call	strtol
	movq	%r13, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	malloc
	testq	%rbp, %rbp
	movq	%rax, %r13
	je	.L3
	testq	%rax, %rax
	je	.L3
	testl	%ebx, %ebx
	je	.L53
	movq	%rbp, %rax
	salq	$60, %rax
	shrq	$63, %rax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$5, %ebx
	ja	.L54
	cmpl	$1, %ebx
	movq	$0, 0(%rbp)
	je	.L45
	cmpl	$2, %ebx
	movq	$1, 8(%rbp)
	je	.L29
	cmpl	$3, %ebx
	movq	$2, 16(%rbp)
	je	.L30
	cmpl	$5, %ebx
	movq	$3, 24(%rbp)
	jne	.L31
	movq	$4, 32(%rbp)
	movl	$5, %eax
	movl	$5, %edx
.L9:
	cmpl	%eax, %ebx
	je	.L10
.L7:
	movl	%ebx, %edi
	leal	-1(%rbx), %esi
	movl	%eax, %r9d
	subl	%eax, %edi
	leal	-4(%rdi), %ecx
	subl	%eax, %esi
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %esi
	leal	0(,%rcx,4), %r8d
	jbe	.L11
	movl	%edx, 8(%rsp)
	pxor	%xmm1, %xmm1
	movd	8(%rsp), %xmm6
	leaq	0(%rbp,%r9,8), %rax
	xorl	%esi, %esi
	movdqa	.LC3(%rip), %xmm3
	pshufd	$0, %xmm6, %xmm0
	paddd	.LC2(%rip), %xmm0
.L12:
	movdqa	%xmm0, %xmm2
	addl	$1, %esi
	movdqa	%xmm0, %xmm4
	addq	$32, %rax
	punpckldq	%xmm1, %xmm2
	punpckhdq	%xmm1, %xmm0
	paddd	%xmm3, %xmm4
	movaps	%xmm2, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpl	%ecx, %esi
	jnb	.L55
	movdqa	%xmm4, %xmm0
	jmp	.L12
.L55:
	addl	%r8d, %edx
	cmpl	%r8d, %edi
	je	.L10
.L11:
	movl	%edx, %eax
	movq	%rax, 0(%rbp,%rax,8)
	leal	1(%rdx), %eax
	cmpl	%eax, %ebx
	jbe	.L10
	addl	$2, %edx
	movq	%rax, 0(%rbp,%rax,8)
	cmpl	%edx, %ebx
	jbe	.L10
	movq	%rdx, 0(%rbp,%rdx,8)
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	%r12d, %r12d
	call	clock_gettime
	movq	%r13, %rax
	salq	$60, %rax
	shrq	$63, %rax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$2, %ebx
	ja	.L56
	movq	%r12, %rax
	imulq	0(%rbp), %rax
	addq	%rax, 0(%r13)
	cmpl	$2, %ebx
	movl	%ebx, %eax
	jne	.L21
	movq	%r12, %rax
	imulq	8(%rbp), %rax
	addq	%rax, 8(%r13)
	movl	%ebx, %eax
.L21:
	cmpl	%eax, %ebx
	je	.L24
	movl	%ebx, %ecx
	movl	%eax, %edx
	subl	%eax, %ecx
	leal	-2(%rcx), %esi
	movl	%ecx, %eax
	shrl	%esi
	addl	$1, %esi
	subl	$1, %eax
	jne	.L25
.L24:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	%ebx, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC5, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L57
	addq	$72, %rsp
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
.L56:
	.cfi_restore_state
	testl	%eax, %eax
	jne	.L58
	leal	-2(%rbx), %esi
	xorl	%edx, %edx
	shrl	%esi
	addl	$1, %esi
.L25:
	movq	%r12, 8(%rsp)
	salq	$3, %rdx
	xorl	%eax, %eax
	movq	8(%rsp), %xmm3
	leaq	0(%rbp,%rdx), %rdi
	punpcklqdq	%xmm3, %xmm3
	addq	%r13, %rdx
	xorl	%ecx, %ecx
	movdqa	%xmm3, %xmm5
	psrlq	$32, %xmm5
.L16:
	movdqu	(%rdi,%rax), %xmm2
	addl	$1, %ecx
	movdqa	%xmm2, %xmm1
	movdqa	%xmm2, %xmm4
	pmuludq	%xmm5, %xmm2
	psrlq	$32, %xmm1
	movdqa	%xmm1, %xmm0
	pmuludq	%xmm3, %xmm4
	pmuludq	%xmm3, %xmm0
	paddq	%xmm2, %xmm0
	psllq	$32, %xmm0
	paddq	%xmm4, %xmm0
	paddq	(%rdx,%rax), %xmm0
	movaps	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%esi, %ecx
	jb	.L16
	jmp	.L24
.L54:
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L7
	movq	$0, 0(%rbp)
.L45:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L9
.L31:
	movl	%ebx, %eax
	movl	$4, %edx
	jmp	.L9
.L29:
	movl	$2, %eax
	movl	$2, %edx
	jmp	.L9
.L30:
	movl	$3, %eax
	movl	$3, %edx
	jmp	.L9
.L53:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L24
.L58:
	movq	%r12, %rax
	imulq	0(%rbp), %rax
	addq	%rax, 0(%r13)
	movl	$1, %eax
	jmp	.L21
.L3:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L52:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$32, %edx
	movl	$1, %esi
	call	fwrite
	orl	$-1, %edi
	call	exit
.L57:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
