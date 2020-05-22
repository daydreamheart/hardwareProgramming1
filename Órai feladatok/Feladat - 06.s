# Három érték maximuma (három regiszterrel)

    .intel_syntax noprefix
    .globl  main,a,b,c
    .data
a:  .4byte  13
b:  .4byte  5
c:  .4byte  10

main:
        mov     eax, DWORD PTR[a]
        mov     ebx, DWORD PTR[b]
        mov     ecx, DWORD PTR[c]

        cmp     eax, ebx            # 3 > 5
        jle     B                   # ha nem, akkor -> b

        cmp     eax, ecx            # 3 > 10
        jle     C                   # ha nem akkor -> c

        jmp     maximum             # a változó a max
B:
        cmp     ebx, ecx            # 5 > 10
        jle     C                   # ha nem, akkor -> c

        mov     eax, DWORD PTR[b]   # egyébként a b a max
        jmp     maximum
C:
        mov     eax, DWORD PTR[c]   # mindenre vizsgáltuk, a c a max
maximum:  
        ret
