
	.file	"daxpy.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Falta el tama\303\261o y la constante\n"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para las matrices"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o de N:%u\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -100(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$32, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -84(%rbp)
	cmpl	$200000000, -84(%rbp)
	jbe	.L3
	movl	$200000000, -84(%rbp)
.L3:
	movq	-112(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -76(%rbp)
	movl	-84(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-84(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	cmpq	$0, -72(%rbp)
	je	.L4
	cmpq	$0, -64(%rbp)
	jne	.L5
.L4:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L5:
	movl	$0, -80(%rbp)
	jmp	.L6
.L7:
	movl	-80(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-80(%rbp), %eax
	movq	%rax, (%rdx)
	addl	$1, -80(%rbp)
.L6:
	movl	-80(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jb	.L7
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -80(%rbp)
	jmp	.L8
.L9:
	movl	-80(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	-76(%rbp), %ecx
	movl	-80(%rbp), %edx
	leaq	0(,%rdx,8), %rsi
	movq	-72(%rbp), %rdx
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	imulq	%rdx, %rcx
	movl	-80(%rbp), %edx
	leaq	0(,%rdx,8), %rsi
	movq	-64(%rbp), %rdx
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -80(%rbp)
.L8:
	movl	-80(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jb	.L9
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-84(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
