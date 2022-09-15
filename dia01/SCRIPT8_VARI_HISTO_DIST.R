
###
#Tema: VARIAVEIS HISTOGRAMAS
###


#vetor que identifica os participantes da pesquisa

participantes_1 <- c(2,3,5,7,11,13,17)

#transforme o vetor participantes_1 em caracteres.
#lembre-se primeiro cheque o tipo de vari?vel com o comando class() e ent?o apli
#que o comando factor()
class(participantes_1) #cheque o tipo de vari?vel
participantes_2 <- factor(participantes_1) #transformando o tipo da vari?vel de 
#ordinal para categ?rica (nominal)
class() #checando

#ordene os dados nominais de temperatura 
vetor_temperatura <- c("quente","frio", "agrad?vel", "frio", "agrad?vel")
class(vetor_temperatura) #o R j? reconhece como "character"

factor_vetor_temperatura <- factor(
                order = , levels = c())

class(factor_vetor_temperatura)
factor_vetor_temperatura


###
#Tema: ESTAT?STICA B?SICA - HISTOGRAMA E DISTRIBUI??O
###


#com Histogramas vc pode ver graficamente como ? a distribui??o dos seus dados. 


#vejamos uma distribui??o normal
distribuicao_normal<- seq(-10,10, .5)
distribuicao_normal
hist(distribuicao_normal)

distribuicao_normal2<-rnorm(distribuicao_normal)
distribuicao_normal2
hist(distribuicao_normal2)

distribuicao_normal<- seq(-100,100, .5)
distribuicao_normal
hist(distribuicao_normal)

distribuicao_normal2<-rnorm(distribuicao_normal)
distribuicao_normal2
hist(distribuicao_normal2)

distribuicao_normal<- seq(-1000,1000, .5)
distribuicao_normal
hist(distribuicao_normal)

distribuicao_normal2<-rnorm(distribuicao_normal)
distribuicao_normal2
hist(distribuicao_normal2)

x <- rnorm(1000)
hist(x, xlim=range(-4, 4, x), col="darkslategray4", main="")
title(main="1000 Normal Random Variates", font.main=3)
library(graphics)
demo(graphics) #Pacote, no qual

#####https://plot.ly/r/ - para visualizar outros tipos de gr?ficos que podem ser uteis no R
######http://www.statmethods.net/


#Uma distribui??o truncada
install.packages("truncnorm", dependencies = T)

library(truncnorm)
mu1 <- log(1)   #valores exemplo 1
mu2 <- log(50)
sig1 <- log(3) 
sig2 <- log(3)
cpct <- 0.4   

mu1 <- 0        #valores exemplo 2
mu2 <- 3500
sig1 <- 500
sig2 <- 500
cpct <- 0.8   

bimodalDistFunc <- function (n,cpct, mu1, mu2, sig1, sig2) {
  y0 <- rtruncnorm(n, a=0, mean = mu1, sd = sig1)
  y1 <- rtruncnorm(n, b=4000, mean = mu2, sd = sig2)
  
  flag <- rbinom(n, size=1, prob=cpct)
  y <- y0*(1 - flag) + y1*flag 
}

bimodalDistFunc
bimodalData <- bimodalDistFunc(n=1000, cpct, mu1, mu2, sig1, sig2)
hist(bimodalData)

library(mixtools)
require(mixtools)


mixbimod <- normalmixEM(bimodalData)
plot(mixbimod, which=2, main2="Equipment", xlab2="Expenditure ($)")
lines(density(bimodalData), lty=2, lwd=2)

mixbimod[c("lambda","mu","sigma")]
rm(bimodalData,cpct,mixbimod,mu1,mu2,sig1,sig2,bimodalDistFunc)
###

#ou dist t-Student 

x <- seq(-15,15,by=.5)
y <- dt(x,df=2,log=T)
plot(x,y)
y <- dt(x,df=10,log=T)
plot(x,y,add=T)
y <- dt(x,df=50,log=T)
plot(x,y,add=T)

##Vamos ver distribui??es em de um banco de dados. 

#carregue a tabela Impact dentro do arquivo tabela_curso_R.xlsx
impact<-read.table("clipboard",head=T)
View(impact)

#'Esse experimento feito com atletas de futebol americano buscou ver como fortes impactos afetam 
#'a capacidade de mem?ria dos atletas. Em metodologias visuais, verbais dentre outras.

#utilize a fun??o str() summary () e describe() para mais informa??es
install.packages("Hmisc",dependencies=TRUE) #comando describe() esta no pacote Hmisc
library("Hmisc")
describe()

#Crie um vetor "verbal_baseline" da vari?vel "verbal_memory_baseline" em "impact"
verbal_baseline <-

#'Fa?a um histograma de t?tulo "Distribui??o dos escores de mem?ria verbal", nomeie o eixo x com
#'"escores" e o eixo y com "frequ?ncia", para isso utilize os argumentos em hist(,main= , xlab= ,
#'ylab= ).
#'


#'Vamos a outro exemplo de distribui??o.
#'
  library(xlsx)
  tinto_vinho_data <- read.xlsx("tabela_curso_R.xlsx", sheetName="red_wine_data")
tinto_vinho_data
View(tinto_vinho_data)
describe(tinto_vinho_data)

#Para verificar a distribui??o de cada pa?s sobre as taxas de vinhos que atribu?ram seus
#'especialistas temos que primeiro selecionar apenas os pa?ses. Para isso usaremos o comando 
#'
#'subset()
#'
#'Criando um objeto para cada pa?s.
?subset
tinto_usa <- subset()

tinto_france <- subset()

tinto_australia <- subset()

tinto_argentina <- subset()

#'Ent?o, depois "chameremos" as vari?veis "Ratings" do data frame "tinto_vinho_data" 
tinto_ratings_usa <- 
tinto_ratings_usa
tinto_ratings_france <-
tinto_ratings_australia <-
tinto_ratings_argentina <-

#par(mfrow=c(,)) permite dividir a tela em v?rias sec??es. Sendo em "c(,)" anterior a v?rgula o 
  #n?mero de linhas e posterior o n?mero de colunas.

  par(mfrow = c(2,2))  
  
##construa histogramas de "tinto_ratings_pa?ses"  
#'
#'hist()


#'Legal, mas os gr?ficos tem que ser melhor apresentados. Com t?tulos e nomes nos eixos
#'fa?a o mesmo procedimento com a distribui??o da avalia??o dos epecialistas em vinho branco
branco_vinho_data <- read.xlsx("tabela_curso_R.xlsx", sheetName="white_wine_data")
View(branco_vinho_data)
describe(branco_vinho_data)

#em vez de fazer os dois procedimentos pode fazer um s? rapidamente.
branco_ratings_france <- as.numeric(subset(branco_vinho_data,
              branco_vinho_data$condition == "France")$Ratings)
branco_ratings_france
branco_ratings_argentina <- as.numeric(subset(dados,select)$avalia??es)
branco_ratings_australia <- 
branco_ratings_usa <- 

#'Dessa vez melhore a apresenta??o do seu gr?fico nomeando-o, inclusive, seus eixos.
#'
#'comando: hist()
#'T?tulo "Avalia??o vinho branco Pa?s"
#' eixo x= escores
#' eixo y= Frequ?ncia


  par(mfrow = c(1,1))



##
# Escala Z
##

z_vinho_branco<-scale(branco_ratings_france)
plot(z_vinho_branco)
