.text

main:
    # Chargement d'un entier positif ou négatif
    li $t1, 0x70000000 # Entier négatif
    #li $t1, 0x0A000000 # Entier positif

    # Calcul de la valeur absolue
    # TODO
    bgt $zero, $t1, neg
    
    #end_main
    li $v0, 10
    syscall 
    
neg:
    sub $t1, $zero, $t1

.data
