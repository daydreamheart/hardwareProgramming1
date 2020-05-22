# Írjunk egy programot, mely rendelkezik egy globális változóval, 
# és egy eljárással, mely ezenváltozó érétkét négyzetre emeli! 
# A program addig hívja meg az eljárást, míg a változó értéke el nem éri a 10-et. 
# A program visszatérési értéke a változó értéke legyen!

    .intel_syntax noprefix
    .globl main, x
    .data
x:  .4byte  3

voidpow2:
            mov     eax, DWORD PTR[x]
            imul    eax, eax
            mov     DWORD PTR[x], eax
            ret

main:   
            cmp     DWORD PTR[x], 10
            jge     end   
            call    voidpow2
            jmp     main

 end:
            mov     eax, DWORD PTR[x]
            ret


# C style
# int x= 3;
# voidpow2(){
#    x =x*x;
# }
# int main(){
#    while (x < 10)
#        pow2();
#    return x;
# }
