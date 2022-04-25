.text

main:
    # Chargement + écriture de A et B
    li $t1, 12
    sw $t1, A
    li $t2, 9
    sw $t2, B
    # Préparation appel fonction
    # TODO
    #stack prep
    # je commence par decaler le pointeur de pile , et je laisse 8(#sp) pour le resultat 
    sub $sp, $sp, 16
    sw $ra, 12($sp)
    sw $t1,4($sp)
    sw $t2, 0($sp)
    #appel fonction
    jal fmax
    lw $t3, 8($sp)
    sw $t3, C
    #stack back
    lw $ra, 12($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)
    add $sp, $sp, 16
    

    #end program
    li $v0, 10
    syscall

fmax:
    # TODO
    #prep stack : dans ce cas la on a pas besoin de plus de registre que les arguments, donc on va pas reserver de la memoire dans la stack 
    bgt $t1, $t2, t1GrandQuet2
    #t2 est plus grand que t1
    sw $t2, 8($sp)
    jr $ra
    
t1GrandQuet2:
    sw $t1, 8($sp)
    jr $ra


.data
A : .word 0x11111111
B : .word 0x22222222
C : .word 0x33333333
2