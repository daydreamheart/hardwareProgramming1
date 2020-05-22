# Magyar Melinda - Feladat 3

        .intel_syntax   noprefix
        .section        .rodata
SFS:    .string         "%d %d"
PFS1:    .string         "A > B\n"
PFS2:    .string         "A <= B\n"
        .globl          main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64

        mov     edi, OFFSET FLAT:SFS
        mov     eax, 0

        lea     rdx, [rbp-4]
        lea     rsi, [rbp-8]
        call    scanf

        mov     eax, DWORD PTR[rbp-4]
        mov     ebx, DWORD PTR[rbp-8]
        cmp     eax, ebx
        jg      else

        mov     edi, OFFSET FLAT:PFS1
        mov     eax, 0
        call    printf
        jmp     end


else:
        mov     edi, OFFSET FLAT:PFS2
        mov     eax, 0
        call    printf

 end:
        mov     eax, 0
        mov     rsp, rbp
        pop     rbp
        ret
