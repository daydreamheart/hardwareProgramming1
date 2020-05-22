	.intel_syntax noprefix
 	.globl     max

 max:
 	push rbp
 	mov rbp, rsp 	
 	sub rsp, 20			#1. paraméter (8 bájt) + 2. apraméter (4 bájt) + i és max változó (2*4 bájt)
 	mov QWORD PTR[rbp-8], rdi
 	mov DWORD PTR[rbp-12], esi
 	mov DWORD PTR[rbp-16], 0 	#max
 	mov DWORD PTR[rbp-20], 0 	#i

COMP:
	mov ebx, DWORD PTR[rbp-20] #i
	cmp ebx, DWORD PTR[rbp-12]
	jge OUT

 	mov eax, DWORD PTR[rbp-20]	#i
 	cdqe
 	mov ebx, DWORD PTR[rdi+rax*4] 	#aktuális elem
 	inc eax				#i++
 	mov DWORD PTR[rbp-20], eax	#i mentése
 	cmp ebx, DWORD PTR[rbp-16]
 	jl COMP
 	mov DWORD PTR[rbp-16], ebx
 	jmp COMP

 OUT:
 	mov eax, DWORD PTR[rbp-16]
 	mov rsp, rbp
 	pop rbp
 	ret
