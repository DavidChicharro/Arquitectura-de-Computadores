	.file	"pmm-secuencial.c"
	.section	.rodata
.LC0:
	.string	"Falta el tama\303\261o\n"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para las matrices"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matrices:%u\n"
	.align 8
.LC4:
	.string	"M3[0][0]=%llu , M3[%d][%d]=%llu \n"
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
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset 3, -24
	movl	%edi, -148(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -148(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -96(%rbp)
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -88(%rbp)
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -80(%rbp)
	movq	$0, -104(%rbp)
	jmp	.L3
.L4:
	movq	-104(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movq	-104(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movq	-104(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-108(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	addq	$1, -104(%rbp)
.L3:
	movl	-108(%rbp), %eax
	cmpq	-104(%rbp), %rax
	ja	.L4
	cmpq	$0, -96(%rbp)
	je	.L5
	cmpq	$0, -88(%rbp)
	je	.L5
	cmpq	$0, -80(%rbp)
	jne	.L6
.L5:
	movl	$.LC1, %edi
	call	puts
	movl	$-2, %edi
	call	exit
.L6:
	movl	$0, -132(%rbp)
	jmp	.L7
.L10:
	movl	$0, -128(%rbp)
	jmp	.L8
.L9:
	movl	-132(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-128(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-132(%rbp), %ecx
	movl	-128(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movq	%rax, (%rdx)
	movl	-132(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-128(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-132(%rbp), %ecx
	movl	-128(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movq	%rax, (%rdx)
	movl	-132(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-128(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -128(%rbp)
.L8:
	movl	-128(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L9
	addl	$1, -132(%rbp)
.L7:
	movl	-132(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L10
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -124(%rbp)
	jmp	.L11
.L16:
	movl	$0, -120(%rbp)
	jmp	.L12
.L15:
	movl	$0, -116(%rbp)
	jmp	.L13
.L14:
	movl	-124(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movl	-124(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-80(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-120(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-124(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	movq	-96(%rbp), %rdx
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	movl	-116(%rbp), %esi
	movslq	%esi, %rsi
	salq	$3, %rsi
	addq	%rsi, %rdx
	movq	(%rdx), %rsi
	movl	-116(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rdi
	movq	-88(%rbp), %rdx
	addq	%rdi, %rdx
	movq	(%rdx), %rdx
	movl	-120(%rbp), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	addq	%rdi, %rdx
	movq	(%rdx), %rdx
	imulq	%rsi, %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -116(%rbp)
.L13:
	movl	-116(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L14
	addl	$1, -120(%rbp)
.L12:
	movl	-120(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L15
	addl	$1, -124(%rbp)
.L11:
	movl	-124(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L16
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movl	-108(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, -168(%rbp)
	movsd	-168(%rbp), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movl	-108(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-108(%rbp), %edx
	subl	$1, %edx
	movl	%edx, %edx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	-108(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-108(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -112(%rbp)
	jmp	.L17
.L18:
	movl	-112(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	movl	-112(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	movl	-112(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	addl	$1, -112(%rbp)
.L17:
	movl	-112(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jb	.L18
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L20
	call	__stack_chk_fail
.L20:
	addq	$168, %rsp
	popq	%rbx
	popq	%rbp
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
