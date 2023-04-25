.data
	intro: .asciiz "Enter three signed integers: \n"
	zeroDen: .asciiz "Division by zero"
	overflow: .asciiz "\nThere is overflow"
	noOverflow: .asciiz "\nThere is no overflow"
.text
	li $v0, 4
	la $a0, intro
	syscall
	li $v0, 5
	syscall
	move $s0, $v0 # a
	li $v0, 5
	syscall
	move $s1, $v0 # b
	li $v0, 5
	syscall
	move $s2, $v0 # c
	
	li $s3, 1
	li $t0, 1
	
	# b^c
loop: 	bgt $s3, $s2, exit
	mul $t0, $t0, $s1
	addi $s3, $s3, 1
	j loop
	
exit:	add $t0, $s0, $t0 # a + b^c
	
	mul $t1, $s0, $s0 # a^2
	sub $t1, $s2, $t1 # c - a^2
	beq $t1, $zero, L0 # if the denominator is zero
	
	div $t1, $t0, $t1 # (a + b^c) / (c - a^2)
	li $t2, 3
	mul $t2, $t2, $s1 # 3 * b
	add $s4, $t1, $t2 # ( (a + b^c) / (c - a^2) ) + 3 * b
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	addu $t0, $t1, $t2
	xor $t3, $t1, $t2
	slt $t3, $t3, $zero
	bne $t3, $zero, no_ovf
	
	li $v0, 10
	syscall
	
L0:
	li $v0, 4
	la $a0, zeroDen
	syscall
	li $v0, 10
	syscall
	
no_ovf: 
	li $v0, 4
	la $a0, noOverflow
	syscall
	li $v0, 10
	syscall
	
ovf: 
	li $v0, 4
	la $a0, overflow
	syscall
	li $v0, 10
	syscall
	
