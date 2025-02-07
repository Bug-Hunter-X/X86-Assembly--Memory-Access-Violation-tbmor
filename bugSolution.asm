section .data

array dd 10, 20, 30, 40, 50 ; Example array
arraySize equ $-array ; Calculate the size of the array

section .text

global _start

_start:
    mov esi, array ; Load the base address of the array
    mov ecx, 2 ; Index to access array[2] (30)
    cmp ecx, arraySize ; Check the bounds of the array
    jge error_handling ; Handle the error if out of bounds
    mov eax, [esi + ecx*4] ; Access element at the specified index
    ; ... further processing of eax
    jmp exit_program

error_handling:
    ; Handle the error appropriately, e.g., print an error message or exit
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80