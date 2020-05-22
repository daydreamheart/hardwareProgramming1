# Adott egy téglalap kerülete és a másik oldala globális változóként.
# A program számolja ki a másik oldalát

    .intel_syntax noprefix
    .globl main
    .globl a, b
a:  .4byte 28
b:  .4byte 8

main:
            mov     eax, DWORD PTR [a]      # eax = 28
            cdq                             # eax -> edx
            mov     ebx, 2                  # ebx = 2
            idiv    2                       # edx/ecx
            mov     ecx, DWORD PTR [b]      # ecx = 8
            sub     eax, ecx
            ret