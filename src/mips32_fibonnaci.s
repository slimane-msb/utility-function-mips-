# 6 premières valeurs de la suite de Fibonnacci (sans boucle)

.text

main:
	la $t0, X
	
	add $t1, $zero, $zero
	sw $t1, 0($t0)
	
	addi $t2, $zero, 1
	sw $t2, 4($t0)

	# Code à compléter (sans boucle) pour les 4 valeurs suivantes
	# TODO
	
	#1=1+0
	add $t1, $t2, $t1 
	sw $t1, 8($t0)
	
	#2=1+1
	add $t2, $t2, $t1  
	sw $t2, 12($t0)
	
	#3=2+1
	add $t1, $t2, $t1 
	sw $t1, 16($t0)
	
	#5=2+3
	add $t2, $t2, $t1 
	sw $t2, 20($t0)
	
	jr $ra

.data
X : .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
