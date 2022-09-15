
#Tema: DATA FRAME
###

#quase uma matriz, mas que contenham dados de outra natureza. 

#Por exemplo, uma pesquisa que capta o perfil das pessoas que frequentam um estabelecimento

#'Vc ? casado? 
    #'resposta: SIM / N?O - dados l?gicos;
#'Quantos anos de idade?
    #'dados num?ricos
#'Qual sua opini?o sobre esse produto?
    #'dados de caracteres. 
    #'
    #'enfim.....
airquality
View(airquality)
summary(airquality)
class(airquality)
#'
#'as informa??os desse question?rio ir? parar em uma tabela com diferentes tipos de dados
#'e isso ? uma coisa muito comum no campo das an?lises de dados. 
#'
#'um Data Frame, possui as observa??es nas linhas e as vari?veis nas colunas. 
#'
#'unidade amostral nas linhas e caracter?sticas nas colunas. 
#'

mtcars #exemplo de data frame j? dispon?vel no R.
summary(mtcars)
View(mtcars) #uma melhor visualiza??o
class(mtcars)
head(mtcars)
tail(mtcars)
edit(mtcars)
#tabelas muito grandes podem ser dif?cil a observa??o. 

head(mtcars) # para uma visualiza??o r?pida das primeiras linhas... as vari?veis est?o 
#evidentes nas colunas
tail(mtcars) # para uma visualiza??o das ?ltimas linhas... as vari?veis est?o evidentes
#nas colunas

#para ver a estrutura dos seus dados o comando str()
str(mtcars)
#essa fun??o lhe diz
  #'quantas observa??es.
  #'quantas vari?veis.
  #'uma lista das vari?veis.
  #'os tipos de dados das vari?veis
  #'as primeiras observa??es



#Vamos montar um data frame de nosso sistema solar de nossos vetores a baixo:

plnts <- c("Mercurio", "Venus", "Terra", "Marte", "Jupiter", "Saturno",
             "Uranio", "Neturno");
tipo <- c("Terrestre", "Terrestre", "Terrestre",
          "Terrestre", "gigante gasoso", "gigante gasoso", "gigante gasoso", "gigante gasoso")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883); 
rotacao <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67);
aneis <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE);

#para criar um data frame dos vetores pode usar o comando data.frame()
plnts_df  <-data.frame(plnts,tipo,diameter,rotacao,aneis)
plnts_df
str(plnts)
#agora d? uma olhada r?pida da sua tabela com head() e str()

# da mesma maneira que vetores e matrizes os colchetes [] selecionam elementos do data fra
#'me 
#Exemplo: 
plnts_df[1:3,2:4] #antes da v?rgula - linhas, depois da v?rgula- colunas

plnts_df[1:3, c(1,3)]

#selecione agora os tr?s primeiros planetas e o receba em plnts_proximos
plnts_proximos<-
plnts_proximos
#fa?a o mesmo para os ?ltimos 3 planetas e registre-os como plnt_afastados
?data.frame
help("data.frame")

#'as vezes vc quer selecionar alguma unidade amostral (linhas) e de determinado tipo de 
#'vari?vel (colunas). Podemos utilizar a coluna correspondente a sua sequ?ncia
summary(plnts_df)
plnts_df[c(1,3,8), c("tipo","aneis")]
plnts_df[c(1,3,8), c(2,4)]
plnts_df[1:8, "tipo","aneis"]

#ou selecinar pelo nome da vari?vel. 
plnts_df[1:3,"tipo"]

#ent?o, selecione as 6 ?ltimas linhas e salve na vari?vel diametros_afastados
diametros_afastados<-plnts_df[3:8, "diameter"]
diametros_afastados

#vc quer selecionar todas as observa??es para vari?vel "aneis", ent?o tem algumas maneiras
#'de realizar isso.
plnts_df[,5]
plnts_df[,"aneis"]
plnts_df[[5]]
plnts_df[["aneis"]]
#contudo a maneira mais usual ? atrelar o data frame a sua coluna, que pode ser feito 
#pelo s?mbolo "$" cifr?o. Essa ? uma ferramente que vc utilizar? constantemente vc pode
#utilizar meu_data_frame$nome_da_variavel, fa?a o mesmo para plnts_df

aneis_vector<- plnts_df$aneis
aneis_vector
#outra maneira, mas, n?o muito segura ? utilizar o comando attach() para registar as vari
#?veis na mem?ria RAM da m?quina. Para apaga-las utilize o comando detach(), mas vc pode
#acabar esquecendo disso e unir v?rios attach() e mistura-los na sua an?lisa.
#assim, o mais seguro ? o $


attach(plnts_df) #' Serve para simplificar a forma de escolher a coluna, por?m deve
#'lembrado que 
#'
aneis
diameter
rotacao
plot(diameter,rotacao, main="Os planeta gira",ylab="Rota??o",xlab="Di?metro")
lm(rotacao~diameter)
abline(lm(plnts_df$rotacao~plnts_df$diameter))
summary(rotacao-diameter)
summary(lm(plnts_df$rotacao~plnts_df$diameter))

### ~ significa que est? em fun??o. Por exemplo, rotacao~plnts_df

summary(plnts_df)
detach(plnts_df)

#vamos supor que vc s? queira selecionar informa??es de planetas com an?is. 
#ent?o vc pode selecionar a vari?vel para apenas as linhas com valor TRUE para an?is se
#tornarem evidentes. .
aneis_vector
plnts_aneis<-plnts_df[,]
plnts_aneis

#'o comando subset() ? uma alternativa mais usual para realizar essa sele??o de planetas com
#'an?is. 
?subset
#subset(x, subset, select, drop = FALSE, ... #p/ metodos de classe matrix ou data.frame

#ent?o, vamos selecionar apenas os planetas com an?is
subset(plnts_df,aneis==T)
subset(plnts_df,aneis==T, sulect = c(diameter,rotacao))

#'####Faz-se um subset p/ selecionar apenas as variaveis de interesse, uma vez que 
#'se mostra muito trabalhoso gerar diversas tabelas p/ a trablahar com dados espec?ficos
#'uma matriz grande... 
#'
#agora utilize subset() para selecionar os planetas com diametro<1 no vetor plnts_menores
plnts_menores<-subset(plnts_df,diameter>1)
plnts_menores
summary(plnts_menores)
diameter_planetas<-subset(plnts_df,select = c(plnts,diameter))
diameter_planetas
#A fun??o order, atribui valor ordenado das vari?veis.
a<-c(100,9,200)
order(a)
a[order(a)]
sort(a) #para colocar em ordem pode-se usar o comando sort()

#vamos utilizar essa fun??o para plnts_df
head(plnts_df)
plnts_df$diameter
order(plnts_df$diameter)

#ent?o vamos salvar em posi??es os diametros com argumento decreasing=T
posi??es<-order(plnts_df$diameter, decreasing=T)
posi??es

#agora descubra os maiores planetas, salve-os na vari?vel primeiros_maiores
primeiros_maiores<-plnts_df[posi??es,]
primeiros_maiores
sort(plnts_df$diameter, decreasing=T)


