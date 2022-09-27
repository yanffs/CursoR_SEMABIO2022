
#confira a pasta que está sendo lida no R
setwd("nome da pasta")
dir()

#Exemplo de instalar pacote
install.packages ("vegan")
library (vegan)

#R como calculadora
6+2
6*2
6/2
6^2

#R como calculadora (muitos valores)
10+3*6 #lembre do parenteses
(10+3)*6

#Vetores (muitos valores de uma vez)
1:10 # para sequencia de numeros use :

#Operacoes com sequencia
1:10*2

1:10/2

sqrt (785649)*sin (25:30) #raiz quadrada e seno 

# CONCATENAR (c)
c(7,2,3,1)

c(7,2,3,1)^0.49

############ REMOVE OBJETO (rm) ###########

#Criando Objetos a partir de vetor (variaveis)

seq <- c(7,2,3,1)
x <- "lais"
y = "yan"

rm (x) #remove objetos

rm(list=ls(all=T))


#Criando objetos e fazendo cálculos

eco <- 2
eco

eco*5+eco/2

logia <- c(3,5,1,2)

eco*logia
eco+logia

vec <- seq (from=0, to=1,by = 0.25)

#Funcoes pre-definidas

mean (logia)
sum (logia)

sum (5,6,8,9)

length(logia)
var (logia)

#1. Quanto tempo da sua vida voce esta na universidade

#Compute a diferenca entre 2022 e o ano que voce iniciou na universidade 
# e divida isso pela diferenca entre
#2022 e o ano que voce nasceu. Multiplique isso por 100 para ter a porcentagem 
#de vida que voce passou na
#universidade ate hoje. Use parenteses, caso necessario.

(2022 -2014)/(2022-1996)*100

#2. Refaça o exercicio anterior criando objetos dando nomes para cada variavel.
now <- 2022
uni <- 2014
born <- 1996
(now - uni)/(now-born)*100

# 3. Suponha que voce tenha uma cesta com frutas e deseja computa-las.
#Na sua cesta há 5 maças. Crie uma variavel com suas maças e chame de 
#"minhas_macas".Cheque a variável e veja o valor atribuido
#.Bananas tambem nao podem faltar na sua cesta.
#Então introduza meia dúzia na variavel "minhas_bananas". 
#Cheque tambem essa variavel.Crie uma variavel 
#"minhas_frutas" para todas as sua frutas (macas e bananas).
#Quantas frutas você tem no total?

minhas_macas <- 5
minhas_macas
minhas_bananas <- 6
minhas_bananas
minhas_frutas <- c(minhas_bananas, minhas_macas)
minhas_frutas

sum (minhas_frutas)


# 4. Calcular desvio padrao do objeto logia
# . Calcule a media da amostra logia
# . Subtraia cada um dos valores da media de logia
# . Pegue essas diferencas em relação a media e eleve-as ao quadrado
# . Agora some todos os valores
# . Pegue essa soma toda e divida pelo numero de observações
# . Retire a raiz quadrada do total para trazer novamente a escala dos dados originais


sqrt(sum((logia - (mean (logia)))^2)/length(logia))
sd(logia)
