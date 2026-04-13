	.att_syntax
	.text
	.p2align	5
	.global	sha512__compress
	.type	sha512__compress, %function
sha512__compress:
	movq	%rsp, %rax
	leaq	-216(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 192(%rsp)
	movq	%rbp, 200(%rsp)
	movq	%rax, 208(%rsp)
	movq	%rsp, %rax
	vmovdqu	(%rdi), %xmm0
	vmovdqu	%xmm0, (%rax)
	vmovdqu	16(%rdi), %xmm0
	vmovdqu	%xmm0, 16(%rax)
	vmovdqu	32(%rdi), %xmm0
	vmovdqu	%xmm0, 32(%rax)
	vmovdqu	48(%rdi), %xmm0
	vmovdqu	%xmm0, 48(%rax)
	leaq	64(%rsp), %rcx
	vmovdqu	(%rsi), %xmm7
	vpshufb	glob_data + 0(%rip), %xmm7, %xmm7
	vmovdqu	glob_data + 16(%rip), %xmm8
	vpaddq	%xmm8, %xmm7, %xmm8
	vmovdqu	%xmm8, (%rcx)
	vmovdqu	16(%rsi), %xmm0
	vpshufb	glob_data + 0(%rip), %xmm0, %xmm0
	vmovdqu	glob_data + 32(%rip), %xmm8
	vpaddq	%xmm8, %xmm0, %xmm8
	vmovdqu	%xmm8, 16(%rcx)
	vmovdqu	32(%rsi), %xmm1
	vpshufb	glob_data + 0(%rip), %xmm1, %xmm1
	vmovdqu	glob_data + 48(%rip), %xmm8
	vpaddq	%xmm8, %xmm1, %xmm8
	vmovdqu	%xmm8, 32(%rcx)
	vmovdqu	48(%rsi), %xmm2
	vpshufb	glob_data + 0(%rip), %xmm2, %xmm2
	vmovdqu	glob_data + 64(%rip), %xmm8
	vpaddq	%xmm8, %xmm2, %xmm8
	vmovdqu	%xmm8, 48(%rcx)
	vmovdqu	64(%rsi), %xmm3
	vpshufb	glob_data + 0(%rip), %xmm3, %xmm3
	vmovdqu	glob_data + 80(%rip), %xmm8
	vpaddq	%xmm8, %xmm3, %xmm8
	vmovdqu	%xmm8, 64(%rcx)
	vmovdqu	80(%rsi), %xmm4
	vpshufb	glob_data + 0(%rip), %xmm4, %xmm4
	vmovdqu	glob_data + 96(%rip), %xmm8
	vpaddq	%xmm8, %xmm4, %xmm8
	vmovdqu	%xmm8, 80(%rcx)
	vmovdqu	96(%rsi), %xmm5
	vpshufb	glob_data + 0(%rip), %xmm5, %xmm5
	vmovdqu	glob_data + 112(%rip), %xmm8
	vpaddq	%xmm8, %xmm5, %xmm8
	vmovdqu	%xmm8, 96(%rcx)
	vmovdqu	112(%rsi), %xmm6
	vpshufb	glob_data + 0(%rip), %xmm6, %xmm6
	vmovdqu	glob_data + 128(%rip), %xmm8
	vpaddq	%xmm8, %xmm6, %xmm8
	vmovdqu	%xmm8, 112(%rcx)
	movq	%rsp, %rax
	leaq	64(%rsp), %rcx
	leaq	glob_data + 16(%rip), %rdx
	movq	$0, %rsi
	jmp 	Lsha512__compress$7
Lsha512__compress$8:
	vmovdqu	128(%rdx,%rsi), %xmm8
	vpalignr	$8, %xmm7, %xmm0, %xmm9
	vpalignr	$8, %xmm3, %xmm4, %xmm10
	vpsrlq	$1, %xmm9, %xmm11
	vpaddq	%xmm10, %xmm7, %xmm7
	vpsrlq	$7, %xmm9, %xmm10
	vpsllq	$56, %xmm9, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpsrlq	$7, %xmm11, %xmm11
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm11, %xmm10, %xmm10
	vpsllq	$7, %xmm9, %xmm11
	vpsrlq	$6, %xmm6, %xmm12
	vpsllq	$3, %xmm6, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vpxor	%xmm9, %xmm12, %xmm11
	vpsrlq	$19, %xmm6, %xmm10
	vpsllq	$42, %xmm9, %xmm9
	vpxor	%xmm10, %xmm11, %xmm11
	vpsrlq	$42, %xmm10, %xmm10
	vpxor	%xmm9, %xmm11, %xmm11
	vpxor	%xmm10, %xmm11, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm10
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm4, %xmm3
	vmovdqu	%xmm5, %xmm4
	vmovdqu	%xmm6, %xmm5
	vmovdqu	%xmm10, %xmm6
	vpaddq	%xmm8, %xmm6, %xmm8
	movq	(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r9
	movq	40(%rax), %r8
	movq	48(%rax), %r11
	movq	%r9, %rbx
	andq	%r8, %rbx
	notq	%r9
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	8(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	vmovdqu	%xmm8, (%rcx,%rsi)
	addq	$16, %rsi
Lsha512__compress$7:
	cmpq	$128, %rsi
	jb  	Lsha512__compress$8
	movq	$0, %rsi
	jmp 	Lsha512__compress$5
Lsha512__compress$6:
	vmovdqu	256(%rdx,%rsi), %xmm8
	vpalignr	$8, %xmm7, %xmm0, %xmm9
	vpalignr	$8, %xmm3, %xmm4, %xmm10
	vpsrlq	$1, %xmm9, %xmm11
	vpaddq	%xmm10, %xmm7, %xmm7
	vpsrlq	$7, %xmm9, %xmm10
	vpsllq	$56, %xmm9, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpsrlq	$7, %xmm11, %xmm11
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm11, %xmm10, %xmm10
	vpsllq	$7, %xmm9, %xmm11
	vpsrlq	$6, %xmm6, %xmm12
	vpsllq	$3, %xmm6, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vpxor	%xmm9, %xmm12, %xmm11
	vpsrlq	$19, %xmm6, %xmm10
	vpsllq	$42, %xmm9, %xmm9
	vpxor	%xmm10, %xmm11, %xmm11
	vpsrlq	$42, %xmm10, %xmm10
	vpxor	%xmm9, %xmm11, %xmm11
	vpxor	%xmm10, %xmm11, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm10
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm4, %xmm3
	vmovdqu	%xmm5, %xmm4
	vmovdqu	%xmm6, %xmm5
	vmovdqu	%xmm10, %xmm6
	vpaddq	%xmm8, %xmm6, %xmm8
	movq	(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	8(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	vmovdqu	%xmm8, (%rcx,%rsi)
	addq	$16, %rsi
Lsha512__compress$5:
	cmpq	$128, %rsi
	jb  	Lsha512__compress$6
	movq	$0, %rsi
	jmp 	Lsha512__compress$3
Lsha512__compress$4:
	vmovdqu	384(%rdx,%rsi), %xmm8
	vpalignr	$8, %xmm7, %xmm0, %xmm9
	vpalignr	$8, %xmm3, %xmm4, %xmm10
	vpsrlq	$1, %xmm9, %xmm11
	vpaddq	%xmm10, %xmm7, %xmm7
	vpsrlq	$7, %xmm9, %xmm10
	vpsllq	$56, %xmm9, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpsrlq	$7, %xmm11, %xmm11
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm11, %xmm10, %xmm10
	vpsllq	$7, %xmm9, %xmm11
	vpsrlq	$6, %xmm6, %xmm12
	vpsllq	$3, %xmm6, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vpxor	%xmm9, %xmm12, %xmm11
	vpsrlq	$19, %xmm6, %xmm10
	vpsllq	$42, %xmm9, %xmm9
	vpxor	%xmm10, %xmm11, %xmm11
	vpsrlq	$42, %xmm10, %xmm10
	vpxor	%xmm9, %xmm11, %xmm11
	vpxor	%xmm10, %xmm11, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm10
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm4, %xmm3
	vmovdqu	%xmm5, %xmm4
	vmovdqu	%xmm6, %xmm5
	vmovdqu	%xmm10, %xmm6
	vpaddq	%xmm8, %xmm6, %xmm8
	movq	(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	8(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	vmovdqu	%xmm8, (%rcx,%rsi)
	addq	$16, %rsi
Lsha512__compress$3:
	cmpq	$128, %rsi
	jb  	Lsha512__compress$4
	movq	$0, %rsi
	jmp 	Lsha512__compress$1
Lsha512__compress$2:
	vmovdqu	512(%rdx,%rsi), %xmm8
	vpalignr	$8, %xmm7, %xmm0, %xmm9
	vpalignr	$8, %xmm3, %xmm4, %xmm10
	vpsrlq	$1, %xmm9, %xmm11
	vpaddq	%xmm10, %xmm7, %xmm7
	vpsrlq	$7, %xmm9, %xmm10
	vpsllq	$56, %xmm9, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpsrlq	$7, %xmm11, %xmm11
	vpxor	%xmm9, %xmm10, %xmm10
	vpxor	%xmm11, %xmm10, %xmm10
	vpsllq	$7, %xmm9, %xmm11
	vpsrlq	$6, %xmm6, %xmm12
	vpsllq	$3, %xmm6, %xmm9
	vpxor	%xmm11, %xmm10, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vpxor	%xmm9, %xmm12, %xmm11
	vpsrlq	$19, %xmm6, %xmm10
	vpsllq	$42, %xmm9, %xmm9
	vpxor	%xmm10, %xmm11, %xmm11
	vpsrlq	$42, %xmm10, %xmm10
	vpxor	%xmm9, %xmm11, %xmm11
	vpxor	%xmm10, %xmm11, %xmm10
	vpaddq	%xmm10, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm10
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm2, %xmm1
	vmovdqu	%xmm3, %xmm2
	vmovdqu	%xmm4, %xmm3
	vmovdqu	%xmm5, %xmm4
	vmovdqu	%xmm6, %xmm5
	vmovdqu	%xmm10, %xmm6
	vpaddq	%xmm8, %xmm6, %xmm8
	movq	(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	8(%rcx,%rsi), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	vmovdqu	%xmm8, (%rcx,%rsi)
	addq	$16, %rsi
Lsha512__compress$1:
	cmpq	$128, %rsi
	jb  	Lsha512__compress$2
	movq	%rsp, %rax
	leaq	64(%rsp), %rcx
	movq	(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	8(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	16(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	24(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	32(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	40(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	48(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	56(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	64(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	72(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	80(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	88(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	96(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	104(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	112(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	120(%rcx), %r8
	movq	32(%rax), %r9
	movq	%r9, %r10
	rorq	$14, %r10
	movq	%r9, %r11
	rorq	$18, %r11
	xorq	%r11, %r10
	rorq	$41, %r9
	xorq	%r9, %r10
	addq	56(%rax), %r10
	addq	%r8, %r10
	movq	32(%rax), %r8
	movq	40(%rax), %r9
	movq	48(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	notq	%r8
	andq	%r11, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	addq	%r10, 24(%rax)
	movq	(%rax), %r8
	movq	8(%rax), %r9
	movq	16(%rax), %r11
	movq	%r8, %rbx
	andq	%r9, %rbx
	movq	%r8, %rbp
	andq	%r11, %rbp
	xorq	%rbp, %rbx
	andq	%r11, %r9
	xorq	%r9, %rbx
	addq	%rbx, %r10
	movq	%r8, %rbx
	rorq	$28, %rbx
	movq	%r8, %r9
	rorq	$34, %r9
	xorq	%r9, %rbx
	rorq	$39, %r8
	xorq	%r8, %rbx
	addq	%rbx, %r10
	movq	%r10, 56(%rax)
	movq	56(%rax), %r8
	movq	48(%rax), %rbx
	movq	%rbx, 56(%rax)
	movq	40(%rax), %rbx
	movq	%rbx, 48(%rax)
	movq	32(%rax), %rbx
	movq	%rbx, 40(%rax)
	movq	24(%rax), %rbx
	movq	%rbx, 32(%rax)
	movq	16(%rax), %rbx
	movq	%rbx, 24(%rax)
	movq	8(%rax), %rbx
	movq	%rbx, 16(%rax)
	movq	(%rax), %rbx
	movq	%rbx, 8(%rax)
	movq	%r8, (%rax)
	movq	%rsp, %rax
	vmovdqu	(%rax), %xmm0
	vpaddq	(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi)
	vmovdqu	16(%rax), %xmm0
	vpaddq	16(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, 16(%rdi)
	vmovdqu	32(%rax), %xmm0
	vpaddq	32(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, 32(%rdi)
	vmovdqu	48(%rax), %xmm0
	vpaddq	48(%rdi), %xmm0, %xmm0
	vmovdqu	%xmm0, 48(%rdi)
	movq	192(%rsp), %rbx
	movq	200(%rsp), %rbp
	movq	208(%rsp), %rsp
	ret
	.data
	.p2align	5
glob_data:
G$sha512__gshufmask:
	.byte	  7,   6,   5,   4,   3,   2,   1,   0,  15,  14,  13,  12,  11,  10,   9,   8
G$sha512__k512:
	.byte	 34, 174,  40, 215, 152,  47, 138,  66, 205, 101, 239,  35, 145,  68,  55, 113
	.byte	 47,  59,  77, 236, 207, 251, 192, 181, 188, 219, 137, 129, 165, 219, 181, 233
	.byte	 56, 181,  72, 243,  91, 194,  86,  57,  25, 208,   5, 182, 241,  17, 241,  89
	.byte	155,  79,  25, 175, 164, 130,  63, 146,  24, 129, 109, 218, 213,  94,  28, 171
	.byte	 66,   2,   3, 163, 152, 170,   7, 216, 190, 111, 112,  69,   1,  91, 131,  18
	.byte	140, 178, 228,  78, 190, 133,  49,  36, 226, 180, 255, 213, 195, 125,  12,  85
	.byte	111, 137, 123, 242, 116,  93, 190, 114, 177, 150,  22,  59, 254, 177, 222, 128
	.byte	 53,  18, 199,  37, 167,   6, 220, 155, 148,  38, 105, 207, 116, 241, 155, 193
	.byte	210,  74, 241, 158, 193, 105, 155, 228, 227,  37,  79,  56, 134,  71, 190, 239
	.byte	181, 213, 140, 139, 198, 157, 193,  15, 101, 156, 172, 119, 204, 161,  12,  36
	.byte	117,   2,  43,  89, 111,  44, 233,  45, 131, 228, 166, 110, 170, 132, 116,  74
	.byte	212, 251,  65, 189, 220, 169, 176,  92, 181,  83,  17, 131, 218, 136, 249, 118
	.byte	171, 223, 102, 238,  82,  81,  62, 152,  16,  50, 180,  45, 109, 198,  49, 168
	.byte	 63,  33, 251, 152, 200,  39,   3, 176, 228,  14, 239, 190, 199, 127,  89, 191
	.byte	194, 143, 168,  61, 243,  11, 224, 198,  37, 167,  10, 147,  71, 145, 167, 213
	.byte	111, 130,   3, 224,  81,  99, 202,   6, 112, 110,  14,  10, 103,  41,  41,  20
	.byte	252,  47, 210,  70, 133,  10, 183,  39,  38, 201,  38,  92,  56,  33,  27,  46
	.byte	237,  42, 196,  90, 252, 109,  44,  77, 223, 179, 149, 157,  19,  13,  56,  83
	.byte	222,  99, 175, 139,  84, 115,  10, 101, 168, 178, 119,  60, 187,  10, 106, 118
	.byte	230, 174, 237,  71,  46, 201, 194, 129,  59,  53, 130,  20, 133,  44, 114, 146
	.byte	100,   3, 241,  76, 161, 232, 191, 162,   1,  48,  66, 188,  75, 102,  26, 168
	.byte	145, 151, 248, 208, 112, 139,  75, 194,  48, 190,  84,   6, 163,  81, 108, 199
	.byte	 24,  82, 239, 214,  25, 232, 146, 209,  16, 169, 101,  85,  36,   6, 153, 214
	.byte	 42,  32, 113,  87, 133,  53,  14, 244, 184, 209, 187,  50, 112, 160, 106,  16
	.byte	200, 208, 210, 184,  22, 193, 164,  25,  83, 171,  65,  81,   8, 108,  55,  30
	.byte	153, 235, 142, 223,  76, 119,  72,  39, 168,  72, 155, 225, 181, 188, 176,  52
	.byte	 99,  90, 201, 197, 179,  12,  28,  57, 203, 138,  65, 227,  74, 170, 216,  78
	.byte	115, 227,  99, 119,  79, 202, 156,  91, 163, 184, 178, 214, 243, 111,  46, 104
	.byte	252, 178, 239,  93, 238, 130, 143, 116,  96,  47,  23,  67, 111,  99, 165, 120
	.byte	114, 171, 240, 161,  20, 120, 200, 132, 236,  57, 100,  26,   8,   2, 199, 140
	.byte	 40,  30,  99,  35, 250, 255, 190, 144, 233, 189, 130, 222, 235, 108,  80, 164
	.byte	 21, 121, 198, 178, 247, 163, 249, 190,  43,  83, 114, 227, 242, 120, 113, 198
	.byte	156,  97,  38, 234, 206,  62,  39, 202,   7, 194, 192,  33, 199, 184, 134, 209
	.byte	 30, 235, 224, 205, 214, 125, 218, 234, 120, 209, 110, 238, 127,  79, 125, 245
	.byte	186, 111,  23, 114, 170, 103, 240,   6, 166, 152, 200, 162, 197, 125,  99,  10
	.byte	174,  13, 249, 190,   4, 152,  63,  17,  27,  71,  28,  19,  53,  11, 113,  27
	.byte	132, 125,   4,  35, 245, 119, 219,  40, 147,  36, 199,  64, 123, 171, 202,  50
	.byte	188, 190, 201,  21,  10, 190, 158,  60,  76,  13,  16, 156, 196, 103,  29,  67
	.byte	182,  66,  62, 203, 190, 212, 197,  76,  42, 126, 101, 252, 156,  41, 127,  89
	.byte	236, 250, 214,  58, 171, 111, 203,  95,  23,  88,  71,  74, 140,  25,  68, 108
	.ident	"Jasmin Compiler development version at commit 65bd039b152789f7c67a8ab069b69e5050dc1b69 on branch main"
	.section	".note.GNU-stack", "", %progbits
