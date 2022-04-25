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
    
    
    #test stack: on va mettre des valeur des S4... pour voir si la pile preserve ces regestre et les ecrase pas # reponse oui 
    addi $s4, $s4, 4
    addi $s5, $s5, 5
    addi $s6, $s6, 6
    addi $s7, $s7, 7
                
    # Préparation tri
    # TODO
    move $a0, $t8
    li $a1, 10
    subi $sp, $sp, 16
    sw $s4, 12($sp)
    sw $s5, 8($sp)
    sw $s6, 4($sp)
    sw $s7, 0($sp)
    # tri
    # TODO
    jal tri 
    end_tri:
    #pille back 
    lw $s4, 12($sp)
    lw $s5, 8($sp)
    lw $s6, 4($sp)
    lw $s7, 0($sp)
    addi $sp, $sp, 16
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
    # s4 = i ; s5 = j 
    # i=n-1
    
    sub $s4, $a1, 1
    # Préparation de la boucle i
    # TODO
    loopi:
    	# j = i-1
    	sub $s5, $s4, 1
        # Préparation de la boucle j
        # TODO
        loopj:
            # Chargement des éléments V[i], V[j]
            # TODO
            #$s7=add@(vi) 
            move $s6, $a0
            add $s6, $s6, $s4 
            lb $s6, ($s6)
            #$s4=add@(vj)
    	    move $s7, $a0
    	    add $s7, $s7, $s5
    	    lb $s7, ($s7)
            # si (v[j] > v[i]) appeler change 
            # TODO
            
            bgt $s7, $s3, vjGvi
            
            vjGvi:
            	#load para
            	#a0 est toujours addr@(v) , a2= i, a3=j
            	move $a2, $s4
            	move $a3, $s5
            	#appel change
            	#stack prep 
                subi $sp, $sp, 4
                sw $s5, ($sp)
            	jal change
            	#stack back
                lw $s5, ($sp)
                subi $sp, $sp, 4
		j end_loopj
        end_loopj:
        
        # Mettre à jour j, tester condition de boucle j
        # TODO
        #--j
        subi $s5, $s5, 1
	#j>=0
	bge $s5, $zero, loopj
	j end_loopi
    end_loopi:
        # Mettre à jour i, tester condition de boucle i
        # TODO
        #--i
	subi $s4, $s4, 1
	#i >0 
	bgt $s4, $zero, loopi
	j tri_return 
        
tri_return:
    # TODO
    #stack back
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
