# Imprime o valor de a de 0 até 20, num ciclo WHILE.

.data
	entrada: .asciiz "\nValor de a: "
.text
.globl main
main:
	li $t0, 0
	li $t1, 21
	while:
		bge $t0, $t1, fim
			li $v0, 4
			la $a0, entrada
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			add $t0, $t0, 1
			b while
	
	fim:
		li $v0, 10
		syscall
