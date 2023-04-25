.data
	startMessage: .asciiz "Loop start\n"
	endMessage: .asciiz  "Loop ends\n"
	array: .space 40 #4x10
	
.text
	li $v0, 4
	la $a0, startMessage
	syscall
	
	li $s0, 10  #i = 10
	li $t0, 48  # offset
	
loop:	ble $s0, 0, exit
	addi $t1, $s0, 2 #i-2
	sb $t1, array($t0) #array[i] = i-2
	subi $s0, $s0, 2 #i -= 2
	subi $t0, $t0, 8
	j loop
	
exit:	li $v0, 4
	la $a0, endMessage
	syscall	
