mov bx, 10 

mov ah, 0x0e

cmp bx, 4

jle printA

cmp bx, 40

jl printB

mov al, 'C'

jmp print

printA:
	mov al, 'A'	
	jmp print

printB:
	mov al, 'B'

print:

int 0x10
	
jmp $

times 510-($-$$) db 0

dw 0xaa55
