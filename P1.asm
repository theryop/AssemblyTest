.data
myarrayA: .word 89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73
myarrayB: .word 0:11
myarrayC: .word 0:7
newLine: .asciiz "\n"
.text
	main:
	add $s0, $zero, 100 #Min
	add $s1, $zero, 0 #MinIndex
	
	
	#Clear $t0 to 0
	addi $t0, $zero,0 #counters for loops
	addi $t1, $zero,0
	
	while:
		beq $t0 72, exit #If counter == 72, exit the while loop
		
		lw $t6 myarrayA($t0)#load current array variable 
		
		slt $s2, $t6, $s0 # compare current array variable to current minimum
		
		beq $s2, $zero, minset # If current array variable is smaller, minset
		
		blt $t6, $zero, lthan
		
		bgt $t6, $zero, gthan
		
		addi $t0, $t0, 1
		
		j while
	minset:  
		move $s0, $t6
		move $t1, $t0
		
	lthan:
		
	gthan:	
	
	exit:
	
