[org 0x7c00]

SECOND_SECTOR_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0xa000

mov sp, bp

mov bx, 0x0000

mov es, bx

mov bx, SECOND_SECTOR_OFFSET

mov dh, 1

mov dl, [BOOT_DRIVE]

call disk_load

call switch_to_pm

jmp $


%include "disk_load.asm"

%include "gdt.asm"

%include "switch_to_pm.asm"

%include "print_string.asm"

[bits 32]

BEGIN_PM:

	call SECOND_SECTOR_OFFSET	


BOOT_DRIVE db 0

times 510-($-$$) db 0

dw 0xaa55
