[org 0x7c00]

mov dx, 0xABCD

call print_hex

jmp $


print_hex:

	pusha

	mov bx, HEX_OUT

	add bx, 0x0006

	loopStart:

	sub bx, 0x0001

	cmp bx, 0x0001

	je end

	mov ax, dx

	and ax, 0x000f

	shr dx, 0x0004
	
	cmp ax, 0x000a	

	jl assignDigit	

	jge assignLetter


	end: 

	mov bx, HEX_OUT

	jmp print_string

	popa

	ret	


assignDigit:

	add byte [bx], al

	jmp loopStart


assignLetter:

	add byte [bx], al

	add byte [bx], 0x0007

	jmp loopStart


%include 'print_string.asm'

HEX_OUT:
	db '0x0000',0

times 510-($-$$) db 0

dw 0xaa55
