.data
	pounds: .asciiz "Enter weight in pounds: "
	feet: .asciiz "Enter height in feet: "
	fInput: .float 0.0
	inches: .float 12.0
	BMItotal: .asciiz "BMI is "
	underweight: .asciiz "\nBMI index is underweight"
	normalweight: .asciiz "\nBMI index is normal weight"
	overweight: .asciiz "\nBMI index is overweight"
	u: .float 18.5
	n: .float 24.9
	o: .float 25.0
.text
main:	lwc1 $f4, fInput
#Prompt user for weight in pounds
	li $v0, 4 
	la $a0, pounds
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
    	
#Prompt user for height in feet
	li $v0, 4 
	la $a0, feet
	syscall
	li $v0, 6 
	syscall
	add.s $f2, $f0, $f4
	
#Calulating BMI
	l.s $f1, inches
	mul.s $f2, $f2, $f1
	mul.s $f2, $f2, $f2
	mul $s0, $s0, 703
	mtc1, $s0, $f20
	cvt.s.w, $f20, $f20
	div.s $f12, $f20, $f2
	mov.s $f3, $f12
#States BMI
	li $v0, 4 
	la $a0, BMItotal
	syscall
	li $v0, 2
	syscall
#Determine weight class
	l.s $f4, u
	l.s $f5, n
	l.s $f6, o
	c.lt.s $f3, $f4
	bc1t under
	c.le.s $f3, $f5
	bc1t normal
	c.le.s $f6, $f3
	bc1t over
	li, $v0, 10
 	syscall
	
# Finds the appropriate statment to print out according the BMI
under:	li $v0, 4 
	la $a0, underweight
	syscall
	li, $v0, 10
 	syscall
	
normal: li $v0, 4 
	la $a0, normalweight
	syscall
	li, $v0, 10
 	syscall
	
over: 	li $v0, 4 
	la $a0, overweight
	syscall
	li, $v0, 10
 	syscall
