[org 0x7c00]

MESSAGE_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0xa000

mov sp, bp

mov bx, MESSAGE

call print_string

mov bx, 0x0000

mov es, bx

mov bx, MESSAGE_OFFSET

mov dh, 1

mov dl, [BOOT_DRIVE]

call disk_load

call printDisc

jmp $

printDisc:

	pusha

	mov bx, MESSAGE_OFFSET

	call print_string

	popa

	ret
	

%include "print_string.asm"

%include "disk_load.asm"

BOOT_DRIVE db 0

MESSAGE db "This is a message to test out the print_string function", 0

times 510-($-$$) db 0

dw 0xaa55
