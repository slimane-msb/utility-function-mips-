.text

main:
    # Chargement + écriture de A et B
    li $t1, 12
    sw $t1, A
    li $t2, 9
    sw $t2, B
    # Préparation appel fonction
    # TODO
    #prepation des args:
    move $a1, $t1
    move $a2, $t2
    #appel fmax
    # fmax
    # TODO
    jal fmax
    # Restauration après appel fonction
    # TODO
    # Écrire le résultat dans C
    # TODO
    sw $v1, C
    
    
    #end program
    li $v0, 10
    syscall

fmax:
    # TODO
    bgt $a1, $a2, t1GrandQuet2
    #t2 est plus grand que t1
    move $v1, $a2
    jr $ra
    
t1GrandQuet2:
    move $v1, $a1
    jr $ra


.data
A : .word 0x11111111
B : .word 0x22222222
C : .word 0x33333333
