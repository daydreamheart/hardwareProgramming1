# Írjunk egy Assembly programot, mely eltárol két lokális változót a veremben! 
# A program visszatérési értéke a két változó összege legyen!

	.intel_syntax noprefix
	.globl	main

main:
	push    rbp
	mov	    rbp, rsp
	sub	    rsp, 8
	mov	    DWORD PTR[rbp-8], 26
	mov	    eax, DWORD PTR[rbp-8]
	mov	    DWORD PTR[rbp-4], 72
	mov	    ebx, DWORD PTR[rbp-4]
	add	    eax, ebx
	mov	    rsp, rbp
	pop	    rbp
	ret
	