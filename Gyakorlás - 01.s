# Osztás gyakorlása

    .intel_syntax noprefix
    .globl  main

main:
        mov     eax, 10
        cdq
        mov     ecx, 3
        idiv    ecx
        mov     eax, edx
        ret