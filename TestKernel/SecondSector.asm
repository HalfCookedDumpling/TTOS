[bits 32]

start:

	mov ebx, SECOND_SECTOR_MSG

	call print_string_pm

	jmp $

%include "print_hex.asm"

%include "print_string_32bit.asm"

SECOND_SECTOR_MSG db "This is printed from the second sector!", 0

times 512-($-$$) db 0
