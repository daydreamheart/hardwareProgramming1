# A while és a for ciklusok
# A számot a számra emeljük. Pld. 2-t az 5. hatványra.
# Addig fut a ciklus, amíg i != a hatvánnyal

    .intel_syntax noprefix
    .globl  main, a, b
    .data
a:  .4byte  2
    .comm   i, 4

main:
        mov     DWORD PTR[i], 0            # i=0
        jmp     cond                       # ugrás az adott címkére

body:
        mov     eax, DWORD PTR[a]          # eax=a
        imul    eax, 2                     # eax*2 (a*2)
        mov     DWORD PTR[a], eax          # a = eax
        mov     eax, DWORD PTR[i]
        inc     eax                        # eax++ (i++)
        mov     DWORD PTR[i], eax          # i = eax

cond:
        mov     eax, DWORD PTR[i]          # eax=i
        cmp     eax, 5
        jne     body

        mov     eax, DWORD PTR[a]
        ret
