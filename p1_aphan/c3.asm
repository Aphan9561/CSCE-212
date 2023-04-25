.data
	startMessage: .asciiz "Program start\n"
	exitMessage: .asciiz "Program ends\n"
	nextLine: .asciiz  "\n"
.text
	li $s0, 0 #i = 0
	li $s1, 3 #j = 3
	li $s2, 5 #k = 5
	
	#prints start
	li $v0, 4
	la $a0, startMessage
	syscall
	
loop:	bge $s0, 5, exit
	add $t0, $s0, $s1
	sub $t0, $t0, $s2
	#prints F value
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, nextLine
	syscall
	addi $s0, $s0, 1
	j loop
	
exit:	#print ending
	li $v0, 4
	la $a0, exitMessage
	syscall