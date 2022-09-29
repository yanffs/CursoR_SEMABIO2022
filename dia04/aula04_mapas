#### Aula 04 - Mapas ####

#   1.0-Ajustes iniciais ------

# Antes de tudo, iremos carregar pacotes necessarios para importar dados,
# produzir mapas e realizar as análises

# Caso nao tenha os pacotes instalados pode instalar aqui
install.packages(c("adehabitatHR",
                   "colorRamps",
                   "colorspace",
                   #"GISTools",
                   "maps",
                   "maptools",
                   "raster",
                   "rgbif",
                   "CoordinateCleaner",
                   "dplyr",
                   "prettymapr")) #nos tambem podemos concatenar a instalacao dos pacotes
install.packages("prettymapr", dep = T)
# Apos a instalacao dos pacotes basta carregar os pacotes
library(adehabitatHR)
library(colorRamps)
library(colorspace)
#library(GISTools)
library(maps)
library(maptools)
library(raster)
library(rgbif) #para baixar dados do gbif
library(ggplot2)
library(CoordinateCleaner)



#   2.0-Producao do Mapa no R ------

#   2.1-Mundo divisao politica ------

# Que tal produzirmos uma mapa simples com divisao politica dos paises no mundo?
# Para isso eh muito simples basta carregar a base de dados e posteriormente
# imprimir (plotar) em sua tela

data(wrld_simpl) # carrega a base de dados
?wrld_simpl # aqui apresenta uma descricao do conjunto de dados

windows(8,8) #windows
quartz(8,8) #mac
X11(8,8) #linux
plot(wrld_simpl) # cria grafico
dev.off()

#   2.2-America do Sul: politico ------

# A partir do conjunto de dados de divisao politica global podemos fazer um recorte
# para America do sul e para isso eh muito simples, pois basta especificar as coordenadas
# geograficas latitude (eixo y) e longitude (eixo x) para a area de interesse.
# Aqui nos iremos escolher os limites da America do Sul/Central

windows(8,8) #windows
quartz(8,8) #mac
X11(8,8) #linux

plot(wrld_simpl,
     xlim = c(-90, -30),
     ylim = c(-60, 15),
     col = "#3182bd",
     axes = T,
     las = 1)
dev.off()

#   2.3-Mapa simples de distribuicao de especies ------
Hypostomus <- occ_data(scientificName="Hypostomus", hasCoordinate=TRUE)

# Seleciona apenas coordenadas geográficas
Hypostomus <- Hypostomus$data[, c("scientificName","decimalLongitude", "decimalLatitude")]

# Quantas linhas e colunas?
dim(Hypostomus)

# Quantos registros por spp?
table(Hypostomus$scientificName)

# Filtrando as spp - retorna os nomes únicos
(unique(Hypostomus$scientificName))

# Uma das colunas com especies tem um nome que nao existe. "BOLD:AAB9690"
# Provavelmente eh uma amostra de tecido (DNA) ou algum erro
# Vamos elimina-la? Como poderiamos fazer isso?

hypo <- Hypostomus[Hypostomus$scientificName != "BOLD:AAB9690", ]

#busca os pontos problemáticos conforme os parâmetros definidos - pode demorar um pouquinho!
limpaCoordenadas  <-  CoordinateCleaner::clean_coordinates(
  x = hypo, 
  species = "scientificName",
  lon = "decimalLongitude", 
  lat = "decimalLatitude",
  tests = c("duplicates", #duplicatas
            "equal", #coordenadas iguais
            "seas", #pontos no mar
            "zeros" #zeros e pontos em que lat = lon 
  )
)

#resultado da marcação de pontos problemáticos
limpaCoordenadas %>% head

summary(limpaCoordenadas)

# para excluir os pontos marcados como problemáticos
# TRUE = coordenadas limpas
# FALSE = coordenadas potencialmente problemáticas
hypo_limpo <- hypo %>% dplyr::filter(limpaCoordenadas$.summary==TRUE)
hypo_limpo

# compara os dados de ocorrência por spp (antes, durante e depois do tratamento)
table(Hypostomus$scientificName)

table(hypo$scientificName)

table(Hypostomus$scientificName)

# Exportar os dados de ocorrencia processados

# ordena a planilha a partir do nome das spp
geodataHypostomus <- hypo_limpo %>% dplyr::arrange(desc(scientificName))

# exporta a planilha em .csv
write.csv(geodataHypostomus, "geodataHypostomus.csv")

# Prepara os dados para gerar o MAPA

# define os limites para o mapa
xlim = range(geodataHypostomus$decimalLongitude, na.rm=TRUE) + c(-6,6)
ylim = range(geodataHypostomus$decimalLatitude, na.rm=TRUE) + c(-6,6)

# Filtro contendo as coordenadas geográficas de cada sp
table(geodataHypostomus$scientificName)
ancistroides <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus ancistroides (Ihering, 1911)", c("decimalLongitude", "decimalLatitude")]
boulengeri <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus boulengeri (Eigenmann & Kennedy, 1903)", c("decimalLongitude", "decimalLatitude")]
commersoni <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus commersoni Valenciennes, 1836", c("decimalLongitude", "decimalLatitude")]
hondae <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus hondae (Regan, 1912)", c("decimalLongitude", "decimalLatitude")]
myersi <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus myersi (Gosline, 1947)", c("decimalLongitude", "decimalLatitude")]
niceforoi <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus niceforoi (Fowler, 1943)", c("decimalLongitude", "decimalLatitude")]
plecostomus <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus plecostomus (Linnaeus, 1758)", c("decimalLongitude", "decimalLatitude")]
spiniger <- geodataHypostomus[geodataHypostomus$scientificName=="Hypostomus spiniger (Hensel, 1870)", c("decimalLongitude", "decimalLatitude")]


#nomes das spp personalizados para a legenda - nomes científicos em itálico
nomeSpp_legenda <- c(expression(paste(italic("Hypostomus ancistroides"))),
                   expression(paste(italic("Hypostomus boulengeri"))),
                   expression(paste(italic("Hypostomus commersoni"))),
                   expression(paste(italic("Hypostomus hondae"))),
                   expression(paste(italic("Hypostomus myersi"))),
                   expression(paste(italic("Hypostomus niceforoi"))),
                   expression(paste(italic("Hypostomus plecostomus"))),
                   expression(paste(italic("Hypostomus spiniger")))
)

# cria uma paleta de cores para representar cada sp
# ColorBrewer https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3

paletaCustomizada <- c("#9e0142",
                       "#d53e4f",
                       "#f46d43",
                       "#fdae61",
                       "#e6f598",
                       "#66c2a5",
                       "#3288bd",
                       "#5e4fa2")
# Plota o mapa

# plota as camadas
windows(8,8) #windows
X11(8,8) #linux
quartz(8,8) #mac
map("world", "Brazil", fill=T, col="grey90", xlim = xlim, ylim = ylim)
map(,,add=T,xlim=xlim, ylim=ylim)

#plota o conjunto de pontos por espécie
points(ancistroides, pch=19, cex=1, col=paletaCustomizada[1])
points(boulengeri, pch=19, cex=1, col=paletaCustomizada[2])
points(commersoni, pch=19, cex=1, col=paletaCustomizada[3])
points(hondae, pch=19, cex=1, col=paletaCustomizada[4])
points(myersi, pch=19, cex=1, col=paletaCustomizada[5])
points(niceforoi, pch=19, cex=1, col=paletaCustomizada[6])
points(plecostomus, pch=19, cex=1, col=paletaCustomizada[7])
points(spiniger, pch=19, cex=1, col=paletaCustomizada[8])

#plota alguns elementos de mapa
abline(h=0, lwd=0.8, lty=2, col="gray56") #adiciona uma linha para representar a do equador (opcional)
prettymapr::addnortharrow("bottomleft", scale=0.7) #adiciona o símbolo do Norte
maps::map.scale(x=-52,y=-38, ratio=FALSE, cex=0.8) #adiciona escala; em x e y você também pode alterar a posição
map.axes() #delimita a figura

#plota a legenda
legend(x=-62, y=37, #aqui você pode alterar a posição da legenda
       legend=nomeSpp_legenda, #nomes das espécies
       col=paletaCustomizada, #cores definidas anteriormente
       pch=19,
       pt.cex=1, inset=0.05, cex=0.8, bty="n") #outros parâmetros da legenda


# Caso queira evitar sobreposição de pontos, você pode plotar a distribuição das
# espécies separadamente usando o código abaixo

listaSpp = list(ancistroides=ancistroides,
                boulengeri=boulengeri,
                commersoni=commersoni,
                hondae=hondae,
                myersi=myersi,
                niceforoi=niceforoi,
                plecostomus=plecostomus,
                spiniger=spiniger)

#define alguns parâmetros gráficos (linhas, colunas, margem)
windows(8,8) #windows
X11(8,8) #linux
quartz(8,8) #mac
par(mfrow=c(2,4), mar=c(0,0,0,0))

#plota os mapas de cada sp dentro de um loop
for(i in 1:length(listaSpp)){
  map("world", "Brazil", fill=T, col="grey90", xlim=xlim, ylim=ylim)
  title(nomeSpp_legenda[i], line=1) #optei por não plotar a legenda e sim o nome das spp no título de cada plot
  map(,,add=T,xlim=xlim, ylim=ylim)
  points(listaSpp[[i]], pch=19, cex=1, col=paletaCustomizada[i])
  abline(h=0, lwd=0.8, lty=2, col="gray56")
  prettymapr::addnortharrow("bottomleft", scale=0.5) #altere os argumentos que envolvem posição e tamanho conforme sua necessidade
  maps::map.scale(x=-43,y=-25, ratio=FALSE, cex=0.6)
  map.axes()
}


#   2.3-America do Sul: altitude ------

# Aqui nos vamos utilizar funcoes do pacote "raster" para baixarmos dados de altitude
# diretamente da base dados do WorldClim https://www.worldclim.org

# Baixa raster de altitude do WorldClim
altitude2.5 <- raster::getData("worldclim", var = "alt", res = 2.5)

# Recorta o raster para os limites da America do Sul
ext <- raster::extent(-90, -35, -60, 15)
altitude.crop <- raster::crop(altitude2.5, ext)

# Baixa mapa político do Brasil do
# Database of Global Administrative Areas - GADM (https://gadm.org)
brasil <- raster::getData("GADM", country = "BRA", level = 1)

# Faz mapa de altitude
plot(altitude.crop, las = 1)

# Adiciona limites dos países da América do Sul
plot(wrld_simpl, add = TRUE, border = "dark grey")

# Adiciona limites dos estados do Brasil
plot(brasil, lwd = 0.2, border = "dark grey", add = T)

dev.off()

#   3.0-Polígonos dos Biomas Brasileiros (IBGE) ------

# Arquivos vetoriais (shapefiles) do Mapa de Biomas do Brasil podem ser baixados
# do sítio do IBGE (https://www.ibge.gov.br/geociencias/downloads-geociencias.html).

#   3.1-Baixando arquivos vetoriais e criando o mapa ------

# Baixa arquivo vetorial (notem como quebrar uma url longa!)
urlRemote <- "http://geoftp.ibge.gov.br/"
pathRemote <- "informacoes_ambientais/estudos_ambientais/biomas/vetores/"
fileName <- "Biomas_250mil.zip"

url <- paste0(urlRemote, pathRemote, fileName)
file <- basename(url)
download.file(url, file)

# Descomprime arquivo zip em nova pasta (criada agora "Biomas_250mil")
biomas.unzip <- unzip("Biomas_250mil.zip", exdir = "Biomas_250mil")
biomas.unzip

# Agora vamos carregar o arquivo vetorial
biomas <- rgdal::readOGR("Biomas_250mil/lm_bioma_250.shp", verbose = F)

biomas@data

# Salva poligono do Cerrado
cerrado <- subset(biomas, Bioma == "Cerrado")

# Plota mapa de altitude e adiciona poligono do Cerrado
windows(8,8) #windows
quartz(8,8) #mac
X11(8,8) #linux

plot(altitude.crop,
     col = colorspace::diverge_hcl(1024,
                                   h = c(110, 30),
                                   c = 130,
                                   l = c(30, 90),
                                   power = 1,
                                   fixup = TRUE,
                                   alpha = 1),
     legend.args = list(text = "Altitude (m)",
                        cex = 1,
                        line = 1,
                        adj = 0),
     axes = F,
     box = F,
     las = 1)
plot(cerrado,
     col = rgb(1, 0, 0, alpha = 0.2),
     lwd = 0.4,
     add = T)

dev.off()

