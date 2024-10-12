# Írjunk egy Assembly programot, mely eltárol két lokális változót a veremben! 
# A program visszatérési értéke a két változó összege legyen!

    .intel_syntax noprefix
    .globl  main

main:
        push     rbp
        mov      rbp, rsp
        sub      rsp, 8
        mov      DWORD PTR[rbp-4], 26
        mov      DWORD PTR[rbp-8], 72
        mov      eax, DWORD PTR[rbp-4]
        mov      ebx, DWORD PTR[rbp-8]
        add      eax, ebx
        mov      rsp, rbp
        pop      rbp
        ret




#### C style ####
# int main(){
# 	int a = 26;
#	int b = 72;
#	return a + b;
# }
