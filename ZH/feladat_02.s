# Magyar Melinda Barbara - Feladat 2

        .intel_syntax   noprefix
        .globl          main, alap, kitevo, a
alap:   .4byte          3
kitevo: .4byte          4
a:      .4byte          1
        .data

main:
        mov     eax, DWORD PTR[a]
        mov     ebx, DWORD PTR[kitevo]
        jmp     cond

body:  
        imul    eax, DWORD PTR[alap]
        dec     ebx

cond:
        cmp     ebx, 0
        jne     body

        ret
        