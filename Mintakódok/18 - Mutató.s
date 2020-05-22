# Pointerek (címek)

    .intel_syntax noprefix
    .globl  main,a,b,c
    .data
a:  .4byte  4
b:  .4byte
c:  .zero   8 # 8 bájtos long változó inicializálása (NULL)  
#    comm   c,8

main:
        mov     QWORD PTR[c], OFFSET FLAT:a
        mov     rbx, QWORD PTR[c]               # 8 bájt -> rax
        mov     eax, DWORD PTR[rbx]             # eax = *c
        mov     DWORD PTR[b], eax
        mov     eax, DWORD PTR[b]
        ret


### C style ###
# int a=4;
# int b=5;
# int *c=NULL;
# //int *c;
# int main(){
#   c=&a;
#   b=*c;
#   return b;  
#   }

