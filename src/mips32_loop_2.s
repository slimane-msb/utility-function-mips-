.text

main:
    # Chargement adresse dans $t7 de l'adresse de X
    # TODO
    li $t7, 0x10010000
    
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    add $t8, $t7, 60
    
    # s = 0 ($t2 = 0)
    # TODO
    li $t2, 0
    
    # Boucle
    # $t1 = X[i]
    # TODO$t1
    # TODO
    boucle: 
    	lw $t1, ($t7)
    	# Calcul de l'adresse de X[i] suivante
    	# TODO
    	add $t7, $t7, 4
    	
    	blt $t1, $zero, boucle 
    	add $t2, $t2, $t1
    	
    	
    	# Condition pour boucler
    	# TODO
    	ble $t7, $t8, boucle 
    	
    
    
    
    
    
    # �criture dans s
    # TODO
    sw $t2, ($t7)
    

.data
# X
X :
.word 0x00000001, 0xA0000010, 0x00000100, 0xA0001000
.word 0x00010000, 0xA0100000, 0x01000000, 0xA0000000
.word 0xA0000002, 0x00000020, 0xA0000200, 0x00002000
.word 0xA0020000, 0x00200000, 0xA2000000, 0x20000000
# s
S : .word 0xffffffff
