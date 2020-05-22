	.intel_syntax noprefix
 	.globl     max

 max:
 	push rbp
 	mov rbp, rsp 	
 	sub rsp, 12			#1. paraméter (8 bájt) + 2. apraméter (4 bájt)
 	mov QWORD PTR[rbp-8], rdi
 	mov DWORD PTR[rbp-12], esi
 	mov eax, 0			#max
 	mov ebx, 0			#i

COMP:
	cmp eax, DWORD PTR[rbp-12]
	jge OUT
 	
 	cdqe
 	mov ecx, DWORD PTR[rdi+rax*4] 	#aktuális elem
 	inc eax				#i++ 	
 	cmp ecx, ebx
 	jl COMP
 	mov ebx, ecx
 	jmp COMP

OUT:
	mov eax, ebx 
 	mov rsp, rbp
 	pop rbp
 	ret
