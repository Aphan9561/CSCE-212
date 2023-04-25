.data
	Mymessage: .asciiz "Hello, may I have your name, please?\n"
	userInput: .space 20
	message: .asciiz "Welcome, "
.text
	#Types out the Mymessage
	li $v0, 4
	la $a0, Mymessage
	syscall
	
	# Gets user's name
	li $v0, 8
	la $a0, userInput
	li $a1, 20
	syscall 
	
	#Prints out welcome
	li $v0, 4
	la $a0, message
	syscall
	
	# Prints out user's name
	li $v0,4
	la $a0, userInput
	syscall
