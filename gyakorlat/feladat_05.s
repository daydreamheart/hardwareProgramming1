# Háromszög egyenlőtlenség
# A program megvizsgálja, hogy bármely két oldalhossz 
# összege nagyobb-e a 3. oldal hosszánál

    .intel_syntax noprefix
    .globl  main,a,b
    .data
a:  .4byte  5
b:  .4byte  6
c:  .4byte  10

main:
        mov     eax, DWORD PTR[a]
        mov     ebx, DWORD PTR[b]
        mov     ecx, DWORD PTR[c]
        add     eax, ebx
        cmp     eax, ecx
        jle     bad

        mov     eax, DWORD PTR[a]
        add     eax, ecx
        cmp     eax, ebx
        jle     bad

        mov     eax, DWORD PTR[a]
        add     ebx, ecx
        cmp     ebx, eax
        jle     bad

        mov     eax, 1                  # ha egyik összeg sem volt <= a 3. oldalnál
        jmp     exit                    # hogy elkerüljük a "bad" programrészt

bad:
        mov     eax, 0

exit:
        ret
