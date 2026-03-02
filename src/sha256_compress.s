	.att_syntax
	.text
	.p2align	5
	.global	sha256__compress
	.type	sha256__compress, %function
sha256__compress:
	movq	%rsp, %rax
	leaq	-120(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 96(%rsp)
	movq	%rbp, 104(%rsp)
	movq	%rax, 112(%rsp)
	movq	%rsp, %rax
	vmovdqu	(%rdi), %xmm0
	vmovdqu	%xmm0, (%rax)
	vmovdqu	16(%rdi), %xmm0
	vmovdqu	%xmm0, 16(%rax)
	leaq	32(%rsp), %rcx
	vmovdqu	(%rsi), %xmm0
	vpshufb	glob_data + 32(%rip), %xmm0, %xmm0
	vmovdqu	glob_data + 48(%rip), %xmm6
	vpaddd	%xmm6, %xmm0, %xmm6
	vmovdqu	%xmm6, (%rcx)
	vmovdqu	16(%rsi), %xmm1
	vpshufb	glob_data + 32(%rip), %xmm1, %xmm1
	vmovdqu	glob_data + 64(%rip), %xmm6
	vpaddd	%xmm6, %xmm1, %xmm6
	vmovdqu	%xmm6, 16(%rcx)
	vmovdqu	32(%rsi), %xmm2
	vpshufb	glob_data + 32(%rip), %xmm2, %xmm2
	vmovdqu	glob_data + 80(%rip), %xmm6
	vpaddd	%xmm6, %xmm2, %xmm6
	vmovdqu	%xmm6, 32(%rcx)
	vmovdqu	48(%rsi), %xmm3
	vpshufb	glob_data + 32(%rip), %xmm3, %xmm3
	vmovdqu	glob_data + 96(%rip), %xmm6
	vpaddd	%xmm6, %xmm3, %xmm6
	vmovdqu	%xmm6, 48(%rcx)
	movq	%rsp, %rax
	leaq	32(%rsp), %rcx
	vmovdqu	glob_data + 16(%rip), %xmm4
	vmovdqu	glob_data + 0(%rip), %xmm5
	leaq	glob_data + 48(%rip), %rdx
	movq	$0, %rsi
	jmp 	Lsha256__compress$5
Lsha256__compress$6:
	vmovdqu	64(%rdx,%rsi), %xmm6
	vpalignr	$4, %xmm0, %xmm1, %xmm7
	vpalignr	$4, %xmm2, %xmm3, %xmm8
	vpsrld	$7, %xmm7, %xmm9
	vpaddd	%xmm8, %xmm0, %xmm0
	vpsrld	$3, %xmm7, %xmm8
	vpslld	$14, %xmm7, %xmm7
	vpxor	%xmm9, %xmm8, %xmm8
	vpshufd	$250, %xmm3, %xmm10
	vpsrld	$11, %xmm9, %xmm9
	vpxor	%xmm7, %xmm8, %xmm8
	vpxor	%xmm9, %xmm8, %xmm8
	vpslld	$11, %xmm7, %xmm7
	vpsrld	$10, %xmm10, %xmm9
	vpsrlq	$17, %xmm10, %xmm10
	vpxor	%xmm7, %xmm8, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vpxor	%xmm10, %xmm9, %xmm9
	vpsrlq	$2, %xmm10, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpshufb	%xmm4, %xmm9, %xmm9
	vpaddd	%xmm9, %xmm0, %xmm0
	vpshufd	$80, %xmm0, %xmm8
	vpsrld	$10, %xmm8, %xmm9
	vpsrlq	$17, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpsrlq	$2, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm7
	vpshufb	%xmm5, %xmm7, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm7, %xmm3
	vpaddd	%xmm6, %xmm3, %xmm6
	movl	(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r9d
	movl	20(%rax), %r8d
	movl	24(%rax), %r11d
	movl	%r9d, %ebx
	andl	%r8d, %ebx
	notl	%r9d
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %ebx
	rorl	$2, %ebx
	movl	%r8d, %r9d
	rorl	$13, %r9d
	xorl	%r9d, %ebx
	rorl	$22, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %ebx
	movl	%ebx, 28(%rax)
	movl	20(%rax), %ebx
	movl	%ebx, 24(%rax)
	movl	16(%rax), %ebx
	movl	%ebx, 20(%rax)
	movl	12(%rax), %ebx
	movl	%ebx, 16(%rax)
	movl	8(%rax), %ebx
	movl	%ebx, 12(%rax)
	movl	4(%rax), %ebx
	movl	%ebx, 8(%rax)
	movl	(%rax), %ebx
	movl	%ebx, 4(%rax)
	movl	%r8d, (%rax)
	movl	4(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %ebx
	movl	4(%rax), %r8d
	movl	8(%rax), %r11d
	movl	%ebx, %r9d
	andl	%r8d, %r9d
	movl	%ebx, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %r9d
	andl	%r11d, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%ebx, %r9d
	rorl	$2, %r9d
	movl	%ebx, %r8d
	rorl	$13, %r8d
	xorl	%r8d, %r9d
	rorl	$22, %ebx
	xorl	%ebx, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	8(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	12(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	vmovdqu	%xmm6, (%rcx,%rsi)
	addq	$16, %rsi
Lsha256__compress$5:
	cmpq	$64, %rsi
	jb  	Lsha256__compress$6
	movq	$0, %rsi
	jmp 	Lsha256__compress$3
Lsha256__compress$4:
	vmovdqu	128(%rdx,%rsi), %xmm6
	vpalignr	$4, %xmm0, %xmm1, %xmm7
	vpalignr	$4, %xmm2, %xmm3, %xmm8
	vpsrld	$7, %xmm7, %xmm9
	vpaddd	%xmm8, %xmm0, %xmm0
	vpsrld	$3, %xmm7, %xmm8
	vpslld	$14, %xmm7, %xmm7
	vpxor	%xmm9, %xmm8, %xmm8
	vpshufd	$250, %xmm3, %xmm10
	vpsrld	$11, %xmm9, %xmm9
	vpxor	%xmm7, %xmm8, %xmm8
	vpxor	%xmm9, %xmm8, %xmm8
	vpslld	$11, %xmm7, %xmm7
	vpsrld	$10, %xmm10, %xmm9
	vpsrlq	$17, %xmm10, %xmm10
	vpxor	%xmm7, %xmm8, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vpxor	%xmm10, %xmm9, %xmm9
	vpsrlq	$2, %xmm10, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpshufb	%xmm4, %xmm9, %xmm9
	vpaddd	%xmm9, %xmm0, %xmm0
	vpshufd	$80, %xmm0, %xmm8
	vpsrld	$10, %xmm8, %xmm9
	vpsrlq	$17, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpsrlq	$2, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm7
	vpshufb	%xmm5, %xmm7, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm7, %xmm3
	vpaddd	%xmm6, %xmm3, %xmm6
	movl	(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	4(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	8(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	12(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	vmovdqu	%xmm6, (%rcx,%rsi)
	addq	$16, %rsi
Lsha256__compress$3:
	cmpq	$64, %rsi
	jb  	Lsha256__compress$4
	movq	$0, %rsi
	jmp 	Lsha256__compress$1
Lsha256__compress$2:
	vmovdqu	192(%rdx,%rsi), %xmm6
	vpalignr	$4, %xmm0, %xmm1, %xmm7
	vpalignr	$4, %xmm2, %xmm3, %xmm8
	vpsrld	$7, %xmm7, %xmm9
	vpaddd	%xmm8, %xmm0, %xmm0
	vpsrld	$3, %xmm7, %xmm8
	vpslld	$14, %xmm7, %xmm7
	vpxor	%xmm9, %xmm8, %xmm8
	vpshufd	$250, %xmm3, %xmm10
	vpsrld	$11, %xmm9, %xmm9
	vpxor	%xmm7, %xmm8, %xmm8
	vpxor	%xmm9, %xmm8, %xmm8
	vpslld	$11, %xmm7, %xmm7
	vpsrld	$10, %xmm10, %xmm9
	vpsrlq	$17, %xmm10, %xmm10
	vpxor	%xmm7, %xmm8, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vpxor	%xmm10, %xmm9, %xmm9
	vpsrlq	$2, %xmm10, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpshufb	%xmm4, %xmm9, %xmm9
	vpaddd	%xmm9, %xmm0, %xmm0
	vpshufd	$80, %xmm0, %xmm8
	vpsrld	$10, %xmm8, %xmm9
	vpsrlq	$17, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm9
	vpsrlq	$2, %xmm8, %xmm8
	vpxor	%xmm8, %xmm9, %xmm7
	vpshufb	%xmm5, %xmm7, %xmm7
	vpaddd	%xmm7, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm7, %xmm3
	vpaddd	%xmm6, %xmm3, %xmm6
	movl	(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	4(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	8(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	12(%rcx,%rsi), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	vmovdqu	%xmm6, (%rcx,%rsi)
	addq	$16, %rsi
Lsha256__compress$1:
	cmpq	$64, %rsi
	jb  	Lsha256__compress$2
	movq	%rsp, %rax
	leaq	32(%rsp), %rcx
	movl	(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	4(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	8(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	12(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	16(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	20(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	24(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	28(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	32(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	36(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	40(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	44(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	48(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	52(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	56(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movl	60(%rcx), %r8d
	movl	16(%rax), %r9d
	movl	%r9d, %r10d
	rorl	$6, %r10d
	movl	%r9d, %r11d
	rorl	$11, %r11d
	xorl	%r11d, %r10d
	rorl	$25, %r9d
	xorl	%r9d, %r10d
	addl	28(%rax), %r10d
	addl	%r8d, %r10d
	movl	16(%rax), %r8d
	movl	20(%rax), %r9d
	movl	24(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	notl	%r8d
	andl	%r11d, %r8d
	xorl	%r8d, %ebx
	addl	%ebx, %r10d
	addl	%r10d, 12(%rax)
	movl	(%rax), %r8d
	movl	4(%rax), %r9d
	movl	8(%rax), %r11d
	movl	%r8d, %ebx
	andl	%r9d, %ebx
	movl	%r8d, %ebp
	andl	%r11d, %ebp
	xorl	%ebp, %ebx
	andl	%r11d, %r9d
	xorl	%r9d, %ebx
	addl	%ebx, %r10d
	movl	%r8d, %r9d
	rorl	$2, %r9d
	movl	%r8d, %r11d
	rorl	$13, %r11d
	xorl	%r11d, %r9d
	rorl	$22, %r8d
	xorl	%r8d, %r9d
	addl	%r9d, %r10d
	movl	%r10d, 28(%rax)
	movl	28(%rax), %r8d
	movl	24(%rax), %r9d
	movl	%r9d, 28(%rax)
	movl	20(%rax), %r9d
	movl	%r9d, 24(%rax)
	movl	16(%rax), %r9d
	movl	%r9d, 20(%rax)
	movl	12(%rax), %r9d
	movl	%r9d, 16(%rax)
	movl	8(%rax), %r9d
	movl	%r9d, 12(%rax)
	movl	4(%rax), %r9d
	movl	%r9d, 8(%rax)
	movl	(%rax), %r9d
	movl	%r9d, 4(%rax)
	movl	%r8d, (%rax)
	movq	%rsp, %rax
	vmovdqu	(%rax), %xmm0
	vpaddd	(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi)
	vmovdqu	16(%rax), %xmm0
	vpaddd	16(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, 16(%rdi)
	movq	96(%rsp), %rbx
	movq	104(%rsp), %rbp
	movq	112(%rsp), %rsp
	ret
	.data
	.p2align	5
glob_data:
G$sha256__ghimask:
	.byte	255, 255, 255, 255, 255, 255, 255, 255,   0,   1,   2,   3,   8,   9,  10,  11
G$sha256__glomask:
	.byte	  0,   1,   2,   3,   8,   9,  10,  11, 255, 255, 255, 255, 255, 255, 255, 255
G$sha256__gshufmask:
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
G$sha256__k256:
	.byte	152,  47, 138,  66, 145,  68,  55, 113, 207, 251, 192, 181, 165, 219, 181, 233
	.byte	 91, 194,  86,  57, 241,  17, 241,  89, 164, 130,  63, 146, 213,  94,  28, 171
	.byte	152, 170,   7, 216,   1,  91, 131,  18, 190, 133,  49,  36, 195, 125,  12,  85
	.byte	116,  93, 190, 114, 254, 177, 222, 128, 167,   6, 220, 155, 116, 241, 155, 193
	.byte	193, 105, 155, 228, 134,  71, 190, 239, 198, 157, 193,  15, 204, 161,  12,  36
	.byte	111,  44, 233,  45, 170, 132, 116,  74, 220, 169, 176,  92, 218, 136, 249, 118
	.byte	 82,  81,  62, 152, 109, 198,  49, 168, 200,  39,   3, 176, 199, 127,  89, 191
	.byte	243,  11, 224, 198,  71, 145, 167, 213,  81,  99, 202,   6, 103,  41,  41,  20
	.byte	133,  10, 183,  39,  56,  33,  27,  46, 252, 109,  44,  77,  19,  13,  56,  83
	.byte	 84, 115,  10, 101, 187,  10, 106, 118,  46, 201, 194, 129, 133,  44, 114, 146
	.byte	161, 232, 191, 162,  75, 102,  26, 168, 112, 139,  75, 194, 163,  81, 108, 199
	.byte	 25, 232, 146, 209,  36,   6, 153, 214, 133,  53,  14, 244, 112, 160, 106,  16
	.byte	 22, 193, 164,  25,   8, 108,  55,  30,  76, 119,  72,  39, 181, 188, 176,  52
	.byte	179,  12,  28,  57,  74, 170, 216,  78,  79, 202, 156,  91, 243, 111,  46, 104
	.byte	238, 130, 143, 116, 111,  99, 165, 120,  20, 120, 200, 132,   8,   2, 199, 140
	.byte	250, 255, 190, 144, 235, 108,  80, 164, 247, 163, 249, 190, 242, 120, 113, 198
	.ident	"Jasmin Compiler development version at commit 65bd039b152789f7c67a8ab069b69e5050dc1b69 on branch main"
	.section	".note.GNU-stack", "", %progbits
