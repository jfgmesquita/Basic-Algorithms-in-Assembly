# Lê um número introduzido pelo utilizador e apresenta-o em binário.

.data
	entrada: .asciiz "Introduza um número: "
	saida: .asciiz " Esse número em binário é "
	zero: .asciiz "0"
	um: .asciiz "1"
.text
.globl main
main:
	li $v0, 4
	la $a0, entrada
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, saida
	syscall
	
	li $t1, 0
	li $t2, 0x80000000
	
	for:
		bgt $t1, 31, fim
		and $t3, $t0, $t2
		beqz $t3, igual
		bnez $t3, diferente
		
		igual:
			li $v0, 4
			la $a0, zero
			syscall
			b end_if
		
		diferente:
			li $v0, 4
			la $a0, um
			syscall
		
		end_if:
			sll $t0, $t0, 1
			add $t1, $t1, 1
			b for
	
	fim:
		li $v0, 10
		syscall
