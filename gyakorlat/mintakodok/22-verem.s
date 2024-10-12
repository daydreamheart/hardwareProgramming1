# A verem

    .intel_syntax noprefix
    .globl  main

main:
        mov     rcx, 8
        push    rcx                 # eltárolja rcx (8 bájt) értékét a verem tetején rsp = rsp-8
        mov     rcx, 7
        push    rcx
        mov     rcx, 6
        push    rcx
        mov     rcx, 5
        push    rcx
        mov     rcx, 4
        push    rcx
        mov     rcx, 3
        push    rcx
        mov     rcx, 2
        push    rcx         
        pop     rbx                 # a verem tetején lévő érték átkerül az rbx-be rsp = rsp+8
        pop     rbx
        pop     rbx
        pop     rax                 # visszatérési értéket tárolja
        add     rsp, 24
        ret





### C style ###
# /* NOT AVAILABLE, IMPOSSIBLE */
