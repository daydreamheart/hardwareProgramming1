# Fibonacci

    .intel_syntax noprefix
    .globl main, a
    .data
    .comm   A, 40

main:
        mov     DWORD PTR[A], 0
        mov     DWORD PTR[A+4], 1
        mov     eax, 2

loop:
        mov     ebx, DWORD PTR[A+(eax*4)-4]
        mov     ecx, DWORD PTR[A+(eax*4)-8]
        add     ebx, ecx
        mov     DWORD PTR[A +(eax*4)], ebx
        jmp     next

next:
        inc     eax
        cmp     eax, 10
        jl      loop

        mov     eax, DWORD PTR[A+36]
        ret





### C style ### 
# int a[10]
# int main
# a[0] = 0
# a[1] = 1
# i = 2
# while(i<10){
#   a[i] = a[i-1]+ A[i-2]
#   i++
# }
# return A[9]
