
###
#TEMA: Matrizes
###

#matrizes s?o um conjunto de elementos dos mesmos tipos de dados. Em linhas e
#colunas, por isso ? ? dita bidimensional.
#

#'com R vc pode construir uma matriz. Basta utilizar o comando matrix()
#'observe o exemplo. 

matrix(1:18, byrow=T, nrow=3)

#construa uma matriz de 4 linhas, para isso a quantidade de objetos deve ser divi
#s?vel por 4. 
matrix(1:28, byrow=F,nrow=4)

##CONTEXTUALIZANDO

#GUERRA NAS ESTRELAS. 
#assistido por todos os seres humanos, Guerra nas Estrelas (Star Wars) ? um cl?s
#s?co do cinema.
#
#'Vamos ver quanto faturaram nos 3 primeiro filmes em cronologia
#'
#' Bilheteria em milh?es. 
#' os primeiros n?meros equivale a bilheteria nos USA, os segundos no mundo.
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

#Construa uma matriz com esses valores 
star_wars_matrix<-matrix(c(new_hope,empire_strikes,return_jedi),byrow=T,nrow=3,ncol=2)
star_wars_matrix

#'Para ajudar a se localizar na tabela e para que posteriormente possa selecinar
#'elementos vamos nomear as linhas e as colunas para isso vc pode usar os comand
#'dos rownames() e colnames().
#'
#'nomes dos filmes nas linhas e nome das colunas (USA, nUSA), n?o se esque?a 
#'das "aspas" ;)
#'    "A New Hope", "The Empire Strikes Back" and "Return of the Jedi"
rownames(star_wars_matrix)<-c("A New Hope","The Empire Strikes Back","Return of the Jedi")
colnames(star_wars_matrix)<-c("USA","NUSA")
star_wars_matrix
#'Para ter uma no??o de quanto cada filme arrecadou no mundo tem quer ter a soma das
#'categorias de rentabilidade nos USA e no restante do mundo. 
#'
#'rowSum() ? a fun??o que calcula o total por linha de uma matriz. 
#'Al?m desse existe a possibilidade de somar colunas, assim como nomea-las
#'colsums(), colMeans(), rowMeans()
vetor_lucroT <- rowSums(star_wars_matrix)
vetor_lucroT
#Quanto cada filme faturou na soma da bilheteria entre pa?ses?
vetor_lucroT
sum(vetor_lucroT)
sum(star_wars_matrix[,c(1,2)])
star_wars_matrix[3,2]
#uma simplifica??o da constru??o de nossa matriz.
bilheteria <- c(461, 314.4, 290.5, 247.9, 309.3, 165.8)
filmes <- c("A New Hope","The Empire Strikes Back","Return of the Jedi")
col_nomes<- c("US","non-US")
star_wars_matrix <- matrix(bilheteria, nrow = 3, byrow = TRUE,
                           dimnames = list(filmes, col_nomes))
star_wars_matrix

#'Lucro Total, por filme para o p?blico nos EUA e fora dele.
vetor_lucroT <- rowSums(star_wars_matrix)
vetor_lucroT

# bind() ? para vincular esse vetor a matriz.
all_wars_matrix <- cbind(star_wars_matrix,vetor_lucroT)
all_wars_matrix

#Vamos adicionar uma nova matriz.
bilheteria2 <- c(474.5, 552.5, 310.7, 338.7, 380.3,  468.5)
filmes2 <- c("The Phantom Menace","Attack of the Clones","Revenge of the Sith")
col_nomes<- c("US","non-US")
star_wars_matrix2 <- matrix(bilheteria2, nrow = 3, byrow = TRUE,
                           dimnames = list(filmes2, col_nomes))
star_wars_matrix2

#combine as duas matrizes utilizando a fun??o rbind, para linhas.Originando uma
#nova matriz. matriz_starwars
matriz_starwars <- rbind(star_wars_matrix,star_wars_matrix2) 
matriz_starwars

#Agora agente tem a matriz completa e vamos aplicar um colSums() pra ver o total
#de arrecada??o da bilheteria para todos os filmes de Guerra nas Estrelas.

receita_starwars<-colSums(matriz_starwars)
receita_starwars

#POde se tirar estat?sticas descritivas, como uma m?dia. 
# m?dia por filme fora dos EUA
non_us_  <- mean(star_wars_matrix[,2])
non_us_
# m?dia do primeiro e segundo filme
no_us_some <- mean(star_wars_matrix[1:2,2])
non_us_some

## Estime que cada bilhete custe 5 dolares e se pode ter uma no??o da quantida
#de pessoas que assistiram aos filmes.
pessoas <- matriz_starwars/5
pessoas

#montando uma matriz de pre?os atualizados para cada filme
#primeiro unir os vetores filme e filme2
filmesT<-rbind(filmes,filmes2)
filmesT
matriz_preco<- matrix(c(5, 5, 6, 6, 7, 7,8,8,9,9,10,10), nrow = 6,
                      byrow = TRUE, dimnames = list(filmesT, col_nomes)) 
matriz_preco

# Estimativa de p?blico 
pessoas <- matriz_starwars/matriz_preco
pessoas
# Average number of US visitors
media_USA <- mean(pessoas[,1])
media_USA
# Average number of non-US visitors
media_nUSA <- mean(pessoas[,2])
media_nUSA


##
#administra??o r?pida de dados em matrizes

matrix(0, 3, 4) #fazendo uma matriz.

#a partir de um ?nico vetor
a <- 1:12
a
matrix(a, 3, 4)

#faremos uma nova matriz, e utilizaremos dim() par dimensionar o vetor. 
plank <- 1:8
dim(plank) <- c(2, 4)
plank

#mudar algum valor. 
plank[2,4]<-0
plank


##
# trabalhando com matrizes
##

#Ca?a ao tesouro

#'Um mapa de eleva??o da areia da praia mostra uma caracter?stica bastante 
#'plana, em que, todos os pontos est?o 1 metro acima do n?vel do mar. N?s
#'vamos criar uma matriz de 10 por 10, com todos os seus valores inicializados
#' sendo 1:
elevation <- matrix(1, 10, 10)
elevation
#'Ok, na procura do tesouro em nosso mapa, cavamos em um ponto e o n?vel desse
#'desceu 1 metro. Na quarta fileira, sexta coluna, defina eleva??o 0.
elevation[,] <- 0
elevation

#fa?a um mapa de contorno de uma matriz, usando a op??o contour()
contour(elevation)
#ou um plot de perfil com perps()
persp(elevation)

elevation[5,5]<-2
elevation
persp(elevation)

#use o argumento expand para poder mudar a vista.
persp(elevation,expand=.2)
persp(elevation,expand=1)
persp(elevation,expand=3)
persp(volcano)

#Veja a? o contour na matriz para um vulc?o dormente na Nova Zel?ndia. 
volcano
View(volcano)

contour(volcano)
persp(volcano, expand= .3)

#Podemos usar um mapa de calor, com image()
image(volcano)

#lembrando que vc sempre pode pedir ajuda para o Help. 
#para acessar o help, temos algumas op??es. 
#?nomedotermo;help() , ou no RStudio, help na janela inferior direita. ;)

help("persp")
?contour
#no final do documento. exemplos. Olha a? a curva do vulc?o com um gr?fico tra
#tado.

rx <- range(x <- 10*1:nrow(volcano))
ry <- range(y <- 10*1:ncol(volcano))
ry <- ry + c(-1, 1) * (diff(rx) - diff(ry))/2
tcol <- terrain.colors(12)
par(opar); opar <- par(pty = "s", bg = "lightcyan")
plot(x = 0, y = 0, type = "n", xlim = rx, ylim = ry, xlab = "", ylab = "")
u <- par("usr")
rect(u[1], u[3], u[2], u[4], col = tcol[8], border = "red")
contour(x, y, volcano, col = tcol[2], lty = "solid", add = TRUE,
        vfont = c("sans serif", "plain"))
title("A Topographic Map of Maunga Whau", font = 4)
abline(h = 200*0:4, v = 200*0:4, col = "lightgray", lty = 2, lwd = 0.1)



##FIM MATRIZ =D