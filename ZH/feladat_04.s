# Magyar Melinda Barbara - Feladat 4

    .intel_syntax   noprefix
    .globl  main, oszthato

oszthato:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 12
        mov     DWORD PTR[rbp-4], edi          # 121
        mov     DWORD PTR[rbp-8], esi          # 11

        mov     eax, DWORD PTR[rbp-4]          # 121
        mov     ebx, DWORD PTR[rbp-8]          # 11
        cdq
        idiv    ebx

        cmp     edx, 0
        je      else
        mov     eax, 0
        jmp     end

else:   mov     eax, 1
        jmp     end

end:
        mov     DWORD PTR[rbp-12], eax
        mov     eax, DWORD PTR[rbp-12]
        mov     rsp, rbp
        pop     rbp
        ret

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4

        mov     edi, 121
        mov     esi, 11
        call    oszthato
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        
        mov     rsp, rbp
        pop     rbp
        ret
        