.data
myarrayA: .word 89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73
myarrayB: .word 0:11
myarrayC: .word 0:7
newLine: .asciiz "\n"
messone: .asciiz "Index of the smallest value "
.text
	main:
	add $s0, $zero, 100 #Min
	add $s1, $zero, 0 #MinIndex
	
	
	#Clear $t0 to 0
	addi $t0, $zero,0 #counters for loops
	addi $t1, $zero,0
	addi $t2, $zero,0
	
	while:
		beq $t0 72, exit #If counter == 72, exit the while loop
		
		lw $t6 myarrayA($t0)#load current array variable 
		
		slt $s2, $t6, $s0 # compare current array variable to current minimum
		
		beq $s2, $zero, minset # If current array variable is smaller, minset
		
		blt $t6, $zero, lthan # if current array variable is negative, lthan
		
		bgt $t6, $zero, gthan # if current arraty variable is positive, gthan
		
		addi $t0, $t0, 4
		
		j while
	minset:   #Sets Min to the new minimum, and records the index
		move $s0, $t6
		move $t1, $t0
		
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
	
	exit:
		li $v0, 4
		la $a0, messone
		syscall
		
		li $v0, 4
		la $a0, $t1
		syscall
