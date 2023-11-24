.data
	num:	.float 0.0
	mag:	.float 20.0
	os:	.float 25.0
	altura:	.asciiz "Altura: "
	peso:	.asciiz "Peso: "
	normal:	.asciiz "\nNormal \n"
	magro:	.asciiz "\nMagro \n"
	obeso:	.asciiz "\nObeso \n"
.text
.globl main
	main:
		lwc1 $f1, num
		
		li $v0, 4
		la $a0, altura
		syscall
		li $v0, 6
		syscall
		add.s $f3, $f0, $f1
		
		li $v0, 4
		la $a0, peso
		syscall
		li $v0, 6
		syscall
		add.s $f5, $f0, $f1
		
		mul.s $f3, $f3, $f3
		div.s $f12, $f5, $f3
		
		l.s $f15, mag
		c.lt.s $f12, $f15
		bc1t magrinho
		
		l.s $f15, os
		c.le.s $f12, $f15
		bc1t normalzinho
		
		li $v0, 4
		la $a0, obeso
		syscall
		b fim
		
		magrinho:
			li $v0, 4
			la $a0, magro
			syscall
			b fim
			
		normalzinho:
			li $v0, 4
			la $a0, normal
			syscall
			
		fim:
			li $v0, 10
			syscall