# Aula 03 - Matrizes

?matrix

# Que tal criarmos uma matriz?
#### Exemplo 1 - Matriz simples ####
mx<- matrix(1:15, byrow = T, nrow = 3)
mx
# Para navegar em matrizes []
 # [esquerda (linhas), direita (colunas)]

# Aqui nós repetimos a mesma matriz, no entanto, com outras especificações nos argumentos
matrix(1:15, byrow = F, nrow = 3)
t <- matrix(1:15, byrow = T, nrow = 3)
t[1,2]
t[3,5] # Os colchetes são utilizados para navegar dentro
# das células de uma tabela

# Vamos continuar trabalhando com uma sequencia de números
# Sequência de 1:32 (32 valores), ordenar o preenchimento por linhas e quatro colunas
matrix(1:32, byrow=T, ncol=4)

#### Exemplo 2 - Contextualizando (matrizes mais complexa) ####

# Que tal olharmos a bilheteria da trilogia dos anos 90 e início dos anos 2000?

# Jurassic Park – Parque dos Dinossauros - arrecadação nos EUA 357 milhões;
# arrecadação no exterior 621 milhões
# O mundo perdido: Jurassic Park - arrecadação nos EUA 229 milhões;
# arrecadação no exterior 389 milhões
# Jurassic Park III - arrecadação nos EUA 181 milhões;
# arrecadação no exterior 187 milhões

jp1993 <- c(357, 621)
jp1997 <- c(229, 389)
jp2001 <- c(181, 187)

#Alguém tem ideia em como construir uma matriz com os vetores acima?

jp <- matrix(c(jp1993,jp1997,jp2001), byrow = T, nrow = 3, ncol = 2)
View(jp)
head(jp,2) #mostra as primeira linhas da tabela
tail(jp,1) #mostra as ultimas linhas da tabela

# Vai adicionar títulos para as nossas linhas e colunas
#vamos atribuir nomes as colunas e as linhas
# com duas funções "rownames" e "colname"
nomesdalinhas <- c("jp1993", "jp1997", "jp2001")
rownames(jp) <- nomesdalinhas
rownames(jp) <- c("jp1993", "jp1997", "jp2001")
colnames(jp) <- c("EUA", "EXTERIOR")
jp

#Mostra as primeiras linhas e as ultimas
head(jp,1)
tail(jp,1)

#Tamanho?
length(jp[1,])
dim(jp)


# Caso a gente queira saber qual foi a arrecadação total de cada um dos filmes,
# como faríamos isso? Alguém tem ideia?
jp
(lucro <- rowSums(jp))
duda <- colSums(jp)
duda

#qual o lucro total dos três primeiros filmes?
sum(lucro)
sum(jp)


#Será que a gente consegue somar apenas valores específicos
# objeto, colchete ante da virgula é linha depois coluna 
sum(jp[,c(1,2)])
jp
sum(jp[c(1,2),1]) # vamos mudar! Somando apenas os valores da primeira e segunda linha
# da primeira coluna

#Vendo a diferenca nas somas de matrizes
# sum(jp[c(1,3),2]) - sum(jp[soma os valores da linha 1 e 3; da coluna 2])
sum(jp[c(1,3),2])
rownames(jp)
colnames(jp)

sum(jp["jp1993",])
sum(jp[1,1])


# Poderíamos criar essa matriz de maneira mais eficiente?
# Alguém sabe como poderíamos fazer?
bilheteria <- c(357, 621, 229, 389, 181, 187)
filmes <- c("jp1993","jp1997", "jp2001")
colnomes <- c("EUA", "EXTERIOR")

jp <- matrix(bilheteria,
             nrow = 3,
             byrow = TRUE,
             dimnames = list(filmes,colnomes))
head(jp)
View(jp)

# Se a gente quiser calcular o valor total do lucro por filme e apresentar na nossa
# tabela JP, como faríamos isso?

lucro <- rowSums(jp)
head(jp)
lucro
# Aqui nos combinamos as colunas
jpt <- cbind(jp,lucro)

# Aqui a gente vai olhar o nome das colunas
colnames(jpt)
rownames(jpt)

#Agora vamos descobrir o valor total para os EUA e fora dos EUA
(lucroloc <- colSums(jpt))
jpt <- rbind(jpt,lucroloc)
View(jpt)

#Selecionando colunas de interesse
colnames(jpt)
jpt_new <- jpt[,c(1,2)]
jpt_new <- jpt_new[-1,]
jpt_new <- jpt[,c("EUA","EXTERIOR")]
jpt_new <- jpt[-c(4,1),-3]

## Exemplo 3 - Estatística descritivas do conjunto de dados de Jurassic Park

#Que tal brincarmos um pouco com a matriz de dados (média, resumo, desvio padrão)

# Calculem a média para os EUA
rownames(jpt)
mean(jpt[1:3,"EUA"])
# Calculem o desvio padrão para o EUA
sd(jpt[1:3,"EUA"])
# Calculem os valores de média do primeiro e segundo filme no exterior
mean(jpt[c("jp1993","jp1997"), "EXTERIOR"])

# Situação hipotética: Se cada ingresso custa 5 dólares, como faríamos
# para ter ideia de quantas pessoas assistiram o filme?
(pessoas <- jpt[-4,"lucro"]/5)


### Exemplo 4 - Criando matrizes rápida
?matrix
matrix(0, 3, 4)

#Se eu quiser fazer uma matriz a paritr de um vetor

(a <- 1:12)
a

mt <- matrix(a, 3, 4)

# Utilizando a funcao dim()

plank <- 1:8
dim(plank) <- c(2,4)
plank

#eu preciso mudar o que tá preenchido no meu objeto plank
plank[2,4] <- 0
plank
