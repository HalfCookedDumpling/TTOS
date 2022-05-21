print_string:

	pusha

	mov ah, 0x0e

main_loop:

	mov al, [bx]

	cmp al, 0

	jne continue

	popa

	ret	

continue:

	int 0x10

	add bx, 0x0001

	jmp main_loop 

