[bits 32]
start:

	call turn_screen_white

	mov eax, YYYY1234

	call print_hex
	
	call YYYY1234

	jmp $
	
turn_screen_white:

	pusha			; Push all the registers onto the stack

	mov ebx, 0xB8000	; move location of video memory to ebx 

	mov al, ' '		; Fill the character with a space

	mov ah, 0xFF		; Set the character and background to white

	jmp turn_screen_white_loop


turn_screen_white_loop:

	cmp ebx, 0xB8FA0

	je turn_screen_white_done
	
	mov [ebx], ax

	add ebx, 0x0002

	jmp turn_screen_white_loop
		

turn_screen_white_done:

	popa 

	ret


print_string_32bit:

	pusha

	mov edx, 0xB80A0

	mov al, [YYYY1234]

	mov ah, 0xF0

	mov [edx], ax

	popa

	ret

%include "print_hex.asm"

times 200-($-$$) db 0

db 0x0068

times 300-($-$$) db 0

YYYY1234:

	pusha

	mov edx, 0xB8140

	mov al, [200]

	mov ah, 0xF0

	mov [edx], ax

	popa

	ret

times 512-($-$$) db 0
