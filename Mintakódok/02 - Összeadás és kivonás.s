# Egész számok összeadása és kivonása

    .intel_syntax noprefix
    .globl  main

main:
#        mov     eax, 3      # eax = 3
#        add     eax, 4      # eax = eax + 4 (immediate addressing)
#        sub     eax, 5      # eax = eax - 5
        mov     eax, 6      # eax = 6
        mov     ebx, 7      # ebx = 7
        add     eax, ebx    # eax = eax + ebx (register addressing)
        ret