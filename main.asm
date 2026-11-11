section .rodata
act:
    dq 1
    dq 0
    dq 0
    dq 0

root:
	db "/"
	db 0

section .text
	global _start

_start:
	mov eax, 13
	mov edi, 1
	lea rsi, [rel act]
	xor edx, edx
	mov r10, 8
	syscall

	mov eax, 57
	syscall

	test rax, rax
	js fail
	jnz done

	mov eax, 112
	syscall

	mov eax, 80
	lea rdi, [rel root]
	syscall

	mov eax, 95
	xor edi, edi
	syscall

	mov eax, 436
	xor edi, edi
	mov esi, -1
	xor edx, edx
	syscall

stp:
	mov eax, 34
	syscall
	jmp stp

done:
	xor edi, edi
	jmp exit

fail:
	mov edi, 1

exit:
	mov eax, 231
	syscall
