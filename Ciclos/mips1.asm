# Imprime o valor de x de 0 até 10. (DO FOR)

.data
	entrada: .asciiz "\n Valor de x: "
.text
.globl main
main:
	li $t0, 0
	loop:
		li $v0, 4
		la $a0, entrada
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		add $t0, $t0, 1
	ble $t0, 10, loop
	
	li $v0, 10
	syscall