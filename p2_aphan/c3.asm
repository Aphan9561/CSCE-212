.data
	num_hw: .asciiz "Enter number of homeworks: "
	avg_hw: .asciiz "Enter average time to complete each homework in hours: "
	num_exe: .asciiz "Enter number of exercises: "
	avg_exe: .asciiz "Enter average time to complete each exercise in hours: "
	totalHr: .asciiz "The total work hour is: "
.text
main:	
#Prompting user for number of homeworks
	li $v0, 4 
	la $a0, num_hw
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
# Prompting user for average time to complete homework in hours
	li $v0, 4 
	la $a0, avg_hw
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
# Promting user for number of exercises
	li $v0, 4 
	la $a0, num_exe
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
# Promting user for average time to complete exercise in hours
	li $v0, 4 
	la $a0, avg_exe
	syscall
	li $v0, 5
	syscall
	move $t3, $v0
# Calculation
	li $v0, 4 
	la $a0, totalHr
	syscall
	jal total
	li $v0, 1
	move $a0, $v1
	syscall
	li $v0, 10
	syscall
	
# adding homework hours and exercise hours
total:	 
	#num_hw x avg_hw
	mul $s0, $t0, $t1
	#num_exe x avg_exe
	mul $s1, $t2, $t3
	#adding for total work hours
	add $v1, $s0, $s1
	jr $ra