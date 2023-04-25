.data
	intro: .asciiz "Enter in two postive numbers:\n"
.text
# Prompting the user to enter in two postive numbers 
	li $v0, 4
	la $a0, intro
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	li $v0, 5
	syscall
	move $s1, $v0

	li $s2, 1 # i=1
	li $t0, 0
	
# Keep adding the first number together til its the same amount as the second numbet\r
loop:	bgt $s2, $s1, exit
	add $t0, $t0, $s0
	addi $s2, $s2, 1
	j loop
	
#prints out the number
exit:	li $v0, 1
	move $a0, $t0
	syscall