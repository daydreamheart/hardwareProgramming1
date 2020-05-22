# Magyar Melinda - Feladat 1        

        .intel_syntax   noprefix
        .section        .rodata
FORM:   .string         "Az argumentumok száma: %d\n"
        .globl          main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 18
        mov     DWORD PTR[rbp-4], edi           #argc
        mov     QWORD PTR[rbp-12], rsi          #argv (sztring kezdőcíme)
        mov     eax, DWORD PTR[rbp-4]

        mov     esi, eax
        mov     edi, OFFSET FLAT:FORM     
        mov     eax, 0
        call    printf

        mov     eax, 0
        mov     rsp, rbp
        pop     rbp
        ret
