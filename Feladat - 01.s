# Két globális változóként megadjuk egy téglalap két oldalát.
# A program adja vissza a kerületét.

    .intel_syntax noprefix
    .globl main
    .globl a, b
a:  .4byte 6
b:  .4byte 8

main:
        mov     eax, DWORD PTR [a]      # eax = 6
        mov     ebx, DWORD PTR [b]      # ebx = 8
        add     eax, ebx                # eax = eax + ebx
        imul    eax, 2
        ret