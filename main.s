	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	temp_var_1
	.section	.rodata
	.align	2
	.type	temp_var_1, %object
	.size	temp_var_1, 4
temp_var_1:
	.word	1000
	.global	temp_var_2
	.align	2
	.type	temp_var_2, %object
	.size	temp_var_2, 4
temp_var_2:
	.word	120
	.global	temp_var_3
	.bss
	.align	2
	.type	temp_var_3, %object
	.size	temp_var_3, 4
temp_var_3:
	.space	4
	.global	temp_var_4
	.align	2
	.type	temp_var_4, %object
	.size	temp_var_4, 4
temp_var_4:
	.space	4
	.global	temp_var_5
	.data
	.align	2
	.type	temp_var_5, %object
	.size	temp_var_5, 4
temp_var_5:
	.word	124
	.global	arr
	.bss
	.align	2
	.type	arr, %object
	.size	arr, 600
arr:
	.space	600
	.global	RCC
	.data
	.align	2
	.type	RCC, %object
	.size	RCC, 4
RCC:
	.word	1073876992
	.global	GPIOC
	.align	2
	.type	GPIOC, %object
	.size	GPIOC, 4
GPIOC:
	.word	1073811456
	.global	GPIOA
	.align	2
	.type	GPIOA, %object
	.size	GPIOA, 4
GPIOA:
	.word	1073809408
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Welcome \000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	initialise_monitor_handles
	ldr	r0, .L7
	bl	puts
	ldr	r3, .L7+4
	ldr	r3, [r3]
	ldr	r2, [r3, #24]
	ldr	r3, .L7+4
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #24]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	bic	r2, r2, #15728640
	str	r2, [r3, #4]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	orr	r2, r2, #1048576
	str	r2, [r3, #4]
.L6:
	ldr	r3, .L7+8
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	orr	r2, r2, #8192
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, .L7+12
	cmp	r3, r2
	blt	.L3
	ldr	r3, .L7+8
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L7+8
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L5:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	ldr	r2, .L7+12
	cmp	r3, r2
	blt	.L5
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	RCC
	.word	GPIOC
	.word	100000
	.size	main, .-main
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
