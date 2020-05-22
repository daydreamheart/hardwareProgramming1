# Valós számok

        .intel_syntax noprefix
        .section    .rodata
TXT1:   .string     "Enter a real number: "
TXT2:   .string     "%lf"
TXT3:   .string     "The result is %lf.\n"
        .globl      main

# x: [rbp-32]
# y: [rbp-24]
# z: [rbp-16]
# R: [rbp-8]

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32                 # 8 * 3 bájt
        mov     edi, OFFSET FLAT: TXT1  # puts fgv egyetlen paramétere
        call    puts

        # scanf függvény paramétereinek betöltése és a fgv meghívása
        lea     rsi, [rbp-32]           # 2. paraméter (x változó címe)
        mov     edi, OFFSET FLAT: TXT2  # scanf formátumsztringje
        mov     eax, 0                  # mivel nem float ezért 0
        call    scanf

        mov     rax, 4612248968380809216    # y betöltése rax-ba
        mov     QWORD PTR[rbp-24], rax
        movsd   xmm0, QWORD PTR[rbp-24]
        call    sqrt                     # visszatérési érték: xmm0

        # SSE regiszterekből/be a movsd-t kell használni
        movsd   QWORD PTR[rbp-16], xmm0  # z változó
        movsd   xmm0, QWORD PTR[rbp-24]  # y betöltése xmm0-ba

        # SSE regiszterek szorzására  a mulsd-t kell használni
        mulsd   xmm0, QWORD PTR[rbp-16]  # y * z

        # SSE regiszterek összeadására az addsd-t kell használni

        addsd   xmm0, QWORD PTR[rbp-32]  # x + (y*z)
        movsd   QWORD PTR[rbp-8], xmm0   # R = x + (y*z)

        # printf paramétereinek betöltése
        movsd   xmm0, QWORD PTR[rbp-8]
        mov     edi, OFFSET FLAT: TXT3
        mov     eax, 1                      # 1 az R
        call    printf

        mov     eax, 0
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
