.data
    str1: .asciiz "Valor de A:\n"
    str2: .asciiz "Valor de B:\n"
    str3: .asciiz "Resultado:\n"
.text
.globl main
main:
    la $a0, str1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    la $a0, str2
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    bgt $t0, $t1, a_maior_b
    ble $t0, $t1, a_menor_igual_b

    a_maior_b:
        sub $t2, $t0, $t1
        b imprimir

    a_menor_igual_b:
        sub $t2, $t1, $t0

    imprimir:
        la $a0, str3
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

    li $v0, 10
    syscall