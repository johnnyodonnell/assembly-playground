SECTION .rodata

true: db "true", 0x0a, 0
false: db "false", 0x0a, 0



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

    mov EAX, 0x1
    cmp EAX, 0x2
    jbe true_case_1
    call print_false
true_case_1:
    call print_true

    mov EAX, 0x3
    cmp EAX, 0x2
    ja true_case_2
    call print_false
true_case_2:
    call print_true

    ; exit program
    mov EBX, 0
    mov EAX, 0x1
    int 0x80

