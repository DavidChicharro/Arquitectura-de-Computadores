	.file	"figura1-modificado_b.c"
	.comm	s,40000,32
	.section	.rodata
.LC1:
	.string	"Tiempo(seg.):%11.9f \n"
.LC2:
	.string	"R[0]=%llu\t R[39999]=%llu\n"
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
	subq	$320128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -320060(%rbp)
	jmp	.L2
.L3:
	movl	-320060(%rbp), %eax
	cltq
	movl	-320060(%rbp), %edx
	movl	%edx, s(,%rax,8)
	movl	-320060(%rbp), %eax
	cltq
	movl	-320060(%rbp), %edx
	movl	%edx, s+4(,%rax,8)
	addl	$1, -320060(%rbp)
.L2:
	cmpl	$4999, -320060(%rbp)
	jle	.L3
	leaq	-320048(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -320100(%rbp)
	jmp	.L4
.L17:
	movl	$0, -320092(%rbp)
	movl	$0, -320088(%rbp)
	movl	$0, -320096(%rbp)
	jmp	.L5
.L6:
	movl	-320096(%rbp), %eax
	cltq
	movl	s(,%rax,8), %eax
	leal	(%rax,%rax), %edx
	movl	-320100(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -320092(%rbp)
	movl	-320096(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	s(,%rax,8), %eax
	leal	(%rax,%rax), %edx
	movl	-320100(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	addl	%eax, -320088(%rbp)
	movl	-320096(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	s(,%rax,8), %eax
	leal	(%rax,%rax), %edx
	movl	-320100(%rbp), %eax
	addl	%edx, %eax
	addl	$2, %eax
	addl	%eax, -320084(%rbp)
	movl	-320096(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	s(,%rax,8), %eax
	leal	(%rax,%rax), %edx
	movl	-320100(%rbp), %eax
	addl	%edx, %eax
	addl	$3, %eax
	addl	%eax, -320080(%rbp)
	addl	$4, -320096(%rbp)
.L5:
	cmpl	$4999, -320096(%rbp)
	jle	.L6
	movl	$0, -320096(%rbp)
	jmp	.L7
.L8:
	movl	-320096(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	s+4(,%rax,8), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-320100(%rbp), %eax
	addl	%eax, -320076(%rbp)
	movl	-320096(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	s+4(,%rax,8), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-320100(%rbp), %eax
	addl	$1, %eax
	addl	%eax, -320072(%rbp)
	movl	-320096(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	s+4(,%rax,8), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-320100(%rbp), %eax
	addl	$2, %eax
	addl	%eax, -320068(%rbp)
	movl	-320096(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	s+4(,%rax,8), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-320100(%rbp), %eax
	addl	$3, %eax
	addl	%eax, -320064(%rbp)
	addl	$4, -320096(%rbp)
.L7:
	cmpl	$4999, -320096(%rbp)
	jle	.L8
	movl	-320092(%rbp), %eax
	cmpl	-320076(%rbp), %eax
	jge	.L9
	movl	-320092(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
	jmp	.L10
.L9:
	movl	-320076(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
.L10:
	movl	-320088(%rbp), %eax
	cmpl	-320072(%rbp), %eax
	jge	.L11
	movl	-320088(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
	jmp	.L12
.L11:
	movl	-320072(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
.L12:
	movl	-320084(%rbp), %eax
	cmpl	-320068(%rbp), %eax
	jge	.L13
	movl	-320084(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
	jmp	.L14
.L13:
	movl	-320068(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
.L14:
	movl	-320080(%rbp), %eax
	cmpl	-320064(%rbp), %eax
	jge	.L15
	movl	-320080(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
	jmp	.L16
.L15:
	movl	-320064(%rbp), %eax
	movslq	%eax, %rdx
	movl	-320100(%rbp), %eax
	cltq
	movq	%rdx, -320016(%rbp,%rax,8)
.L16:
	addl	$1, -320100(%rbp)
.L4:
	cmpl	$39999, -320100(%rbp)
	jle	.L17
	leaq	-320032(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-320032(%rbp), %rdx
	movq	-320048(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-320024(%rbp), %rdx
	movq	-320040(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -320056(%rbp)
	movq	-320056(%rbp), %rax
	movq	%rax, -320120(%rbp)
	movsd	-320120(%rbp), %xmm0
	movl	$.LC1, %edi
	movl	$1, %eax
	call	printf
	movq	-24(%rbp), %rdx
	movq	-320016(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L19
	call	__stack_chk_fail
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
