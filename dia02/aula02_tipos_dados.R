
#### Aula 02 - Tipos de dados ####

# Introdução ao R - Tipos de dados


#   CLASSES que o valores podem ter ----

# INTEGERS - números naturais, ex:124
# NUMERICS = valores decimais, ex: 124.9

### Exemplos
numerico <- c(59.2, 6.2, 900)
numerico


# LÓGICOS (TRUE, FALSE) = podem ser abreviados como T e F

### Exemplos
logico<- c(TRUE, FALSE, F, T, T,T, F, F)
logico


# CHARACTERS = textos (use aspas)

### Exemplos
caracter <- c("lais", "Yan", "Murilo")
caracter

###OBS - para checar como o R está interpretando seus dados use a função class()
class(numerico)
class(caracter)


### Uso de sinais lógicos

# Use **==** para verificar se valores são iguais. O R retornará uma resposta lógica

2+2==5
8==8


# Use **!=** para verificar se valores NÃO são iguais. O R retornará uma resposta lógica

2+2!=5

8!=8


# Use **< (menor que)** ou **> (maior que)**; **<= menor ou igual** ou **>= maior ou igual**. O R retornará uma respota lógica


2+2<5 #menor que

8>=8 #maior ou igual


## MÃO NA MASSA. . .

# Crie uma variável (objeto) com valor 42 e divida por 2. Verifique qual a classe do objeto. Depois, substitua o valor da variável por “Eita!”. Cheque seu valor e cheque a sua classe.

## ESTRUTURA DE DADOS

#### VETORES
# São uma ferramente de armazenamento de dados/valores (classes: numéricos, caracteres ou lógicos).Para criar um vetor pode-se usar o comando c(), por exemplo.
vec1 = c(1,4,6,8,10) #vetor numérico
vec1
vec1[5] #mostra o quinto elemento

vetor_caracter<-c("x", "y", "z") #criando vetor com caracteres
vetor_caracter


# Outra maneira de criar vetores com sequências de números

vec2 = seq(from=0, to=1, by=0.25)
vec2
sum(vec1, vec2)


## MÃO NA MASSA . . .
# Vamos criar um vetor com a idade da turma. E vincular cada idade aos nomes.

idade_galera <- c(19,21,26,44,49,29,37,38,18,26,31)
idade_galera


# Criando vetor com caracteres

nomes<-c("Gabi",
         "Yan",
         "Cleberson",
         "Roberto",
         "Rosa",
         "Clarine",
         "Marcelo",
         "Gilson",
         "Fabricio",
         "Tawara",
         "Yuri")
names(idade_galera)<- nomes
idade_galera


# OBSERVAÇÃO: o que são fatores? São dados categóricos

genero <- c("M", "H" , "H", "M", "H","H")
genero
class(genero)


# Para interpretrar dados como fatores (categóricos), utilizamos: factor()
  
fgenero <- factor(genero)
fgenero


# Outro exemplo de fator: categórico e ordinal

temperatura_vector <- c("High", "Low", "High","Low", "Medium")
class(temperatura_vector)
#duvidas sobre a função factor? Pesquise no help


# Utilizamos essa função para definir níveis entre as variáveis categóricas

factor_temperatura_vector <- factor(temperatura_vector,
                                    order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperatura_vector


# Use levels () para identificar os níveis e is.factor () para verificar se o objeto é um fator
levels (genero)
levels(factor_temperatura_vector)


# Sumarize os dados

summary (genero)
summary(factor_temperatura_vector)


## MÃO NA MASSA . . .

# Um time de 5 analistas de dados em R são categorizados quanto a sua rapidez.
# Crie uma ordenação das categorias (fator com ordenação) e aplique o summary.
# Depois, compare o analista 2 com o analista 5 (atribua um objeto).

velocidade <- c("Fast","Slow","Slow","Fast","Ultra-fast","Ultra-fast","Ultra-fast")


### Explorando vetores
# Exemplo com valores positivos e negativos:

# Mercado de acoes
petrobras <- c(140, -50, 20, -120, 240)
petrobras
magaluiza <- c(-24, -50, 100, -350, 10)
magaluiza


# Quanto rendeu as acoes na semana em cada investimento e no total?
total_pet <- sum (petrobras)
total_pet

total_maga <- sum (magaluiza)
total_maga

rendimento <- sum (petrobras, magaluiza)
rendimento

# Petrobras foi mais rentável?
total_pet>total_maga


# Qual foi a média de rendimentos?
  
m_pet <- mean (petrobras)
m_maga <- mean (magaluiza)
m_rendimento <- mean (rendimento)

# investimentos

dias_semana <- c("Seg", "Ter", "Qua", "Qui", "Sex")
names(petrobras) <- dias_semana
names(magaluiza) <- dias_semana
petrobras #checando
magaluiza #checando

# Selecionando terça-feira
petrobras [2]
magaluiza[2]
rendimento [2]

# Selecionando segunda e sexta
petrobras [c(1,5)]
magaluiza[c(1,5)]
rendimento [c(1,5)]

# Selecionando a sequência de terça a quinta
petrobras [c(2:4)]
magaluiza[c(2:4)]
rendimento [c(2:4)]
petrobras[c("Seg","Qui")]
(magaluiza)<0 #verificando acoes negativas - prejuizo
(magaluiza)>0 #verificando acoes positivas - lucro


# Para modificar ou adicionar algum valor ao vetor
petrobras["Sex"]<-300
petrobras
magaluiza [5] <- 400
magaluiza


## Criando gráficos
# Primeiro nós vamos criar um gráfico do tipo de barras para isso vamos utilizar a função **barplot**
  
barplot(1:50)


# Agora vamos fazer com o conjunto de dados petrobras
barplot(petrobras)

# Agora vamos fazer um gráfico do tipo stripchrt
stripchart(petrobras)

# Agora vamos fazer uma gráfico de duas variáveis (plot x, y)
bolsa <- c(6, 0.2, 0.6, 0, 8) #pontos da bolsa.
names(bolsa)<-dias_semana
plot (petrobras, bolsa)



# Tipos de objetos

### Matrizes 

# Sao um conjunto de elementos dos mesmos tipos de dados. Em linhas e colunas (bidimensional)
  
  
mat=matrix(data=c(9,2,3,4,5,6),ncol=3)
mat



### Data Frame

#Eh semelhante a uma matriz, porem as colunas tem nomes e, por isso, podem
#conter dados de tipos diferentes.

t <- data.frame(x = c(11,12,14), y = c(19,20,21), z = c(10,9,7))
t


### Lista
# Todo data frame é uma lista; se parecem com vetores; podem conter matrizes,
# dataframes e outros tipos de dados


L = list(one=1, two=c(1,2),five=seq(0, 1, length=5))
L


