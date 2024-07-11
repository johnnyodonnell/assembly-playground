SECTION .rodata

true: db "true", 0x0a, 0
false: db "false", 0x0a, 0

zero: dd 0
one: dd 1
two: dd 2



SECTION .text

extern printf
global main

print_true:
    push EBP
    mov EBP, ESP

    lea EAX, [rel true]
    push EAX
    call printf wrt ..plt

    mov ESP, EBP
    pop EBP
    ret

print_false:
    push EBP
    mov EBP, ESP

    lea EAX, [rel false]
    push EAX
    call printf wrt ..plt

    mov ESP, EBP
    pop EBP
    ret

main:
    mov EBP, ESP

    bt dword [rel zero], 0
    jnb true_case_1
    call print_false
true_case_1:
    call print_true

    bt dword [rel one], 0
    jb true_case_2
    call print_false
true_case_2:
    call print_true

    bt dword [rel one], 1
    jnb true_case_3
    call print_false
true_case_3:
    call print_true

    bt dword [rel two], 1
    jb true_case_4
    call print_false
true_case_4:
    call print_true

    ; exit program
    mov EBX, 0
    mov EAX, 0x1
    int 0x80

