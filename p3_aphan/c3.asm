.data
	processor1: .asciiz "Processor A:\n"
	processor2: .asciiz "\nProcessor B:\n"
	ICmessage: .asciiz "Enter Instruction Count: "
	CPImessage: .asciiz "Enter CPI (Clock Per Instruction): "
	CRmessage: .asciiz "Enter a Clock Rate in GHz: "
	A: .asciiz "\nA is "
	GreaterA: .asciiz " times as fast as B."
	B: .asciiz "\nB is "
	GreaterB: .asciiz " times as fast as A."
	zero: .float 0.0
.text
	lwc1 $f4, zero
# First processor
	li $v0, 4 
	la $a0, processor1
	syscall
# Prompt User for Instruction Count
	li $v0, 4 
	la $a0, ICmessage
	syscall
	li $v0, 6 
	syscall
	add.s $f1, $f0, $f4
# Prompt User for CPI (Clock Per Instruction)	
	li $v0, 4 
	la $a0, CPImessage
	syscall
	li $v0, 6 
	syscall
	add.s $f2, $f0, $f4
# Prompt User for Clock Rate (in GHz)	
	li $v0, 4 
	la $a0, CRmessage
	syscall
	li $v0, 6 
	syscall
	add.s $f3, $f0, $f4
# Calculations
	mul.s $f5, $f1, $f2 # IC X CPI
	div.s $f5, $f5, $f3 # (IC X CPI) / Clock Rate
	
# Second processor
	li $v0, 4 
	la $a0, processor2
	syscall
# Prompt User for Instruction Count
	li $v0, 4 
	la $a0, ICmessage
	syscall
	li $v0, 6 
	syscall
	add.s $f6, $f0, $f4
# Prompt User for CPI (Clock Per Instruction)	
	li $v0, 4 
	la $a0, CPImessage
	syscall
	li $v0, 6 
	syscall
	add.s $f7, $f0, $f4
# Prompt User for Clock Rate (in GHz)	
	li $v0, 4 
	la $a0, CRmessage
	syscall
	li $v0, 6 
	syscall
	add.s $f8, $f0, $f4
# Calculations
	mul.s $f9, $f6, $f7 # IC X CPI
	div.s $f9, $f9, $f8 # (IC X CPI) / Clock Rate
# Compare the floats to see which one has a larger CPU time
	c.le.s $f5, $f9
	bc1t L0
	c.le.s $f9, $f5
	bc1t L1
# Ends program
	li $v0, 10
	syscall
# if A has a larger CPU time 
L0:	div.s $f12, $f9, $f5
	li $v0, 4 
	la $a0, A
	syscall
	li $v0, 2
	syscall
	li $v0, 4 
	la $a0, GreaterA
	syscall
	# Ends program
	li $v0, 10
	syscall
# if B has a larger CPU time 
L1:	div.s $f12, $f5, $f9
	li $v0, 4 
	la $a0, B
	syscall
	li $v0, 2
	syscall
	li $v0, 4 
	la $a0, GreaterB
	syscall
	# Ends program
	li $v0, 10
	syscall