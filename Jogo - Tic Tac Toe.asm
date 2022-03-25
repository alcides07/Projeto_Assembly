.text

# $9  -> Lacuna 1 Preenchida ou não
# $10 -> Lacuna 2 Preenchida ou não
# $11 -> Lacuna 3 Preenchida ou não
# $12 -> Lacuna 4 Preenchida ou não
# $13 -> Lacuna 5 Preenchida ou não
# $14 -> Lacuna 6 Preenchida ou não
# $15 -> Lacuna 7 Preenchida ou não
# $16 -> Lacuna 8 Preenchida ou não
# $21 -> Lacuna 9 Preenchida ou não

# $2 -> Inverter lado de pintar o X
# $3 -> Quantidade de unidades gráficas para pintar uma linha do X
# $4 -> Salto para a próxima memória de se pintar a outra parte do X
# $6  -> Quantidade de vezes que desenha o X
# $8  -> Trabalhando com a memória
# $17 -> Valor que verifica se algo foi digitado
# $18 -> Valor do que foi digitado
# $19 -> Memória que verifica se algo digitou
# $20 -> Onde guardei o que foi digitado por último
# $22 -> Atraso para repintar as barras
# $24 -> Trabalhando com Cores
# $25 -> Variável para controlar os laços

#-------------------------------------- Cenário ----------------------------------

main:
addi $22, $0, 100000
lui $8, 0x1001 #Início da memória em $8
addi $24, $0, 0x2E0015 #Cor roxa
addi $25, $0, 8192 #Total de vezes a pintar o cenário

#Memória dos locais de interação
lui $19, 0xffff

Pintando_Cenario:
beq $25, $0, transicao_para_barrav1 #Barra Vertical 1
sw $24, 0($8)
addi $25, $25, -1
addi $8, $8, 4
j Pintando_Cenario

#--------------------------------- Barras Verticais -----------------------------

transicao_para_barrav1:
addi $24, $0, 0xFFFFFF #Cor branca para as barras

atraso_pintar:
lw $17, 0($19) #Captou o valor que vai saber se algo foi digitado
beq $17, $0, nao_dig_continua_atraso
lw $18, 4($19) #Captou o que foi digitado

beq $18, 'X', armazeno_X
beq $18, 'O', armazeno_O
j tecla_de_numero

armazeno_X:
lw $20, 4($19) #Guardo A LETRA que foi digitada em $20
j nao_dig_continua_atraso

armazeno_O:
lw $20, 4($19) #Guardo A LETRA que foi digitada em $20
j nao_dig_continua_atraso

tecla_de_numero: #Vou desenhar algo em algum lugar
beq $20, 'X', desenho_X #Sei que vou desenhar um X
beq $20, 'O', desenho_O #Sei que vou desenhar um O
j nao_dig_continua_atraso

desenho_X:
addi $3, $0, 13
beq $18, '0', desenho_X_pos_0 #Vou desenhar o X na posição 0
beq $18, '1', desenho_X_pos_1 #Vou desenhar o X na posição 1
beq $18, '2', desenho_X_pos_2 #Vou desenhar o X na posição 2
beq $18, '3', desenho_X_pos_3 #Vou desenhar o X na posição 3
beq $18, '4', desenho_X_pos_4 #Vou desenhar o X na posição 4
beq $18, '5', desenho_X_pos_5 #Vou desenhar o X na posição 5
beq $18, '6', desenho_X_pos_6 #Vou desenhar o X na posição 6
beq $18, '7', desenho_X_pos_7 #Vou desenhar o X na posição 7
beq $18, '8', desenho_X_pos_8 #Vou desenhar o X na posição 8
j nao_dig_continua_atraso

desenho_X_pos_0:
beq $9, $0, continua_x_1
j nao_dig_continua_atraso

continua_x_1:
addi $5, $0, 1
addi $9, $9, 1

addi $4, $0, 9400
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 9352 #Início de desenhar X na posição 0
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_1:
beq $10, $0, continua_x_2
j nao_dig_continua_atraso

continua_x_2:
addi $7, $0, 1
addi $10, $10, 1

addi $4, $0, 9496
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 9448 #Início de desenhar X na posição 1
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_2:
beq $11, $0, continua_x_3
j nao_dig_continua_atraso

continua_x_3:
addi $23, $0, 1
addi $11, $11, 1

addi $4, $0, 9592
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 9544 #Início de desenhar X na posição 2
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_3:
beq $12, $0, continua_x_4
j nao_dig_continua_atraso

continua_x_4:
addi $26, $0, 1
addi $12, $12, 1

addi $4, $0, 19640
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 19592 #Início de desenhar X na posição 3
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_4:
beq $13, $0, continua_x_5
j nao_dig_continua_atraso

continua_x_5:
addi $27, $0, 1
addi $13, $13, 1

addi $4, $0, 19736
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 19688 #Início de desenhar X na posição 4
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_5:
beq $14, $0, continua_x_6
j nao_dig_continua_atraso

continua_x_6:
addi $28, $0, 1
addi $14, $14, 1

addi $4, $0, 19832
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 19784 #Início de desenhar X na posição 5
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_6:
beq $15, $0, continua_x_7
j nao_dig_continua_atraso

continua_x_7:
addi $29, $0, 1
addi $15, $15, 1

addi $4, $0, 29880
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 29832 #Início de desenhar X na posição 6
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_7:
beq $16, $0, continua_x_8
j nao_dig_continua_atraso

continua_x_8:
addi $30, $0, 1
addi $16, $16, 1

addi $4, $0, 29976
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 29928 #Início de desenhar X na posição 7
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenho_X_pos_8:
beq $21, $0, continua_x_9
j nao_dig_continua_atraso

continua_x_9:
addi $31, $0, 1
addi $21, $21, 1

addi $4, $0, 30072
addi $2, $0, -508
addi $24, $0, 0xFFFFFF #Cor branca para o X
lui $8, 0x1001
addi $8, $8, 30024 #Início de desenhar X na posição 8
addi $6, $0, 28 #O X terá tantas unidades
j desenhando_X

desenhando_X:
beq $6, $0, nao_dig_continua_atraso #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_X #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_X

outra_metade_X:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_X

desenho_O:
addi $3, $0, 5
beq $18, '0', desenho_O_pos_0 #Vou desenhar O na posição 0
beq $18, '1', desenho_O_pos_1 #Vou desenhar O na posição 1
beq $18, '2', desenho_O_pos_2 #Vou desenhar O na posição 2
beq $18, '3', desenho_O_pos_3 #Vou desenhar O na posição 3
beq $18, '4', desenho_O_pos_4 #Vou desenhar O na posição 4
beq $18, '5', desenho_O_pos_5 #Vou desenhar O na posição 5
beq $18, '6', desenho_O_pos_6 #Vou desenhar O na posição 6
beq $18, '7', desenho_O_pos_7 #Vou desenhar O na posição 7
beq $18, '8', desenho_O_pos_8 #Vou desenhar O na posição 8
j nao_dig_continua_atraso

desenho_O_pos_0:
beq $9, $0, continua_o_1
j nao_dig_continua_atraso

continua_o_1:
addi $5, $0, 10
addi $9, $9, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 6788 #Início de desenhar O na posição 0
j desenhando_O

desenho_O_pos_1:
beq $10, $0, continua_o_2
j nao_dig_continua_atraso

continua_o_2:
addi $7, $0, 10
addi $10, $10, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 6884 #Início de desenhar O na posição 1
j desenhando_O

desenho_O_pos_2:
beq $11, $0, continua_o_3
j nao_dig_continua_atraso

continua_o_3:
addi $23, $0, 10
addi $11, $11, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 6980 #Início de desenhar O na posição 2
j desenhando_O

desenho_O_pos_3:
beq $12, $0, continua_o_4
j nao_dig_continua_atraso

continua_o_4:
addi $26, $0, 10
addi $12, $12, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 17540 #Início de desenhar O na posição 3
j desenhando_O

desenho_O_pos_4:
beq $13, $0, continua_o_5
j nao_dig_continua_atraso

continua_o_5:
addi $27, $0, 10
addi $13, $13, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 17636 #Início de desenhar O na posição 4
j desenhando_O

desenho_O_pos_5:
beq $14, $0, continua_o_6
j nao_dig_continua_atraso

continua_o_6:
addi $28, $0, 10
addi $14, $14, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 17732 #Início de desenhar O na posição 5
j desenhando_O

desenho_O_pos_6:
beq $15, $0, continua_o_7
j nao_dig_continua_atraso

continua_o_7:
addi $29, $0, 10
addi $15, $15, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 28292 #Início de desenhar O na posição 6
j desenhando_O

desenho_O_pos_7:
beq $16, $0, continua_o_8
j nao_dig_continua_atraso

continua_o_8:
addi $30, $0, 10
addi $16, $16, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 28388 #Início de desenhar O na posição 7
j desenhando_O

desenho_O_pos_8:
beq $21, $0, continua_o_9
j nao_dig_continua_atraso

continua_o_9:
addi $31, $0, 10
addi $21, $21, 1

addi $2, $0, -512
addi $24, $0, 0xFFFFFF #Cor branca para O
lui $8, 0x1001
addi $8, $8, 28484 #Início de desenhar O na posição 8
j desenhando_O

desenhando_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_O

transicao_O_1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metade1_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade1_O

transicao_O_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metade2_O:
sw $24, 0($8)
add $8, $8, $2
j transicao_O_3

transicao_O_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metade3_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade3_O

transicao_O_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metade4_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade4_O

transicao_O_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metade5_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade5_O

transicao_O_6:
add $2, $0, 512

outra_metade6_O:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_O_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metade7_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade7_O

transicao_O_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metade8_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade8_O

transicao_O_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metade9_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade9_O

transicao_O_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metade10_O:
sw $24, 0($8)
add $8, $8, $2

transicao_O_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metade11_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade11_O

transicao_O_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metade12_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade12_O

transicao_O_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metade13_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_O_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metade13_O

transicao_O_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metade14_O:
sw $24, 0($8)
add $8, $8, $2

transicao_O_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metade15_O:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, nao_dig_continua_atraso 
j outra_metade15_O

# --------------------------------- VENCENDO COM O 'X' --------------------------
nao_dig_continua_atraso:
# Vencendo com o X pela linha 1
beq $5, 1, primeira_linha_X2
j segunda_linha_X1
  
primeira_linha_X2:
beq $7, 1, primeira_linha_X3 
j segunda_linha_X1

primeira_linha_X3:
beq $23, 1, pinta_linha1_X_1 # X VENCEU PELA LINHA 1
j segunda_linha_X1

# Vencendo com o X pela linha 2
segunda_linha_X1:
beq $26, 1, segunda_linha_X2
j terceira_linha_X1

segunda_linha_X2:
beq $27, 1, segunda_linha_X3
j terceira_linha_X1

segunda_linha_X3:
beq $28, 1, pinta_linha2_X_1 # X VENCEU PELA LINHA 2
j terceira_linha_X1

# Vencendo com o X pela linha 3
terceira_linha_X1:
beq $29, 1, terceira_linha_X2
j primeira_coluna_X1

terceira_linha_X2:
beq $30, 1, terceira_linha_X3
j primeira_coluna_X1

terceira_linha_X3:
beq $31, 1, pinta_linha3_X_1 # X VENCEU PELA LINHA 3
j primeira_coluna_X1

# Vencendo com o X pela coluna 1
primeira_coluna_X1:
beq $5, 1, primeira_coluna_X2
j segunda_coluna_X1

primeira_coluna_X2:
beq $26, 1, primeira_coluna_X3
j segunda_coluna_X1

primeira_coluna_X3:
beq $29, 1, pinta_coluna1_X_1 # X VENCEU PELA COLUNA 1
j segunda_coluna_X1

# Vencendo com o X pela coluna 2
segunda_coluna_X1:
beq $7, 1, segunda_coluna_X2
j terceira_coluna_X1

segunda_coluna_X2:
beq $27, 1, segunda_coluna_X3
j terceira_coluna_X1

segunda_coluna_X3:
beq $30, 1, pinta_coluna2_X_1 # X VENCEU PELA COLUNA 2
j terceira_coluna_X1

# Vencendo com o X pela coluna 3
terceira_coluna_X1:
beq $23, 1, terceira_coluna_X2
j primeira_diagonal_X1

terceira_coluna_X2:
beq $28, 1, terceira_coluna_X3
j primeira_diagonal_X1

terceira_coluna_X3:
beq $31, 1, pinta_coluna3_X_1 # X VENCEU PELA COLUNA 3
j primeira_diagonal_X1
 
 # Vencendo com o X pela diagonal 1 
primeira_diagonal_X1: 
beq $5, 1, primeira_diagonal_X2
j segunda_diagonal_X1

primeira_diagonal_X2:
beq $27, 1, primeira_diagonal_X3
j segunda_diagonal_X1

primeira_diagonal_X3:
beq $31, 1, pinta_diagonal1_X_1 # X VENCEU PELA DIAGONAL 1
j segunda_diagonal_X1 

segunda_diagonal_X1:
beq $23, 1, segunda_diagonal_X2
j analisando_vitoria_O

segunda_diagonal_X2:
beq $27, 1, segunda_diagonal_X3
j analisando_vitoria_O

segunda_diagonal_X3:
beq $29, 1, pinta_diagonal2_X_1 # X VENCEU PELA DIAGONAL 2
j analisando_vitoria_O

# --------------------------------- VENCENDO COM O 'O' --------------------------
# Vencendo com o O pela linha 1
analisando_vitoria_O:
beq $5, 10, primeira_linha_O2
j segunda_linha_O1
  
primeira_linha_O2:
beq $7, 10, primeira_linha_O3 
j segunda_linha_O1

primeira_linha_O3:
beq $23, 10, pinta_linha1_O_1 # O VENCEU PELA LINHA 1
j segunda_linha_O1

# Vencendo com o O pela linha 2
segunda_linha_O1:
beq $26, 10, segunda_linha_O2
j terceira_linha_O1

segunda_linha_O2:
beq $27, 10, segunda_linha_O3
j terceira_linha_O1

segunda_linha_O3:
beq $28, 10, pinta_linha2_O_1 # O VENCEU PELA LINHA 2
j terceira_linha_O1

# Vencendo com o O pela linha 3
terceira_linha_O1:
beq $29, 10, terceira_linha_O2
j primeira_coluna_O1

terceira_linha_O2:
beq $30, 10, terceira_linha_O3
j primeira_coluna_O1

terceira_linha_O3:
beq $31, 10, pinta_linha3_O_1 # O VENCEU PELA LINHA 3
j primeira_coluna_O1

# Vencendo com o O pela coluna 1
primeira_coluna_O1:
beq $5, 10, primeira_coluna_O2
j segunda_coluna_O1

primeira_coluna_O2:
beq $26, 10, primeira_coluna_O3
j segunda_coluna_O1

primeira_coluna_O3:
beq $29, 10, pinta_coluna1_O_1 # O VENCEU PELA COLUNA 1
j segunda_coluna_O1

# Vencendo com o O pela coluna 2
segunda_coluna_O1:
beq $7, 10, segunda_coluna_O2
j terceira_coluna_O1

segunda_coluna_O2:
beq $27, 10, segunda_coluna_O3
j terceira_coluna_O1

segunda_coluna_O3:
beq $30, 10, pinta_coluna2_O_1 # O VENCEU PELA COLUNA 2
j terceira_coluna_O1

# Vencendo com o O pela coluna 3
terceira_coluna_O1:
beq $23, 10, terceira_coluna_O2
j primeira_diagonal_O1

terceira_coluna_O2:
beq $28, 10, terceira_coluna_O3
j primeira_diagonal_O1

terceira_coluna_O3:
beq $31, 10, pinta_coluna3_O_1 # O VENCEU PELA COLUNA 3
j primeira_diagonal_O1
 
# Vencendo com o O pela diagonal 1 
primeira_diagonal_O1: 
beq $5, 10, primeira_diagonal_O2
j segunda_diagonal_O1

primeira_diagonal_O2:
beq $27, 10, primeira_diagonal_O3
j segunda_diagonal_O1

primeira_diagonal_O3:
beq $31, 10, pinta_diagonal1_O_1 # O VENCEU PELA DIAGONAL 1
j segunda_diagonal_O1 

# Vencendo com o O pela diagonal 2
segunda_diagonal_O1:
beq $23, 10, segunda_diagonal_O2
j verifica_fim_1

segunda_diagonal_O2:
beq $27, 10, segunda_diagonal_O3
j verifica_fim_1

segunda_diagonal_O3:
beq $29, 10, pinta_diagonal2_O_1 # O VENCEU PELA DIAGONAL 2
j verifica_fim_1

# --------------------------------- FECHA ---------------------------------------

verifica_fim_1: 
beq $9, 1, verifica_fim_2
j cont_pint

verifica_fim_2: 
beq $10, 1, verifica_fim_3
j cont_pint

verifica_fim_3: 
beq $11, 1, verifica_fim_4
j cont_pint

verifica_fim_4: 
beq $12, 1, verifica_fim_5
j cont_pint

verifica_fim_5: 
beq $13, 1, verifica_fim_6
j cont_pint

verifica_fim_6: 
beq $14, 1, verifica_fim_7
j cont_pint

verifica_fim_7: 
beq $15, 1, verifica_fim_8
j cont_pint

verifica_fim_8: 
beq $16, 1, verifica_fim_9
j cont_pint

verifica_fim_9: 
beq $21, 1, fim_jogo

cont_pint:
beq $22, $0, continua_pintando
addi $22, $22, -1
j atraso_pintar

continua_pintando:
lui $8, 0x1001
addi $8, $8, 2252 #Início da primeira barra vertical
addi $25, $0, 56 #Total de vezes a desenhar a barra vertical

desenhando_barrav1:
beq $25, $0, transicao_para_barrav2 #Barra Vertical 2
sw $24, 0($8)
addi $8, $8, 512
addi $25, $25, -1
j desenhando_barrav1

transicao_para_barrav2:
lui $8, 0x1001
addi $8, $8, 2352 #Início da segunda barra vertical
addi $25, $0, 56 #Total de vezes a desenhar a barra vertical

desenhando_barrav2:
beq $25, $0, transicao_barrah1 
sw $24, 0($8)
addi $8, $8, 512
addi $25, $25, -1
j desenhando_barrav2

#--------------------------------- Barras Horizontais ----------------------------

transicao_barrah1: #Barra Horizontal 1
lui $8, 0x1001
addi $8, $8, 10872 #Início da primeira barra horizontal
addi $25, $0, 69 #Total de vezes a desenhar a barra (Qtd de quadrados)

desenhando_barrah1: #Barra Horizontal 1
beq $25, $0, transicao_barrah2 
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_barrah1

transicao_barrah2:
lui $8, 0x1001
addi $8, $8, 21624 #Início da segunda barra horizontal
addi $25, $0, 69 #Total de vezes a desenhar a barra (Qtd de quadrados)

desenhando_barrah2: #Barra Horizontal 2
beq $25, $0, alterando_cor_barras
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_barrah2

#------------------------------- Alterando cor das barras ------------------------
alterando_cor_barras:
addi $24, $24, -100000
addi $22, $0, 20000 #OU 200000 (Mais lento)
j atraso_pintar

# ---------------------------- PINTANDO LINHA 1 --------------------------------
pinta_linha1_X_1:
addi $5, $0, 1
addi $3, $0, 13
addi $9, $9, 1
addi $4, $0, 9400
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9352 #Início de desenhar X na posição 0
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L1_X1:
beq $6, $0, pinta_linha1_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L1_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_L1_X1

outra_metade_L1_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L1_X1

pinta_linha1_X_2:
addi $3, $0, 13
addi $7, $0, 1
addi $10, $10, 1
addi $4, $0, 9496
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9448 #Início de desenhar X na posição 1
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L1_X2:
beq $6, $0, pinta_linha1_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L1_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_L1_X2

outra_metade_L1_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L1_X2

pinta_linha1_X_3:
addi $23, $0, 1
addi $11, $11, 1
addi $3, $0, 13
addi $4, $0, 9592
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9544 #Início de desenhar X na posição 2
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L1_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L1_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_L1_X3

outra_metade_L1_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L1_X3

pinta_linha2_X_1:
addi $26, $0, 1
addi $12, $12, 1
addi $3, $0, 13
addi $4, $0, 19640
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19592 #Início de desenhar X na posição 3
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L2_X1:
beq $6, $0, pinta_linha2_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L2_X1
j desenhando_L2_X1

outra_metade_L2_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L2_X1

pinta_linha2_X_2:
addi $27, $0, 1
addi $13, $13, 1
addi $3, $0, 13
addi $4, $0, 19736
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19688 #Início de desenhar X na posição 4
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L2_X2:
beq $6, $0, pinta_linha2_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L2_X2
j desenhando_L2_X2

outra_metade_L2_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L2_X2

pinta_linha2_X_3:
addi $28, $0, 1
addi $14, $14, 1
addi $3, $0, 13
addi $4, $0, 19832
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19784 #Início de desenhar X na posição 5
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L2_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L2_X3
j desenhando_L2_X3

outra_metade_L2_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L2_X3

pinta_linha3_X_1:
addi $29, $0, 1
addi $15, $15, 1
addi $3, $0, 13
addi $4, $0, 29880
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 29832 #Início de desenhar X na posição 6
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L3_X1:
beq $6, $0, pinta_linha3_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L3_X1
j desenhando_L3_X1

outra_metade_L3_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L3_X1

pinta_linha3_X_2:
addi $30, $0, 1
addi $16, $16, 1
addi $3, $0, 13
addi $4, $0, 29976
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 29928 #Início de desenhar X na posição 7
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L3_X2:
beq $6, $0, pinta_linha3_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L3_X2
j desenhando_L3_X2

outra_metade_L3_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L3_X2

pinta_linha3_X_3:
addi $31, $0, 1
addi $21, $21, 1
addi $3, $0, 13
addi $4, $0, 30072
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 30024 #Início de desenhar X na posição 8
addi $6, $0, 28 #O X terá tantas unidades

desenhando_L3_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_L3_X3
j desenhando_L3_X3

outra_metade_L3_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_L3_X3

pinta_coluna1_X_1:
addi $5, $0, 1
addi $3, $0, 13
addi $9, $9, 1
addi $4, $0, 9400
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9352 #Início de desenhar X na posição 0
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C1_X1:
beq $6, $0, pinta_coluna1_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C1_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C1_X1

outra_metade_C1_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C1_X1

pinta_coluna1_X_2:
addi $26, $0, 1
addi $12, $12, 1
addi $3, $0, 13
addi $4, $0, 19640
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19592 #Início de desenhar X na posição 3
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C1_X2:
beq $6, $0, pinta_coluna1_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C1_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C1_X2

outra_metade_C1_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C1_X2

pinta_coluna1_X_3:
addi $29, $0, 1
addi $15, $15, 1
addi $3, $0, 13
addi $4, $0, 29880
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 29832 #Início de desenhar X na posição 6
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C1_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C1_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C1_X3

outra_metade_C1_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C1_X3

pinta_coluna2_X_1:
addi $3, $0, 13
addi $7, $0, 1
addi $10, $10, 1
addi $4, $0, 9496
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9448 #Início de desenhar X na posição 1
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C2_X1:
beq $6, $0, pinta_coluna2_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C2_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C2_X1

outra_metade_C2_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C2_X1

pinta_coluna2_X_2:
addi $27, $0, 1
addi $13, $13, 1
addi $3, $0, 13
addi $4, $0, 19736
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19688 #Início de desenhar X na posição 4
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C2_X2:
beq $6, $0, pinta_coluna2_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C2_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C2_X2

outra_metade_C2_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C2_X2

pinta_coluna2_X_3:
addi $30, $0, 1
addi $16, $16, 1
addi $3, $0, 13
addi $4, $0, 29976
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 29928 #Início de desenhar X na posição 7
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C2_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C2_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C2_X3

outra_metade_C2_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C2_X3

pinta_coluna3_X_1:
addi $23, $0, 1
addi $11, $11, 1
addi $3, $0, 13
addi $4, $0, 9592
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9544 #Início de desenhar X na posição 2
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C3_X1:
beq $6, $0, pinta_coluna3_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C3_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C3_X1

outra_metade_C3_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C3_X1

pinta_coluna3_X_2:
addi $28, $0, 1
addi $14, $14, 1
addi $3, $0, 13
addi $4, $0, 19832
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19784 #Início de desenhar X na posição 5
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C3_X2:
beq $6, $0, pinta_coluna3_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C3_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C3_X2

outra_metade_C3_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C3_X2

pinta_coluna3_X_3:
addi $31, $0, 1
addi $21, $21, 1
addi $3, $0, 13
addi $4, $0, 30072
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 30024 #Início de desenhar X na posição 8
addi $6, $0, 28 #O X terá tantas unidades

desenhando_C3_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_C3_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_C3_X3

outra_metade_C3_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_C3_X3

pinta_diagonal1_X_1:
addi $5, $0, 1
addi $3, $0, 13
addi $9, $9, 1
addi $4, $0, 9400
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9352 #Início de desenhar X na posição 0
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D1_X1:
beq $6, $0, pinta_diagonal1_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D1_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D1_X1

outra_metade_D1_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D1_X1

pinta_diagonal1_X_2:
addi $27, $0, 1
addi $13, $13, 1
addi $3, $0, 13
addi $4, $0, 19736
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19688 #Início de desenhar X na posição 4
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D1_X2:
beq $6, $0, pinta_diagonal1_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D1_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D1_X2

outra_metade_D1_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D1_X2

pinta_diagonal1_X_3:
addi $31, $0, 1
addi $21, $21, 1
addi $3, $0, 13
addi $4, $0, 30072
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 30024 #Início de desenhar X na posição 8
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D1_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D1_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D1_X3

outra_metade_D1_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D1_X3

pinta_diagonal2_X_1:
addi $23, $0, 1
addi $11, $11, 1
addi $3, $0, 13
addi $4, $0, 9592
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 9544 #Início de desenhar X na posição 2
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D2_X1:
beq $6, $0, pinta_diagonal2_X_2 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D2_X1 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D2_X1

outra_metade_D2_X1:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D2_X1

pinta_diagonal2_X_2:
addi $27, $0, 1
addi $13, $13, 1
addi $3, $0, 13
addi $4, $0, 19736
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 19688 #Início de desenhar X na posição 4
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D2_X2:
beq $6, $0, pinta_diagonal2_X_3 #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D2_X2 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D2_X2

outra_metade_D2_X2:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D2_X2

pinta_diagonal2_X_3:
addi $29, $0, 1
addi $15, $15, 1
addi $3, $0, 13
addi $4, $0, 29880
addi $2, $0, -508
addi $24, $0, 0xfbec5d #Cor amarela para o X
lui $8, 0x1001
addi $8, $8, 29832 #Início de desenhar X na posição 6
addi $6, $0, 28 #O X terá tantas unidades

desenhando_D2_X3:
beq $6, $0, fim_jogo #Acabou de pintar o X
sw $24, 0($8)
add $8, $8, $2
addi $6, $6, -1
addi $3, $3, -1 
beq $3, $0, outra_metade_D2_X3 #Terminei a primeira parte do X, vou pra outra metade.
j desenhando_D2_X3

outra_metade_D2_X3:
addi $2, $0, -516
addi $3, $0, 13
lui $8, 0x1001
add $8, $8, $4 #Início de desenhar X em uma posição qualquer
j desenhando_D2_X3

pinta_linha1_O_1:
addi $3, $0, 5
addi $5, $0, 10
addi $9, $9, 1
addi $2, $0, -512
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
lui $8, 0x1001
addi $8, $8, 6788 #Início de desenhar O na posição 0

desenhando_L1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L1_O1

transicao_L1_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1

transicao_L1_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_3

transicao_L1_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_4

transicao_L1_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_5

transicao_L1_O1_6:
add $2, $0, 512

outra_metadeL1_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L1_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL1_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_7

transicao_L1_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_8

transicao_L1_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_9

transicao_L1_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_11

transicao_L1_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_12

transicao_L1_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O1_13

transicao_L1_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha1_O_2
j outra_metadeL1_O1_15

pinta_linha1_O_2:
addi $7, $0, 10
addi $10, $10, 1
addi $2, $0, -512
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
lui $8, 0x1001
addi $8, $8, 6884 #Início de desenhar O na posição 1

desenhando_L1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L1_O2

transicao_L1_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2

transicao_L1_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_3

transicao_L1_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_4

transicao_L1_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_5

transicao_L1_O2_6:
add $2, $0, 512

outra_metadeL1_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L1_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL1_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_7

transicao_L1_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_8

transicao_L1_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_9

transicao_L1_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_11

transicao_L1_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_12

transicao_L1_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O2_13

transicao_L1_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha1_O_3
j outra_metadeL1_O2_15

pinta_linha1_O_3:
addi $23, $0, 10
addi $11, $11, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 6980 #Início de desenhar O na posição 2

desenhando_L1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L1_O3

transicao_L1_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3

transicao_L1_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_3

transicao_L1_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_4

transicao_L1_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_5

transicao_L1_O3_6:
add $2, $0, 512

outra_metadeL1_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L1_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL1_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_7

transicao_L1_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_8

transicao_L1_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_9

transicao_L1_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL1_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_11

transicao_L1_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_12

transicao_L1_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L1_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL1_O3_13

transicao_L1_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L1_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL1_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeL1_O3_15

pinta_linha2_O_1:
addi $26, $0, 10
addi $12, $12, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17540 #Início de desenhar O na posição 3

desenhando_L2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L2_O1

transicao_L2_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1

transicao_L2_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_3

transicao_L2_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_4

transicao_L2_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_5

transicao_L2_O1_6:
add $2, $0, 512

outra_metadeL2_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L2_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL2_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_7

transicao_L2_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_8

transicao_L2_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_9

transicao_L2_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_11

transicao_L2_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_12

transicao_L2_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O1_13

transicao_L2_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha2_O_2
j outra_metadeL2_O1_15

pinta_linha2_O_2:
addi $27, $0, 10
addi $13, $13, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17636 #Início de desenhar O na posição 4

desenhando_L2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L2_O2

transicao_L2_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2

transicao_L2_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_3

transicao_L2_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_4

transicao_L2_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_5

transicao_L2_O2_6:
add $2, $0, 512

outra_metadeL2_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L2_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL2_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_7

transicao_L2_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_8

transicao_L2_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_9

transicao_L2_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_11

transicao_L2_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_12

transicao_L2_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O2_13

transicao_L2_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha2_O_3
j outra_metadeL2_O2_15

pinta_linha2_O_3:
addi $28, $0, 10
addi $14, $14, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17732 #Início de desenhar O na posição 5

desenhando_L2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L2_O3

transicao_L2_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3

transicao_L2_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_3

transicao_L2_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_4

transicao_L2_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_5

transicao_L2_O3_6:
add $2, $0, 512

outra_metadeL2_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L2_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL2_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_7

transicao_L2_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_8

transicao_L2_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_9

transicao_L2_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL2_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_11

transicao_L2_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_12

transicao_L2_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L2_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL2_O3_13

transicao_L2_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L2_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL2_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeL2_O3_15

pinta_linha3_O_1:
addi $29, $0, 10
addi $15, $15, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28292 #Início de desenhar O na posição 6

desenhando_L3_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L3_O1

transicao_L3_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1

transicao_L3_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_3

transicao_L3_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_4

transicao_L3_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_5

transicao_L3_O1_6:
add $2, $0, 512

outra_metadeL3_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L3_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL3_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_7

transicao_L3_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_8

transicao_L3_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_9

transicao_L3_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_11

transicao_L3_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_12

transicao_L3_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O1_13

transicao_L3_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha3_O_2
j outra_metadeL3_O1_15

pinta_linha3_O_2:
addi $30, $0, 10
addi $16, $16, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28388 #Início de desenhar O na posição 7

desenhando_L3_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L3_O2

transicao_L3_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2

transicao_L3_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_3

transicao_L3_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_4

transicao_L3_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_5

transicao_L3_O2_6:
add $2, $0, 512

outra_metadeL3_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L3_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL3_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_7

transicao_L3_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_8

transicao_L3_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_9

transicao_L3_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_11

transicao_L3_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_12

transicao_L3_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O2_13

transicao_L3_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_linha3_O_3
j outra_metadeL3_O2_15

pinta_linha3_O_3:
addi $31, $0, 10
addi $21, $21, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28484 #Início de desenhar O na posição 8

desenhando_L3_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_L3_O3

transicao_L3_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3

transicao_L3_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_3

transicao_L3_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_4

transicao_L3_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_5

transicao_L3_O3_6:
add $2, $0, 512

outra_metadeL3_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_L3_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeL3_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_7

transicao_L3_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_8

transicao_L3_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_9

transicao_L3_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeL3_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_11

transicao_L3_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_12

transicao_L3_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_L3_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeL3_O3_13

transicao_L3_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_L3_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeL3_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeL3_O3_15

pinta_coluna1_O_1:
addi $3, $0, 5
addi $5, $0, 10
addi $9, $9, 1
addi $2, $0, -512
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
lui $8, 0x1001
addi $8, $8, 6788 #Início de desenhar O na posição 0

desenhando_C1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C1_O1

transicao_C1_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1

transicao_C1_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_3

transicao_C1_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_4

transicao_C1_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_5

transicao_C1_O1_6:
add $2, $0, 512

outra_metadeC1_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C1_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC1_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_7

transicao_C1_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_8

transicao_C1_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_9

transicao_C1_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_11

transicao_C1_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_12

transicao_C1_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O1_13

transicao_C1_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna1_O_2
j outra_metadeC1_O1_15

pinta_coluna1_O_2:
addi $26, $0, 10
addi $12, $12, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17540 #Início de desenhar O na posição 3

desenhando_C1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C1_O2

transicao_C1_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2

transicao_C1_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_3

transicao_C1_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_4

transicao_C1_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_5

transicao_C1_O2_6:
add $2, $0, 512

outra_metadeC1_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C1_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC1_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_7

transicao_C1_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_8

transicao_C1_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_9

transicao_C1_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_11

transicao_C1_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_12

transicao_C1_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O2_13

transicao_C1_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna1_O_3
j outra_metadeC1_O2_15

pinta_coluna1_O_3:
addi $29, $0, 10
addi $15, $15, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28292 #Início de desenhar O na posição 6

desenhando_C1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C1_O3

transicao_C1_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3

transicao_C1_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_3

transicao_C1_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_4

transicao_C1_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_5

transicao_C1_O3_6:
add $2, $0, 512

outra_metadeC1_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C1_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC1_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_7

transicao_C1_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_8

transicao_C1_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_9

transicao_C1_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC1_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_11

transicao_C1_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_12

transicao_C1_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C1_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC1_O3_13

transicao_C1_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C1_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC1_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeC1_O3_15

pinta_coluna2_O_1:
addi $7, $0, 10
addi $10, $10, 1
addi $2, $0, -512
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
lui $8, 0x1001
addi $8, $8, 6884 #Início de desenhar O na posição 1

desenhando_C2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C2_O1

transicao_C2_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1

transicao_C2_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_3

transicao_C2_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_4

transicao_C2_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_5

transicao_C2_O1_6:
add $2, $0, 512

outra_metadeC2_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C2_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC2_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_7

transicao_C2_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_8

transicao_C2_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_9

transicao_C2_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_11

transicao_C2_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_12

transicao_C2_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O1_13

transicao_C2_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna2_O_2
j outra_metadeC2_O1_15

pinta_coluna2_O_2:
addi $27, $0, 10
addi $13, $13, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17636 #Início de desenhar O na posição 4

desenhando_C2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C2_O2

transicao_C2_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2

transicao_C2_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_3

transicao_C2_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_4

transicao_C2_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_5

transicao_C2_O2_6:
add $2, $0, 512

outra_metadeC2_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C2_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC2_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_7

transicao_C2_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_8

transicao_C2_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_9

transicao_C2_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_11

transicao_C2_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_12

transicao_C2_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O2_13

transicao_C2_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna2_O_3
j outra_metadeC2_O2_15

pinta_coluna2_O_3:
addi $30, $0, 10
addi $16, $16, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28388 #Início de desenhar O na posição 7

desenhando_C2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C2_O3

transicao_C2_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3

transicao_C2_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_3

transicao_C2_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_4

transicao_C2_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_5

transicao_C2_O3_6:
add $2, $0, 512

outra_metadeC2_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C2_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC2_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_7

transicao_C2_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_8

transicao_C2_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_9

transicao_C2_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC2_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_11

transicao_C2_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_12

transicao_C2_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C2_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC2_O3_13

transicao_C2_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C2_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC2_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeC2_O3_15

pinta_coluna3_O_1:
addi $23, $0, 10
addi $11, $11, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 6980 #Início de desenhar O na posição 2

desenhando_C3_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C3_O1

transicao_C3_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1

transicao_C3_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_3

transicao_C3_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_4

transicao_C3_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_5

transicao_C3_O1_6:
add $2, $0, 512

outra_metadeC3_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C3_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC3_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_7

transicao_C3_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_8

transicao_C3_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_9

transicao_C3_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_11

transicao_C3_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_12

transicao_C3_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O1_13

transicao_C3_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna3_O_2
j outra_metadeC3_O1_15

pinta_coluna3_O_2:
addi $28, $0, 10
addi $14, $14, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17732 #Início de desenhar O na posição 5

desenhando_C3_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C3_O2

transicao_C3_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2

transicao_C3_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_3

transicao_C3_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_4

transicao_C3_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_5

transicao_C3_O2_6:
add $2, $0, 512

outra_metadeC3_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C3_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC3_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_7

transicao_C3_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_8

transicao_C3_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_9

transicao_C3_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_11

transicao_C3_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_12

transicao_C3_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O2_13

transicao_C3_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_coluna3_O_3
j outra_metadeC3_O2_15

pinta_coluna3_O_3:
addi $31, $0, 10
addi $21, $21, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28484 #Início de desenhar O na posição 8

desenhando_C3_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_C3_O3

transicao_C3_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3

transicao_C3_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_3

transicao_C3_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_4

transicao_C3_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_5

transicao_C3_O3_6:
add $2, $0, 512

outra_metadeC3_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_C3_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeC3_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_7

transicao_C3_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_8

transicao_C3_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_9

transicao_C3_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeC3_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_11

transicao_C3_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_12

transicao_C3_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_C3_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeC3_O3_13

transicao_C3_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_C3_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeC3_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeC3_O3_15

pinta_diagonal1_O_1:
addi $3, $0, 5
addi $5, $0, 10
addi $9, $9, 1
addi $2, $0, -512
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
lui $8, 0x1001
addi $8, $8, 6788 #Início de desenhar O na posição 0

desenhando_D1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D1_O1

transicao_D1_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1

transicao_D1_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_3

transicao_D1_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_4

transicao_D1_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_5

transicao_D1_O1_6:
add $2, $0, 512

outra_metadeD1_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D1_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD1_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_7

transicao_D1_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_8

transicao_D1_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_9

transicao_D1_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_11

transicao_D1_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_12

transicao_D1_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O1_13

transicao_D1_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_diagonal1_O_2
j outra_metadeD1_O1_15

pinta_diagonal1_O_2:
addi $27, $0, 10
addi $13, $13, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17636 #Início de desenhar O na posição 4

desenhando_D1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D1_O2

transicao_D1_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2

transicao_D1_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_3

transicao_D1_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_4

transicao_D1_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_5

transicao_D1_O2_6:
add $2, $0, 512

outra_metadeD1_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D1_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD1_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_7

transicao_D1_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_8

transicao_D1_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_9

transicao_D1_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_11

transicao_D1_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_12

transicao_D1_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O2_13

transicao_D1_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_diagonal1_O_3
j outra_metadeD1_O2_15

pinta_diagonal1_O_3:
addi $31, $0, 10
addi $21, $21, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28484 #Início de desenhar O na posição 8

desenhando_D1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D1_O3

transicao_D1_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3

transicao_D1_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_3

transicao_D1_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_4

transicao_D1_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_5

transicao_D1_O3_6:
add $2, $0, 512

outra_metadeD1_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D1_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD1_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_7

transicao_D1_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_8

transicao_D1_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_9

transicao_D1_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD1_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_11

transicao_D1_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_12

transicao_D1_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D1_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD1_O3_13

transicao_D1_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D1_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD1_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeD1_O3_15

pinta_diagonal2_O_1:
addi $23, $0, 10
addi $11, $11, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 6980 #Início de desenhar O na posição 2

desenhando_D2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D2_O1

transicao_D2_O1:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O1:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1

transicao_D2_O1_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O1_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_3

transicao_D2_O1_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_4

transicao_D2_O1_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_5

transicao_D2_O1_6:
add $2, $0, 512

outra_metadeD2_O1_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D2_O1_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD2_O1_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_7

transicao_D2_O1_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_8

transicao_D2_O1_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_9

transicao_D2_O1_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O1_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O1_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_11

transicao_D2_O1_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_12

transicao_D2_O1_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O1_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O1_13

transicao_D2_O1_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O1_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O1_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_diagonal2_O_2
j outra_metadeD2_O1_15

pinta_diagonal2_O_2:
addi $27, $0, 10
addi $13, $13, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 17636 #Início de desenhar O na posição 4

desenhando_D2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D2_O2

transicao_D2_O2:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O2:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2

transicao_D2_O2_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O2_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_3

transicao_D2_O2_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_4

transicao_D2_O2_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_5

transicao_D2_O2_6:
add $2, $0, 512

outra_metadeD2_O2_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D2_O2_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD2_O2_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_7

transicao_D2_O2_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_8

transicao_D2_O2_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_9

transicao_D2_O2_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O2_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O2_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_11

transicao_D2_O2_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_12

transicao_D2_O2_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O2_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O2_13

transicao_D2_O2_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O2_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O2_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, pinta_diagonal2_O_3
j outra_metadeD2_O2_15

pinta_diagonal2_O_3:
addi $29, $0, 10
addi $15, $15, 1
addi $24, $0, 0xfbec5d #Cor amarela para o "O"
addi $3, $0, 5
addi $2, $0, -512
lui $8, 0x1001
addi $8, $8, 28292 #Início de desenhar O na posição 6

desenhando_D2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3 #Terminei a primeira parte do O, vou pra outra parte.
j desenhando_D2_O3

transicao_D2_O3:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_2 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3

transicao_D2_O3_2:
addi $2, $0, -512
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_2:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O3_3:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_3:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_4 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_3

transicao_D2_O3_4:
addi $2, $0, 4
addi $3, $0, 5
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_4:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_5 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_4

transicao_D2_O3_5:
addi $2, $0, 4
addi $3, $0, 2
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_5:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_6 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_5

transicao_D2_O3_6:
add $2, $0, 512

outra_metadeD2_O3_6:
add $8, $8, $2
sw $24, 0($8)
addi $6, $6, -1

transicao_D2_O3_7:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, 516 #Indo para o próximo começo de pintura

outra_metadeD2_O3_7:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_8 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_7

transicao_D2_O3_8:
addi $2, $0, 512
addi $3, $0, 5
addi $8, $8, 4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_8:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_9 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_8

transicao_D2_O3_9:
addi $2, $0, 512
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_9:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_10 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_9

transicao_D2_O3_10:
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_10:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O3_11:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -4 #Indo para o próximo começo de pintura

outra_metadeD2_O3_11:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_12 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_11

transicao_D2_O3_12:
addi $2, $0, -4
addi $3, $0, 5
addi $8, $8, 512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_12:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_13 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_12

transicao_D2_O3_13:
addi $2, $0, -4
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_13:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, transicao_D2_O3_14 #Terminei a segunda parte do O, vou pra outra parte.
j outra_metadeD2_O3_13

transicao_D2_O3_14:
addi $2, $0, -4
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_14:
sw $24, 0($8)
add $8, $8, $2

transicao_D2_O3_15:
addi $2, $0, -512
addi $3, $0, 2
addi $8, $8, -512 #Indo para o próximo começo de pintura

outra_metadeD2_O3_15:
sw $24, 0($8)
add $8, $8, $2
addi $3, $3, -1 
beq $3, $0, fim_jogo
j outra_metadeD2_O3_15

fim_jogo:
addi $24, $0, 0xfbec5d #Cor amarela para o texto de fim
addi $25, $0, 12
lui $8, 0x1001
addi $8, $8, 9268

desenhando_F:
beq $25, $0, transicao_F2
sw $24, 0($8)
addi $8, $8, -512
addi $25, $25, -1
j desenhando_F

transicao_F2:
addi $25, $0, 7

desenhando_F2:
beq $25, $0, transicao_F3
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_F2

transicao_F3:
addi $25, $0, 7
lui $8, 0x1001
addi $8, $8, 6708

desenhando_F3:
beq $25, $0, transicao_I
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_F3

transicao_I:
addi $25, $0, 7
lui $8, 0x1001
addi $8, $8, 18996

desenhando_I1:
beq $25, $0, transicao_I2
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_I1

transicao_I2:
addi $25, $0, 12
lui $8, 0x1001
addi $8, $8, 19008

desenhando_I2:
beq $25, $0, transicao_I3
sw $24, 0($8)
addi $8, $8, -512
addi $25, $25, -1
j desenhando_I2

transicao_I3:
addi $25, $0, 7
addi $8, $8, -12

desenhando_I3:
beq $25, $0, transicao_M
sw $24, 0($8)
addi $8, $8, 4
addi $25, $25, -1
j desenhando_I3

transicao_M:
addi $25, $0, 12
lui $8, 0x1001
addi $8, $8, 29236

desenhando_M:
beq $25, $0, transicao_M2
sw $24, 0($8)
addi $8, $8, -512
addi $25, $25, -1
j desenhando_M

transicao_M2:
addi $25, $0, 2
addi $8, $8, 516

desenhando_M2:
beq $25, $0, transicao_M3
sw $24, 0($8)
addi $8, $8, 516
addi $25, $25, -1
j desenhando_M2

transicao_M3:
addi $25, $0, 5

desenhando_M3:
beq $25, $0, transicao_M4
sw $24, 0($8)
addi $8, $8, 512
addi $25, $25, -1
j desenhando_M3

transicao_M4:
addi $25, $0, 12
lui $8, 0x1001
addi $8, $8, 29260

desenhando_M4:
beq $25, $0, transicao_M5
sw $24, 0($8)
addi $8, $8, -512
addi $25, $25, -1
j desenhando_M4

transicao_M5:
addi $8, $8, 508
addi $25, $0, 2

desenhando_M5:
beq $25, $0, fim
sw $24, 0($8)
addi $8, $8, 508
addi $25, $25, -1
j desenhando_M5

transicao_M6:
addi $25, $0, 5

fim:
addi $2, $0, 10 
syscall
