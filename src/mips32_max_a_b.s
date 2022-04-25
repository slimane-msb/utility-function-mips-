.text

main:
    # Calcul de l'adresse m�moire de A dans $t7
    li $t7, 0x10010000

    # TODO
    # Chargement de A et B dans $t1 et $t2
    lb $t1, 32($t7)
    lb $t2, 33($t7)
    # max($t1, $t2) dans $t3
    # TODO
    bgt $t1, $t2, maxist1
    move $t3, $t2
    # �criture de $t3 dans C
    # TODO
    sb $t3, 34($t7)
    
    #end_main
    li $v0, 10
    syscall
    
    
maxist1:
	move $t3, $t1
	#save t3 dans C
	sb $t3, 34($t7)
	

.data
.word 0x00001111, 0x22223333, 0x44445555, 0x66667777
.word 0x88889999, 0xAAAABBBB, 0xCCCCDDDD, 0xEEEEFFFF
# A
.ascii "2"
# B
.ascii "9"
# C
.ascii "0"

#.data
#.word 0x00001111, 0x22223333, 0x44445555, 0x66667777
#.word 0x88889999, 0xAAAABBBB, 0xCCCCDDDD, 0xEEEEFFFF
# A
#.ascii "2"
# B
#.ascii "9"
# C
#.ascii "0"
