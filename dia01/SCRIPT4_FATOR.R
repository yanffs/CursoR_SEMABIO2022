
###
#TEMA: FATORES
###

#' O que ? um fator? Pra que irei usa-lo?
#' 
#' O termo fator, refere-se a dados ditos nominais e categ?ricos. 
#' Lembrando que existe as vari?veis cont?nuas e categ?ricas. 
#' as categ?ricas variam dentre um n?mero limitado de categorias, em compara??o
#' ?s cont?nuas que variam dentro do infinito. 
#' 
#' Assim, podemos nos deparar com situa??es que teremos que falar par o R que 
#' estamos lhe dando com dados categ?ricos. 


#' Muitos estudos comparam, observam, ou, simplesmente descrevem an?lises entre
#' pessoas do sexo Feminino ou Masculino. 
#' Para O R interpretrar dados como fatores (categ?ricos), utilizamos o comando
#' factor()

#primeiro, criar um vetor com dados de caracteres.
#entre mulheres "Feminino" e homens "Masculino".
genero <- c("M","H","H","M","H","H")
genero
class(genero)
# e ent?o aplicar do comando factor()
factor_genero <-factor(genero)
factor_genero


#Outro tipos de dados categ?ricos s?o os nominais e os categ?ricos ordinais
#exemplo

animais_vector <- c("anta", "onca", "macaco", "formiga") #categ. nominais
temperatura_vector <- c("High", "Low", "High","Low", "Medium")#categ. ordinais
class(animais_vector)
class(temperatura_vector)
#o mesmo tratamento entre genero
factor_animais_vector <- factor(animais_vector)
factor_animais_vector
#tratamento com ordena??o
?factor
help(factor)

factor_temperatura_vector <- factor(temperatura_vector,
      order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperatura_vector

#melhorando a visualiza??o dos levels(), 
genero
factor_genero

Month <- airquality$Month
table(addNA(Month))
table(addNA(Month, ifany = TRUE))


is.factor(airquality$Month)
class(airquality$Month)
head(airquality)
factor_Month<-factor(airquality[,"Month"])
factor_Month
levels(factor_Month)<-c("maio","junho","julho","agosto","setembro")
factor_Month
view(airquality)
factor_Ozone<-factor(airquality[,"Ozone"])
factor_Ozone
view(ariquality)
# Specify the levels of 'factor_pesquisa_vector'
levels(factor_genero)<-c("Homem","Mulher")
factor_pesquisa_vector

# Type your code here for 'pesquisa_vector'
summary(genero)
summary(airquality[,"Solar.R"])
summary(factor_Month)
summary(airquality[,"Ozone"])
summary(factor_Ozone)

# Type your code here for 'factor_pesquisa_vector'
summary(factor_pesquisa_vector)
# Feminino
factor_pesquisa_vector[1] 
# Masculino
factor_pesquisa_vector[2] 

factor_pesquisa_vector[1] > factor_pesquisa_vector[2] #cat. nominais

## Outro exemplo:
#temos um time de 5 analista de dados em R
# o vetor tem suas categorias de rapidez com que conseguem realizar as an?lises.

# Vetor velocidade:
velocidade_vector <- c("Fast","Slow","Slow","Fast","Ultra-fast","Ultra-fast","Ultra-fast")

#Crie uma ordena??o das categorias.
      # use como molde o c?digo acima da ordena??o de temperatura. 
factor_velocidade_vector <-  factor(velocidade_vector, ordered=T,levels=c("Slow","Fast","Ultra-fast"))
factor_velocidade_vector

#aplique um summary()
summary(factor_velocidade_vector)

#compare o analista de dado n?mero 2 com o analista n?mero 5, atribua a ele o vetor
comparar<-factor_velocidade_vector[2]>factor_velocidade_vector[5]
comparar

##
# Vamos trabalhar com caracteres. 

minerio <- c('ouro', 'prata', 'rubi', 'ouro', 'rubi')
tipos <- factor(minerio)
minerio
tipos
as.integer(tipos) # pra vc ver quantas categorias t?m.
levels(tipos) # pra vc ver os levels que t?m.

#agora vamos relacionar as caracter?sticas aos seus respectivos valores. 
peso_g <- c(300, 200, 100, 250, 150)
valor_dolar <- c(9000, 5000, 12000, 7500, 18000)
plot(peso_g, valor_dolar)
summary(minerio)
#Vamos deixar gr?fico mais sofisticado, atribu?ndo aos pontos (pch=), os factors.
plot(peso_g, valor_dolar, pch=as.integer(tipos),main="Pre?os dos minerais",ylab="Pre?o em dolar",xlab="Peso em gramas")

#E, ent?o, adicionar uma legenda.
legend("topright", c("rubi", "ouro", "prata"), pch=1:3)

#mas escrever os nomes das legendas isso j? fizemos no vetor tipos_vector. 
legend("topright", levels(tipos), pch=1:length(levels(tipos)))


