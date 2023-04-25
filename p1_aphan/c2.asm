# F = (a+b) – (c+d) + (b+3)
.data
	aValue: .asciiz "Enter value a: "
	bValue: .asciiz "Enter value b: "
	cValue: .asciiz "Enter value c: "
	dValue: .asciiz "Enter value d: "
	f: .asciiz "F = "
.text 
	#Asking for A
	li $v0, 4
	la $a0, aValue
	syscall 
	li $v0,5
	syscall
	move $s0, $v0 #storing a 
	
	#Asking for B
	li $v0, 4
	la $a0, bValue
	syscall
	li $v0, 5
	syscall
	move $s1,$v0
	
	#Asking for C
	li $v0, 4
	la $a0, cValue
	syscall
	li $v0, 5
	syscall
	move $s2,$v0
	
	#Asking for D
	li $v0, 4
	la $a0, dValue
	syscall
	li $v0, 5
	syscall
	move $s3,$v0
	
	#equation F
	add $t0, $s0, $s1
	add $t1, $s2, $s3
	addi $t2, $s1, 3 
	sub $t3, $t0, $t1
	add $s4, $t3, $t2
	
	#printing
	li $v0, 4
	la $a0, f
	syscall
	li $v0, 1
	move $a0, $s4
	syscall
