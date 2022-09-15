
###
#Tema: LISTAS
###

#'uma List ? realmente uma lista. 
#'Ela lhe permite reunir uma variedade de objetos sob um nome (nome da lista) e de uma manei
#'ra ordenada. Quaisquer objetos, matrizes, vetores, listas, dados
#'
#'Ent?o, vamos criar uma lista. 
#'

vetor <- 1:10 
matriz <- matrix(1:9, ncol = 3)
matriz
# primeiros 10 elementos de 'mtcars'
carangas <- mtcars[1:10,]
carangas

# construa uma lista com esses diferentes objetos
lista <- list(vetor, matriz,carangas)
lista

#podemos renomear seus objetos
names(lista)<-c("vet","mat","car")
lista

#Vamos fazer uma lista sobre o filme "O_Iluminado", mas antes vamos criar os vetores.
atores<-c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers",
          "Barry Nelson")
atores
escores<-c(4.5, 4.0, 5.0)
fontes<-c("IMDb1", "IMDb2", "IMDb3")
comentarios<- c("Best Horror Film I Have Ever Seen", "A truly brilliant and scary film from
Stanley Kubrick", "A masterpiece of psychological horror")
sumario <- data.frame(escores,fontes,comentarios)
sumario

#Lista o_iluminado.
o_iluminado <- list(filme="O Iluminado - The Shining",atores=atores,sumario=sumario)
o_iluminado

o_iluminado
o_iluminado[["sumario"]]
o_iluminado$sumario
o_iluminado[2]
o_iluminado[[2]]
o_iluminado[[2]][1]
# Define 'ultimo_ator'
ultimo_ator <- o_iluminado[[2]][5]
ultimo_ator
# Define 'sumario2'
sumario2 <- o_iluminado[["sumario"]][2,]
sumario2

str(o_iluminado)

#E, o filme ? de qual ano?
iluminado_o<-c(o_iluminado, ano= 1980)
iluminado_o

str(iluminado_o)
