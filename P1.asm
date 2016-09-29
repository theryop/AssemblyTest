.data
myarrayA: .word 89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73
myarrayB: .word 0:11
myarrayC: .word 0:7
newLine: .asciiz "\n"
newSpace: .asciiz " "
messone: .asciiz "Index of the smallest positive number: "
messtwo: .asciiz "Array B: "
messthree: .asciiz "Array C: "
.text
	main:
	add $s0, $zero, 100 #Min
	add $s1, $zero, 0 #MinIndex
	
	
	#Clear $t0 to 0
	addi $t0, $zero,0 #counters for loops
	addi $t1, $zero,0
	addi $t2, $zero,0
	
	whileA:
		beq $t0, 72, exit #If counter == 72, exit the while loop
		
		lw $t6 myarrayA($t0)#load current array variable 
		
		slt $s2, $t6, $s0 #compare current array variable to current minimum
		sgt $s3, $t6, $zero #compare if current array variable is positive
		beq $s2, $s3, minset #If current array variable is smaller than min but positive, minset
		
		addi $t0, $t0, 4
		
		j whileA
	minset:   #Sets Min to the new minimum if min is positive, and records the index
		move $s0, $t6
		move $t1, $t0
		
	
	exit:
		li $v0, 4
		la $a0, messone
		syscall
		
		li $v0, 4
		move $a0, $t6
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		addi $t0, $zero,0 #clears the first counter
		addi $t6, $zero,0 #clears array variable register
	whileB:
		beq $t0, 72, exitB
		lw $t6 myarrayA($t0)#load current array variable 
		bgt $t6, $zero, gthan
		blt $t6, $zero, lthan
		addi $t0, $t0, 4
		j whileB
		
	lthan:  #sets the next negative arrayA variable into myArrayB
		lw $t7 myarrayB($t1)
		move $t7,$t6
		sw $t7 myarrayB($t1)
		addi $t1, $t1, 4
	gthan:	#sets the next positive arrayA varialbe into myArrayC
		lw $t8 myarrayC($t2)
		move $t8, $t6
		sw $t8 myarrayC($t2)
		addi $t1, $t1, 4
	exitB:
		li $v0, 4
		la $a0, messtwo
		syscall
		addi $t0, $zero,0 #clears the first counter
		addi $t6, $zero,0 #clears array variable register
	whileC:
		beq $t0, 44, exitC
		lw $t6 myarrayB($t0)
		addi $t0, $t0, 4
		
		li $v0, 1
		move $a0, $t6 # prints the current number 
		syscall
		
		li $v0, 4
		la $a0, newSpace
		syscall
		
		j whileC
	exitC:
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, messthree
		syscall
		addi $t0, $zero,0 #clears the first counter
		addi $t6, $zero,0 #clears array variable register
	whileD:
		beq $t0, 28, exitD
		lw $t6 myarrayC($t0)
		addi $t0, $t0, 4
		
		li $v0, 1
		move $a0, $t6 # prints the current number 
		syscall
		
		li $v0, 4
		la $a0, newSpace
		syscall
		
		j whileC
	exitD:
		li $v0, 4
		la $a0, newLine
		syscall
		
		
