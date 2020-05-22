# Az if-else szerkezet

    .intel_syntax noprefix
    .globl  main,a,b,c
    .data
a:  .4byte  2
b:  .4byte  3
    .comm   c, 4

main:
        mov     eax, DWORD PTR[a]
        mov     ebx, DWORD PTR[b]
        cmp     eax, ebx
#       jne     else                    # jump to else if eax!=ebx
#       je      else                    # jump to else if eax==ebx
       jle     else                    # jump to else if eax<=ebx
#       jl      else                    # jump to else if eax<ebx
#       jge     else                    # jump to else if eax>=ebx
#       jg      else                    # jumpt to else if eax>ebx
        mov     DWORD PTR[c], 1
        jmp     next
else:
        mov     DWORD PTR[c], 0
next:
        mov     eax, DWORD PTR[c]
        ret