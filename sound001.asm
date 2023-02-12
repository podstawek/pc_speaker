.code16

start:
        mov     $182, %ax
	out	%ax, $0x43
	mov	$2560, %ax
	out	%ax, $0x42
	mov	%ah, %al
	out	%al, $0x42
	in	$0x61, %al
	or	$0b00000011, %al
	out	%al, $0x61
	mov	$255, %bx

.pause1:
	mov	$9500, %cx

.pause2:
	dec	%cx
	jne	.pause2
	dec	%bx
	jne	.pause1
	in	$0x61, %al
	and	$0b11111100, %al
	out	%al, $0x61

# return to DOS
	mov	$0x4c, %ax
	int	$0x21



