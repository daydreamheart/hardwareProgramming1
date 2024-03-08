# Írjunk egy programot, mely generál egy randomszámot, és eldönti róla, hogy páros-e! 
# Ha igen, a program írja ki a képernyőre a ’T’, ha nem, az ’F’ karaktert. 
# A program visszatérési értéke a generált randomszám legyen.
	
	.intel_syntax noprefix
	.globl     main

main:
		push rbp
		mov rbp, rsp
		sub rsp, 4							# r
		mov edi, 0							# paraméter: NULL
		call time							# time(NULL)
		mov edi, eax						# a visszatérési érték a következő hívás paramétere
		call srand							# srand(time(NULL))
		call rand							# rand()
		mov DWORD PTR[rbp-4], eax			# r = rand()
		mov ecx, 2							# ecx = 2 (a vizsgálathoz)
		cdq									# eax -> edx:eax
		idiv ecx							# eax = eax/ecx, edx = eax%ecx
		cmp edx, 0							# edx == 0
		jne FALSE
		mov edi, 84							# paraméter: 'T'
		jmp OUT

FALSE:
		mov edi, 70							# paraméter: 'F'	

OUT:
		call putchar						# putchar() - paraméter EDI-ben
		mov edi, 10							# '\n'
		call putchar						# putchar('\n')
		mov eax, DWORD PTR[rbp-4]			# eax = r
		mov rsp, rbp
		pop rbp
		ret
