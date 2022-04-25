.text

main:
    # Chargement de l'adresse de X dans $t7
    # TODO
    li $t7, 0x10010000
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    addi $t8, $t7, 28
    # Initialisation de min et max ($t1 et $t2)
    # TODO #t1=min et t2= max
    lw $t1, ($t7)
    lw $t2, ($t7)
    # Boucle
    # $t3 = X[i]
    # TODO
    boucle: 
  	lw $t3, 4($t7)
    	# min
  	# TODO
 	blt $t3, $t1, mint3
 	# max
 	# TODO
 	bgt $t3, $t2, maxt3
 	cond:
 	# Calcul de l'adresses de X[i] suivante
 	# TODO
  	addi $t7, $t7, 4
	# Condition pour boucler
    	# TODO
    	blt $t7, $t8, boucle
    # Écriture de min et max
    # TODO
    sw $t1, 4($t7)
    sw $t2, 8($t7) 
    
    li $v0, 10
    syscall
    
mint3:
	move $t1, $t3
	j cond 
maxt3:	
	move  $t2, $t3
	j cond

.data
# X
X :
.word 0x00000004, 0x00000003, 0x00000002, 0x00000001
.word 0x00000005, 0x00000006, 0x00000007, 0x00000008
# min
MIN : .word 0x11111111
# max
MAX : .word 0x22222222
