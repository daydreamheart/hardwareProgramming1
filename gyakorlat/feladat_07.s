# Deklaráljunk egy tömböt 5 elemmel
# Keressük meg a legnagyobb értékét

    .intel_syntax   noprefix
    .globl  main, A, max
    .data
A:  .4byte  1
    .4byte  9
    .4byte  10
    .4byte  3
    .4byte  2
    .comm   max, 4

main:
        mov     eax, DWORD PTR[A]
        mov     DWORD PTR[max], eax
        mov     eax, 1

loop:
        mov     ebx, DWORD PTR[max]
        mov     ecx, DWORD PTR[A+eax*4]
        cmp     ebx, ecx
        jg      next
        mov     DWORD PTR[max], ecx

next:
        inc     eax
        cmp     eax, 5
        jl      loop
        
        
        mov     eax, DWORD PTR[max]
        ret
