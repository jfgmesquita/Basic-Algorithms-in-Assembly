# Escreva um programa que leia 3 números inteiros do utilizador, garantindo que todos eles são positivos e diferentes entre si. Se o utilizador tentar introduzir um valor igual a um valor já introduzido, o programa deverá repetir o pedido de introdução do valor.
# EM CONSTRUÇÃO: Como validar se o número introduzido é inteiro sem o programa rebentar?

.data
	barra: .asciiz "\n****************************************************************"
	intro: .asciiz "\n Introduza 3 números inteiros, positivos e diferentes entre si."
	str1: .asciiz "\n Introduza o primeiro número inteiro e positivo: "
	str2: .asciiz "\n Introduza o segundo número inteiro, positivo e diferente do anterior: "
	str3: .asciiz "\n Introduza o último número inteiro, positivo e diferente dos anteriores: "
	erro: .asciiz " Erro: número introduzido inválido. Tente novamente."
	fim: .asciiz "\n Os três números introduzidos foram "
	vir: .asciiz ", "
	e: .asciiz " e "
	ponto: .asciiz "."
	espaço: .asciiz "\n "

.text
.globl main
main:
	# Introdução
	li $v0, 4
	la $a0, barra
	syscall
	li $v0, 4
	la $a0, intro
	syscall
	li $v0, 4
	la $a0, barra
	syscall
	li $v0, 4
	la $a0, espaço
	syscall
	
	# Leitura do primeiro número
	primeiro:
		li $v0, 4
		la $a0, str1
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
	
		blez $t0, erro1
		b segundo
	
		erro1:
			li $v0, 4
			la $a0, erro
			syscall
			b primeiro
	
	# Leitura do segundo número
	segundo:
		li $v0, 4
		la $a0, str2
		syscall
		li $v0, 5
		syscall
		move $t1, $v0
	
		bgtz $t1, diferente
		b erro2
		
		diferente:
			beq $t0, $t1, erro2
			b terceiro
			
		erro2:
			li $v0, 4
			la $a0, erro
			syscall
			b segundo
	
	# Leitura do terceiro número
	terceiro:
		li $v0, 4
		la $a0, str3
		syscall
		li $v0, 5
		syscall
		move $t2, $v0
		
		bgtz $t2, diferente2
		b erro3
		
		diferente2:
			beq $t0, $t2, erro3
			beq $t1, $t2, erro3
			b imprimir
			
		erro3:
			li $v0, 4
			la $a0, erro
			syscall
			b terceiro
	
	# Impressão dos números introduzidos
	imprimir:
		li $v0, 4
		la $a0, barra
		syscall
		li $v0, 4
		la $a0, fim
		syscall
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, vir
		syscall
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, e
		syscall
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, ponto
		syscall
		li $v0, 4
		la $a0, barra
		syscall
		li $v0, 10
		syscall
