[bits 32]

VID_MEM equ 0xB8000

COLOR equ 0xF0

; Pass in eax as the hexadecimal number

; In order to print, we need a register on VID_MEM and another with the values

print_hex:

	pusha 			; Push all the registers onto the stack

	mov ebx, VID_MEM	; Set ebx to the memory address of VGA

	mov dl, '0'		; Set lower byte of ax to the char '0'

	mov dh, COLOR		; Set upper byte of ax to the color 

	mov [ebx], dx		; Set the address of VGA to hold char at ax

	add ebx, 0x0002		; Move ebx to the next place in VGA

	mov dl, 'x'		; Set lower byte of ax to the char 'x'

	mov [ebx], dx		; Set the address of VGA to hold char at ax

	add ebx, 0x0012		; Set address to the 11th character 

print_hex_loop:

	sub ebx, 0x0002		; Set address to preceding character 

	cmp ebx, 0xB8002	; Check if address is to 2nd character

	je print_hex_done	; If address if 2nd character, return

	mov edx, eax		; Copy hexadecimal into edx

	and edx, 0x000F		; Isolate the last 4 bytes

	shr eax, 0x0004		; Shift the original hexadecimal by 4

	cmp edx, 0x000A		; Check if it is a digit or letter

	jl print_hex_assign_digit	

	jge print_hex_assign_letter	


print_hex_assign_digit:

	add dl, 0x0030		; Adds 48 or 0x30 to get ascii code of digit

	mov dh, COLOR		; Sets upper byte of dx to the right color

	mov [ebx], dx		; Sets the character in VGA table

	jmp print_hex_loop	; Go back to main loop


print_hex_assign_letter:

	add dl, 0x037		; Adds 55 or 0x37 to get ascii code of letter

	mov dh, COLOR		; Sets upper byte of dx to the right color

	mov [ebx], dx		; Sets the character in VGA table

	jmp print_hex_loop	; Go back to main loop


print_hex_done:

	popa			; Pop all the registers from the stack

	ret			; Return to caller
	
