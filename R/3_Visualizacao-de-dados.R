
########################################### VISUALIZACAO DE DADOS #####################################################

getwd() # Verificar a pasta atual
setwd("C:/Users/Libania/Documents/0_Ciencia_de_Dados/Formação Cientista de Dados com R e Python/R/Dados") # Mudar a pasta

# GRAFICOS BASICOS

## Histograma
hist(trees$Height)
hist(trees$Height, main="Arvores", ylab="Frequencia", xlab="Altura", col="blue")
hist(trees$Height, main="Arvores", ylab="Frequencia", xlab="Altura", col="blue", density=20, breaks=20)

## Densidade
densidade = density(trees$Height)
plot(densidade)

## Densidade sobre histograma, parametro par
hist(trees$Height, main=NULL, xlab=NULL)
par(new=TRUE)
plot(densidade)

## Dispersão
plot(trees$Girth, trees$Volume)
plot(trees$Girth, trees$Volume, main="Arvores")
plot(trees$Girth, trees$Volume, ylab="Circuferencia", xlab="Volume", col="blue", main="Arvores")
# pch muda o elemento grafico
plot(trees$Girth, trees$Volume, ylab="Circuferencia", xlab="Volume", col="blue", main="Arvores", pch=20)

## Muda tipo
plot(trees$Girth, trees$Volume, ylab="Circuferencia", xlab="Volume", col="blue", main="Arvores", pch=20, type="l")

## Tremulacao, diminui sobre posicao
plot(jitter(trees$Girth), trees$Volume, ylab="Circuferencia", xlab="Volume", col="blue", main="Arvores")

## Legenda com dimensao categorica
plot(CO2$conc, CO2$uptake, pch=20, col = CO2$Treatment)
legend("bottomright", legend=c("nonchilled", "chilled"), cex=1, fill=c("black","red"))

## Novos dados
plot(trees)

## Divisao da tela
## Executar com Ctrl+Shift+Enter
split.screen(fig=c(2,2))
screen(1)
plot(trees$Girth, trees$Volume)
screen(2)
plot(trees$Girth, trees$Height)
screen(3)
plot(trees$Height, trees$Volume)
screen(4)
hist(trees$Volume)
close.screen(all=TRUE)

## Boxplot
boxplot(trees$Volume, main="Arvores", xlab="Volume")
boxplot(trees$Volume, main="Arvores", xlab="Volume", col="blue", horizontal=TRUE)
boxplot(trees$Volume, main="Arvores", xlab="Volume", col="blue", outline=F)
## notch
boxplot(trees$Height, main="Arvores", xlab="Altura", col="blue", notch=TRUE)
## Dados do grafico
boxplot.stats(trees$Height)
## Le apenas uma informacao
boxplot.stats(trees$Height)$stats

## Varios graficos
boxplot(trees)

## Agregacao
InsectSprays
spray=aggregate(. ~ spray, data = InsectSprays, sum)
spray

## Grafico de Barras
barplot(spray$count, col = gray.colors(6), xlab="Spray", ylab="Total", names.arg=spray$spray)
box()

## Grafico de Setor (Pizza)
pie(spray$count, labels = spray$spray, main = "Spray", col = c(1:6))
## Com legenda
pie(spray$count, labels = spray$spray, main = "Spray", col = c(1:6))
legend("bottomright", legend=spray$spray, cex=1, fill=c(1:6))



# TABELAS

install.packages("stargazer")
library("stargazer")

## Formato Latex
stargazer(iris)

## Formato html
stargazer(iris, type="html")

## Formato texto
stargazer(iris, type="text")

## Salva em disco
stargazer(women, out="women.tex", summary=FALSE)



# PACOTE LATTICE

## Nao precisa instalar, apenas carregar
library(lattice)

## Boxplot
bwplot(trees$Volume)
bwplot(trees$Volume, main="Arvores", xlab="Volume")

## Histograma
histogram(trees$Volume, main="Arvores", xlab="Volume", aspect=2, type="percent", nint=5)

## Histograma Condicional
## Peso das galinhas de acordo com a alimentacao
chickwts
## Histograma
hist(chickwts$weight)
## Agregamos dados
aggregate(chickwts$weight, by=list(chickwts$feed), FUN=sum)
## Histograma condicional
histogram(~weight | feed, data=chickwts)

## Grafico de dispersao condicional
### CO2
CO2
xyplot(CO2$conc ~ CO2$uptake)
# type e a origem
xyplot(CO2$conc ~ CO2$uptake | CO2$Type)
# Refrigerado ou nao
xyplot(CO2$conc ~ CO2$uptake | CO2$Treatment)
### Cancer de esofago
esoph
dotplot(esoph$alcgp ~ esoph$ncontrols, data=esoph)
dotplot(esoph$alcgp ~ esoph$ncontrols | esoph$tobgp)

## Matriz de dispersao
splom(~CO2[4:5] | CO2$Type, CO2)

## Densidade condicional
densityplot(~CO2$conc | CO2$Treatment, plot.points=FALSE)
densityplot(~CO2$conc)
densityplot(~CO2$conc | CO2$Treatment)
densityplot(~CO2$conc | CO2$Treatment, plot.points=FALSE)

## Grafico 3D
### Spray para repelir abelhas
OrchardSprays
cloud(decrease ~ rowpos * colpos, data=OrchardSprays)
cloud(decrease ~ rowpos * colpos, data=OrchardSprays)

## Level plot
# Circunferência, largura e volume de arvores
trees
levelplot(Girth ~ Height * Volume, data=trees)

