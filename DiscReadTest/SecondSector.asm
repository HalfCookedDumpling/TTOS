[bits 32]

start:

	mov eax, 0xFFFF

	call print_hex

	jmp $

%include "print_hex.asm"

%include "print_string_32bit.asm"

SECOND_SECTOR_MSG db "This is printed from the second sector!", 0

times 512-($-$$) db 0
