print_string:

	pusha

	mov ah, 0x0e

main_loop:

	mov al, [bx]

	cmp al, 0

	je done

	int 0x10

	add bx, 0x0001

	jmp main_loop

done:

	popa

	ret
