# Ler dois números e escrever a comparação entre eles.

.data
	str1: .asciiz "Valor de A:\n"
	str2: .asciiz "Valor de B:\n"
	str3: .asciiz " é maior que "
	str4: .asciiz " é igual a "
	str5: .asciiz " é menor que "
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

	bgt $t0, $t1, print_maior
	beq $t0, $t1, print_igual

	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, str5
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	b fim

	print_maior:
       		li $v0, 1
        	move $a0, $t0
        	syscall
        	li $v0, 4
        	la $a0, str3
        	syscall
        	li $v0, 1
        	move $a0, $t1
        	syscall
        	b fim

	print_igual:
        	li $v0, 1
        	move $a0, $t0
        	syscall
        	li $v0, 4
        	la $a0, str4
        	syscall
        	li $v0, 1
        	move $a0, $t1
        	syscall

	fim:
		li $v0, 10
		syscall
