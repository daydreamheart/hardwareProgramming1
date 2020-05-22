# Kifejezések

    .intel_syntax noprefix
    .globl main
    .globl a,b,c
    .data
a:  .4byte 6
b:  .4byte 9
c:  .4byte 3

main:
        mov        ebx, DWORD PTR [a]      # eax=?  ebx=6  ecx=?  edx=?
        sub        ebx, 5                  # eax=?  ebx=1  ecx=?  edx=?
        mov        eax, DWORD PTR [b]      # eax=9  ebx=1  ecx=?  edx=?
        cdq                                # eax=9  ebx=1  ecx=?  edx=0
        mov        ecx, 4                  # eax=9  ebx=1  ecx=4  edx=0
        idiv       ecx                     # eax=2  ebx=1  ecx=4  edx=1
        and        ebx, edx                # eax=2  ebx=1  ecx=4  edx=1
        mov        ecx, 1                  # eax=2  ebx=1  ecx=1  edx=1
        mov        eax, DWORD PTR [c]      # eax=3  ebx=1  ecx=1  edx=1
        imul       eax, 8                  # eax=24 ebx=1  ecx=1  edx=1
        add        ecx, eax                # eax=24 ebx=1  ecx=25 edx=1
        sar        ecx, 2                  # eax=24 ebx=1  ecx=6  edx=1
        or         ebx, ecx                # eax=24 ebx=7  ecx=6  edx=1
        mov        eax, ebx                # eax=7  ebx=7  ecx=6  edx=1
        ret



### C nyelven ### 
# int a = 6, b = 9, c = 3;
# int main(){
#   return a-5&b%4|1+c*8>>2; 
#   // (((a-5)&(b%4))|((1+(c*8))>>2))
#   }