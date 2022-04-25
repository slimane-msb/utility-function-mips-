.text

main:
    # Chargement de A et B dans $t1 et $t2
    # TODO
    lb $t1, A
    lb $t2, B
    # max($t1, $t2) dans $t3
    # TODO
    bgt $t1, $t2, maxist1
    move $t3, $t2
    # Écriture de $t3 dans C
    # TODO
    sb $t3, C
    
    #end_main
    li $v0, 10
    syscall
    
    
    
   
    
maxist1:
	move $t3, $t1
	#save t3 dans C
	sb $t3, C
	
	

.data
A : .ascii "2"
B : .ascii "9"

#.data
#A : .ascii "9"
#B : .ascii "2"

C : .ascii "0"
