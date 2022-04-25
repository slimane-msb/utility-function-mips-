.text

main:
    # Chargement de l'adresse de X dans $t6
    # TODO
    li $t6, 0x10010000
    # Chargement de l'adresse de Y dans $t7
    # TODO
    add $t7, $t6, 32
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    add $t8, $t6, 28 
    # Boucle
    # $t1 = X[i]
    # $t2 = X[i-1]
    # $t3 = Y[i-1]
    # TODO
    boucle: 
    	lw $t1, 4($t6)
    	lw $t2, ($t6)
    	lw $t3, ($t7)
    # $t3 += $t1 + $t2
    # TODO
    	addu $t3, $t3, $t1
    	addu $t3, $t3, $t2

    # �criture  dans Y[i-1]
    # TODO	
    	sw $t3, ($t7)
    # Calcul des adresses de X[i] et de Y[i] suivantes
    # TODO
    	add $t6, $t6, 4
    	add $t7, $t7, 4
    # Condition pour boucler
    # TODO
    	blt $t6, $t8, boucle

.data
# X
X :
.word 0x00000001, 0x00000002, 0x00000003, 0x00000005
.word 0x00000008, 0x0000000D, 0x00000015, 0x00000022
# Y
Y :
.word 0x10000000, 0x20000000, 0x30000000, 0x40000000
.word 0x50000000, 0x60000000, 0x7fffffff, 0x8fffffff
