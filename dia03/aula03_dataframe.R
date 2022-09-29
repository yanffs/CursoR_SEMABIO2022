#### Aula 03 - Data Frame ####

# Primeiro - instalar pacotes
install.packages("ggplot2", dep = T)
install.packages("ggpubr", dep = T)
# Segundo - baixar planilha no onedrive (link no chat do meet)
# consumo_cerveja.csv

getwd() #mostra o diretorio no qual vc esta trabalhando
setwd() #define o diretorio

getwd()

## Carregando uma planilha no R
dir()
df <- read.table("consumo_cerveja.csv", sep =",", h = TRUE)
df <- read.csv("consumo_cerveja.csv", h = TRUE)
View(df) #mostra planilha
head(df) #mostra primeiras 6 linhas
tail(df) #mostra ultimas 6 linhas

str(df)

head(df,10) #mostra as 10 primeiras
summary(df)

#Comprimento da minha tabela, mas não vou olhar as medidas
# no meu ambiente
length(df$data)
df$tempMed

#para navegar entre as colunas é muito fácil, pois basta usar o símbolo
# de $

library(ggplot2)
library(ggpubr)

# Plot species-env relationships
colnames(df)
# Grafico lindao by Yanzin
p1 <- ggplot(data = df, mapping = aes(x = tempMax, y = consumoLitros)) + 
  geom_point() + 
  geom_smooth(method="loess") + 
  xlab('Temperatura máxima') + 
  ylab('Consumo de cerveja em litros')

p1
#Grafico feiosoooo

plot(df$consumoLitros ~ df$tempMax)
plot(consumoLitros ~ tempMax, data = df)


### Acessando informações 
df[1:10,2]

#Qual a outra maneira de navegar nas colunas? Sem usar os números?
colnames(df)
df[,"tempMed"]
df[5,]
df[10,]
df[15,2]
df[35,c(2,3,4)]

# Eu quero que vocês façam
  # Selecione apenas as linhas 35, 150, 360 e 365
  # Apenas da 6 coluna da tabela
  # Criando um novo objeto chamado amostra
  # Calculem a média e o desvio padrão

amostra <- df[c(35,150,360,365),6]
mean(amostra);sd(amostra)

# Voces se lembram dos testes lógicos?
# Que a laís mostrou para vocês?
# Quero saber se vocês sabem perguntar pro R
# Se tem valores iguais 28000 litros na minha coluna consumoLitros
# (sexta coluna)

df$consumoLitros==28000

# Sera que tem consumo igual 35589?
df$consumoLitros==35589

# Que tal a gente brincar com o R e perguntar?a repeito das temperaturas?
# Acima de 21 graus (temperatura média)?
df[df$tempMed >= 21,]

df[df$tempMed < 16, ]
grau16 <- df[df$tempMed <= 16, ]#criamos um objeto com a seleção de dados

grau16[grau16$tempMax >= 20, 4] <- 14.5 #vamos substituir os balores

View(grau16)

# Além de substituir a gente pode fazer outras coisas, como botar mais de uma condição


df[df$tempMax == 29 & df$consumoLitros<20000,] # tem que atender as duas demandas

df[df$tempMax==18.1 | df$consumoLitros < 20000,] # temque atender as duas demandas, mas nem tanto

#salva nossa tabela em um novo vetor
d2 <- df

d2 <- d2[20:150,]
length(d2$tempMin)




