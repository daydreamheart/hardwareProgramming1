# Logikai operátorok (&& and ||)

    .intel_syntax noprefix
    .globl  main,a,b,c,d
    .data
a:  .4byte  3
b:  .4byte  5
    .comm   c,4
    .comm   d,4

main:
        mov     eax, DWORD PTR[a]
        cmp     eax, 3
        jne     ELSE1                           # shortcut evaluation
        mov     eax, DWORD PTR[b]
        cmp     eax, 5
        jne     ELSE1
        mov     DWORD PTR[c], 10
        jmp     NEXT1


ELSE1:  mov     DWORD PTR[c], 0

NEXT1:
        mov     eax, DWORD PTR[a]
        cmp     eax, 3        
        jne     TRUE                            # short evaluation
        mov     eax, DWORD PTR[b]
        cmp     eax, 5
        jne     ELSE2

TRUE:   mov     DWORD PTR[d], 1
        jmp     NEXT2

ELSE2:  mov     DWORD PTR[d], 0

NEXT2:
        mov     eax, DWORD PTR[c]
        mov     ebx, DWORD PTR[d]
        add     eax, ebx
        ret





### C style ###
# int a=3;
# int b=5;
# int c;
# int d;
# int main(){
#   if(a==3 && b==5)
#     c=10;
#   else
#     c=0;
#   if(a==3 || b==5)  
#     d=1;
#   else
#     d=0;
#   return c+d;  
#   }
