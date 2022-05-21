; bx register as the pointer to the start of the string

print_string:

	pusha

	mov ah, 0x0e

	jmp print_loop

print_loop:

	mov al, [bx]

	cmp al, 0

	je done 

	int 0x10

	add bx, 0x0001

	jmp print_loop

done:

	popa

	ret
