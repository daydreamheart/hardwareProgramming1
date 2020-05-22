# Megszakítás

        .intel_syntax noprefix
        .section    .rodata
TEXT:   .string     "Hello world!\n"
        .globl      main

main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 4
        mov     ebx, 1
        mov     rcx, OFFSET FLAT: TEXT  # sztring kezdőcíme
        mov     edx, 13                 # adat (sztring) mérete
        int     0x80                    # megszakítás generálása
        mov     rsp, rbp
        pop     rbp
        ret

# ## C style ###
# #include<stdio.h>
# #include<math.h>
# int main(){
#   double x,y,z,R;
#   puts("Enter a real number: ");
#   scanf("%lf",&x);
#   y=2.25;
#   z=sqrt(y);
#   R=x+y*z;
#   printf("The result is %lf.\n",R);
#   return 0; 
#   }
