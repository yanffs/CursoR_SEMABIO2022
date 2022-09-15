#vetores

#Vetores s?o uma ferramente de armazenamento de dados.Esses podem ser num?ricos, 
#'caracteres ou l?gicos. Resumindo, s?o uma linha que cont?m os valores dos seus
#' dados. 
 
#Para criar um vetor, fa?a receber o objeto com o comando c()

vetor_numerico <- c(4, 0, 49)
vetor_numerico

#crie um vetor de caracter. com as letras x, y e z. 
vetor_caracter<-c("x", "y", "z")

#crie um vetor l?gico (F ou V)

#Vamos criar um vetor com a idade da turma. 
idade_galera<- c(19,21,26,44,49,29,37,38,18,26,31)
idade_galera  
#acrescente o nome das pessoas referente a cada idade com o comando names()
nomes<-c("Gabi","Yan","Cleberson","Roberto", "Rosa", "Clarine","Marcelo","Gilson","Fabricio","Tawara","Yuri")

#beleza, agora vamos acrescentar a altura de cada um e vamos adicionar ao nome.
#por?m, vamos fazer isso ficar um pouco mais f?cil, incorporando um vetor ao ontro.
names(idade_galera)<- nomes
idade_galera
vetor_nomes<- c(""

#fa?a o mesmo para idade_galera

#vamos somar a idade da turma com a posi??o de cada um na sala. 
vetor_posicao<-
    vetor_total<-idade_galera + vetor_posicao
vetor_total 

#repare que a soma seguiu a ordena??o
# A<-c(1,2,3); B<-c(4,5,6)
#total<-A+B; total = (1+4, 2+5, 3+6)



#Agora vamos considerar valores negativos.
#Uma partida de poker e de roleta nas casas de jogos. 

#Mercado de a??es. Um perde e ganha, qual investir?
acoes_petrobras <- c(140, -50, 20, -120, 240)
acoes_petrobras
# Roulette winnings from Monday to Friday:
acoes_avestruzmaster <- c(-24, -50, 100, -350, 10)
acoes_avestruzmaster
# Give names to both 'poker_vector' and 'roulette_vector'
dias_semana <- c("Seg", "Ter", "Qua", "Qui", "Sex")
names(acoes_petrobras) <- dias_semana
names(acoes_avestruzmaster) <- dias_semana
acoes_petrobras
acoes_avestruzmaster
# Up to you now:
total_dias <-  acoes_petrobras+acoes_avestruzmaster
total_dias

#Ok, quero saber quanto rendeu minhas a??es durante essa semana, utilize sum() para
#cada um delas. Salve-as como vetor, total_petro e total_avestruz
total_petro<-sum(acoes_petrobras,acoes_avestruzmaster)
total_petro
total_avestruzmaster
total_avestruz<-sum(acoes_avestruzmaster)
total_avestruz

#Como ver se houve lucro ou preju?zo total em a??es? Para isso some os 2 vetores
#separados dentro do () por uma v?rgula.
total_semana <- sum(acoes_avestruzmaster,acoes_petrobras)
total_semana
#Tire a d?vida com a l?gica total_petro > total_avestruz?
rendimento <- sum(acoes_avestruzmaster, acoes_petrobras)
rendimento  
redimento <- total_petro>total_avestruz
redimento
#' Selecionaremos um dia apenas dos ganhso com a Petrobras. Se vc quiser selecio
#' nar o primeiro elemento de um vetor coloque acoes_petrobras[1], o segundo ele
#' mento? acoes_petrobras[2]
#' selecione o terceiro elemento.
acoes_petrobras[c(1,5)]
acoes_petrobras[3]
acoes_petrobras[4]
#'E se quiser selecionar mais de um vetor? vc pode usar o c(). Selecionar dias 
#'espec?ficos pode usar, por exemplo, c(1,5) no caso segunda e sexta.
#'para selecionar uma sequ?ncia vc pode usar o s?mblo ":". Por exemplo c(x:y),
#'ou seja, uma sequ?ncia do n?mero x ao n?mero y. Ou, usar a fun??o seq(x,y) que permite
#'uma maior varia??o de forma??es de sequ?ncia.
#'
#' Utilize ":", para selecionar uma sequ?ncia dos dias de ter?a, quarta e quinta
#' -feira. 
#'
acoes_petrobras[c(2:4)]
#fa?a o mesmo para as acoes_avestruzmaster

#'POdemos escolher de acordo com os dias da semana, j? que n?s os registramos
#'dentro do dos vetores.
acoes_petrobras[c("Seg","Qui")]

#podemos calcular a m?dia das no?as a??es na PETROBRAS com o comando mean()
#fa?a isso para os tr?s primeiros dias da semana salve-os no vetor
#media_ganho_petro
media_ganho_petro <- mean(acoes_petrobras)
media_ganho_petro
media_ganho_aves <- mean(acoes_avestruzmaster)
media_ganho_aves
#'?timo, agora vc quer ver quais dias vc fez dinheiro com a??es da PETROBRAS
#' os s?mbolos que permitem fazer compara??es com opera??es e valores s?o:
#' 
#' < menor que
#' > maior que
#' >= maior ou igual
#' == iguais um ao outro
#' != n?o iguais uma outro

#'para comprovar seus ganhos pergunte ao R quais foram os ganhos maiores que 0 
#'(>0) nas a??es da PETROBRAS
#'
selecionar_respostaR<-c(acoes_petrobras)>0
selecionar_respostaR
selecionar_respostaA<-(acoes_avestruzmaster)<0
selecionar_respostaA
#'selecione a partir do vetor acoes_petrobras os valores que lhe renderam lucro. Para
#'isso vc utilizara os vetores selecionar_respostaR entre []
dias_lucro<-acoes_petrobras[selecionar_respostaR]
dias_lucro

#?timo, agora repita o procedimento para acoes_avestruzmaster

#Se quiser modificar ou adicionar algum valor ao vetor, isso tb ? poss?vel.  

acoes_petrobras["Sex"]<-300 #p/ substituir
acoes_petrobras
acoes_petrobras[6]<-400
acoes_petrobras

#Ent?o, em vetores podemos utilizar a fun??o barplot() para um r?pido gr?fico
#de barras. N?o consegui encontrar outra sa?da a n?o ser nomear novamente o ve
#tor. 

barplot(acoes_petrobras)
semana <- c("Seg", "Ter", "Qua", "Qui", "Sex","Sab")
names(acoes_petrobras)<-semana
barplot(acoes_petrobras)

#Uma brincadeira. 
barplot(1:50)

#um gr?fico
stripchart(acoes_petrobras)


#Uma fun??o pode ser plotada com dois veteores, um para o eixo x (vari?vel inde
#'pendente) e outro para o y (vari?vel dependente). Por exemplo.
acoes_petrobras
alta_bolsa<-c(6, 0.2, 0.6, 0, 8, 10) #pontos da bolsa. 
names(alta_bolsa)<-semana
plot(sort(acoes_petrobras),alta_bolsa)#'sort(0) permite que seja ordenado do
#'maior para o menor.

##Trabalhar com valores NA
