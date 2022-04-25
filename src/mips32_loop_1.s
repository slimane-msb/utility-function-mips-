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
    # s = 0 ($t3 = 0)
    # TODO
    li $t3, 0

    # Boucle
    boucle:
    # $t1 = X[i]
    # TODO
    lw $t1, 0($t6)
    # $t2 = Y[i]
    # TODO
    lw $t2, 0($t7)
    
    # $t3 += $t1 + $t2
    # TODO
    add $t3, $t3, $t2
    add $t3, $t3, $t1
    # Calcul des adresses de X[i] et de Y[i] suivantes
    # TODO
    add $t6, $t6, 4
    add $t7,$t7, 4

    # Condition pour boucler
    ble $t6, $t8, boucle

    sw $t3, 0($t7)
    

    
.data
# X
.word 0x00000001, 0x00000010, 0x00000100, 0x00001000
.word 0x00010000, 0x00100000, 0x01000000, 0x10000000
# Y
.word 0x00000002, 0x00000020, 0x00000200, 0x00002000
.word 0x00020000, 0x00200000, 0x02000000, 0x20000000
# s
.word 0xffffffff
