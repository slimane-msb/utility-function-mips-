.text

main:
    # Chargement + écriture
    la $t8, V
    li $t1, 0x1A
    sb $t1, 0($t8)
    li $t1, 0x19
    sb $t1, 1($t8)
    li $t1, 0x18
    sb $t1, 2($t8)
    li $t1, 0x17
    sb $t1, 3($t8)
    li $t1, 0x16
    sb $t1, 4($t8)
    li $t1, 0x15
    sb $t1, 5($t8)
    li $t1, 0x14
    sb $t1, 6($t8)
    li $t1, 0x13
    sb $t1, 7($t8)
    li $t1, 0x12
    sb $t1, 8($t8)
    li $t1, 0x11
    sb $t1, 9($t8)
    # Préparation tri
    # TODO
    move $a0, $t8
    li $a1, 10
    # tri
    # TODO
    jal tri 
    end_tri:
    # Restauration après tri
    # TODO
    #?
    # End
    li $v0, 10
    syscall

tri:
    # construction de trame de pile
    #TODO
    # a0 = add@(v) ; a1 = tailleN
    # s1 = i ; s2 = j 
    # i=n-1
    sub $s1, $a1, 1
    # Préparation de la boucle i
    # TODO
    loopi:
    	# j = i-1
    	sub $s2, $s1, 1
        # Préparation de la boucle j
        # TODO
        loopj:
            # Chargement des éléments V[i], V[j]
            # TODO
            #$s3=add@(vi) 
            move $s3, $a0
            add $s3, $s3, $s1 
            lb $s3, ($s3)
            #$s4=add@(vj)
    	    move $s4, $a0
    	    add $s4, $s4, $s2
    	    lb $s4, ($s4)
            # si (v[j] > v[i]) appeler change 
            # TODO
            
            bgt $s4, $s3, vjGvi
            
            vjGvi:
            	#load para
            	#a0 est toujours addr@(v) , a2= i, a3=j
            	move $a2, $s1
            	move $a3, $s2
            	#appel change
            	jal change
		j end_loopj
        end_loopj:
        
        # Mettre à jour j, tester condition de boucle j
        # TODO
        #--j
        subi $s2, $s2, 1
	#j>=0
	bge $s2, $zero, loopj
	j end_loopi
    end_loopi:
        # Mettre à jour i, tester condition de boucle i
        # TODO
        #--i
	subi $s1, $s1, 1
	#i >0 
	bgt $s1, $zero, loopi
	j tri_return 
        
tri_return:
    # TODO
    j end_tri

change:
    # TODO
    #a0: add@(v) , a2 = i, a3 = j
    #preparation d'adresse a1= add(@vi) a2 = add(@vj) 
    add $a2, $a2, $a0
    add $a3, $a3, $a0	
    #operatoin : v1= temp
    lb $v1, ($a2)
    lb $s5, ($a3)  
    sb $s5, ($a2)
    sb $v1, ($a3)
    jr $ra

.data
V : .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
