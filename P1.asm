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
		addi $t0, $t0, 4
		beq $s2, $s3, minset #If current array variable is smaller than min but positive, minset
		
		j whileA
	minset:   #Sets Min to the new minimum if min is positive, and records the index
		move $s0, $t6
		move $s1, $t0
		j whileA
	
	exit:
		li $v0, 4
		la $a0, messone
		syscall
		
		div $s1,$s1,4
		#sub $t1, $t1, 1
		li $v0, 1
		move $a0, $s1
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		addi $t0, $zero,0 #clears the first counter
		addi $t6, $zero,0 #clears array variable register
	whileB:
		beq $t0, 72, exitB
		lw $t6 myarrayA($t0)#load current array variable 
		addi $t0, $t0, 4
		bgez $t6, gthan #If current array variable is greater than zero, gthan
		addi $t3, $zero,0 
		addi $t4, $zero,0 
		la $t3 myarrayC
		add $t4 $t3, $t2
		sw $t6 0($t4)
		addi $t2,$t2,1
		j whileB
	gthan:
		addi $t3, $zero,0 
		addi $t4, $zero,0 
		la $t3 myarrayB
		add $t4, $t3, $t1
		sw $s6 0($t4)
		addi $t1, $t1, 1
		j whileB
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
		
		j whileD
	exitD:
		li $v0, 4
		la $a0, newLine
		syscall
