# Írjunk egy Assembly programot, mely eltárol egy 5 elemű lokális tömböt a veremben! 
# A program visszatérési értéke a tömb elemeinek összege legyen!

    .intel_syntax noprefix
    .globl main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 28
        mov     DWORD PTR[rbp-28], 0
        mov     DWORD PTR[rbp-24], 0
        mov     DWORD PTR[rbp-20], 3
        mov     DWORD PTR[rbp-16], 6
        mov     DWORD PTR[rbp-12], 12
        mov     DWORD PTR[rbp-8], 24
        mov     DWORD PTR[rbp-4], 48
        jmp     cond

body:   
        mov     eax, DWORD PTR[rbp-24]
        cdqe
        mov     ebx, DWORD PTR[rbp-28]
        add     ebx, DWORD PTR[rbp+rax*4-20]
        mov     DWORD PTR[rbp-28], ebx

        inc     eax
        mov     DWORD PTR[rbp-24], eax

cond:   mov     eax, DWORD PTR[rbp-24]
        cmp     eax, 5
        jl      body


        mov     eax, DWORD PTR[rbp-28]
        mov     rsp, rbp
        pop     rbp
        ret


# C program
# int main(){
#	int arr[5] = {3, 6, 12, 24, 48};
#	int i = 0;
#	int sum = 0;
#	while (i < 5) {
#		sum += arr[i];
#		i++;
#	}
#	return sum;
# }