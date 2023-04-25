.data
	introMessage: .asciiz "Enter three positve number\n"
	result: .asciiz "Smallest number that is not zero is: "
.text
# Prompts the user and gets input from user
	li $v0, 4
	la, $a0, introMessage
	syscall
	li $v0, 5 
	syscall
	move $t0, $v0
	li $v0, 5 
	syscall
	move $t1, $v0
	li $v0, 5 
	syscall
	move $t2, $v0
	li $v0, 4
	la, $a0, result
	syscall
# Finding the smallest number that is not a zero
	# if there is a zero
	beq $t0, $zero, C4
	beq $t1, $zero, C3
	beq $t2, $zero, C1
	# if there is not zero
	bne $t0, $zero, C0
	bne $t1, $zero, C0
	bne $t2, $zero, C0
	
 	li, $v0, 10
 	syscall
 	
C0: 	# compares the first and the second number
	blt $t0, $t1, C2
 	blt $t1, $t0, C3
 	
C1: 	# if $t2 is zero
	blt $t0, $t1, C5
 	blt $t1, $t0, C6
 	
C2: 	# compares the first and last number
	blt $t0, $t2, C5
   	blt $t2, $t0, C4
   	
C3:	# if $t1 is zero
   	blt $t0, $t2, C5
   	blt $t2, $t0, C7

C4:	# if $t0 is zero or the end of the comparing
 	blt $t1, $t2, C6
   	blt $t2, $t1, C7

C5:	# prints the first number if it is the smallest
   	li $v0, 1
   	move $a0, $t0
   	syscall
   	li, $v0, 10
   	syscall

C6:	# prints the second number if it is the smallest
    	li $v0, 1
    	move $a0, $t1
    	syscall
    	li, $v0, 10
    	syscall
	
C7:	# prints the third number if it is the smallest
    	li $v0, 1
    	move $a0, $t2
    	syscall
    	li, $v0, 10
    	syscall
	
