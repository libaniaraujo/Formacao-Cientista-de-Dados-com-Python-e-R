
########################################### ESTATISTICA #####################################################

getwd() # Verificar a pasta atual
setwd("C:/Users/Libania/Documents/0_Ciencia_de_Dados/Formação Cientista de Dados com R e Python/R/Dados") # Mudar a pasta

# AMOSTRAGEM

## Amostragem Simples

# 150 amostras, de zero e 1, com reposição, prob. equivalentes
amostra = sample(c(0,1), 150, replace = TRUE, prob=c(0.5,0.5))
amostra
summary(as.factor(amostra))

# 150 amostras, de zero e 1, com reposição, mais chances para zero
amostra = sample(c(0,1), 150, replace = TRUE, prob=c(0.7,0.3))
amostra
summary(as.factor(amostra))

# 150 amostras, de 1 a 1000, sem reposição, prob. equivalentes
amostra = sample(c(1:1000), 150, replace = FALSE)
amostra

# Gerado amostra de conjuntos de dados
# 30% dos dados de iris
amostra = sample(c(0,1), 150, replace = TRUE, prob=c(0.7,0.3))
summary(as.factor(amostra))
# Gera a amostra
amostrairis = iris[amostra==1,]
amostrairis
dim(amostrairis)

# Repetir experimento
set.seed(2345)
sample(c(1000), 1)
# Repetindo
set.seed(2345)
sample(c(1000), 1)

## Amostragem Sistemática

install.packages("TeachingSampling")
library("TeachingSampling")

# Amostra sistematica de tamanha 150, 10 grupos
amostra = S.SY(150, 10)
amostra

# Tamanho
dim(amostra)

# Usamos em iris
amostrairis = iris[amostra,]

# Tamanho
dim(amostrairis)



## Amostragem Estratificada

install.packages("sampling")
library("sampling")

# Proporção
propocao = 25
# Srswor amostra simples sem reposição, srswr com reposição, poisson, systematic
# a ordem de size é que está no conjunto de dados
amostrairis2=strata(data=iris,
                    stratanames=c("Species"),size=c(rep( propocao,3)), method="srswor")
# Resultado
summary(amostrairis2)

# Dados de infertilidade
infert
summary(infert)

# Amostragem por estratos de education
amostra=strata(data=infert,
               stratanames=c("education"),size=c(5,48,47), method="srswor")
Resultado
amostra
summary(amostra)



# MEDIDAS DE CENTRALIDADE E VARIABILIDADE

jogadores <- c(40000, 18000, 12000, 250000, 30000, 40000, 800000)

## Media
mean(jogadores)

## Mediana
median(jogadores)

## Quartis
quartis = quantile(jogadores)
quartis
### 3º quartil
quartis[2]

## Devio padrao
sd(jogadores)

## Resumo
summary(jogadores)



# TEOREMA CENTRAL DO LIMITE

# omitir warnings
options(warn=-1)
install.packages("semTools")
library(semTools)

# Inicializa um vetor 
z = rep(0,500)

# Gera as amostras
for (i in 1:500) {
  m = mvrnonnorm(1000, c(1, 2), matrix(c(10, 2, 2, 5), 2, 2),
                 skewness = c(5, 2), kurtosis = c(3, 3))
  #grava a média da amostra
  z[i] =mean(m)
  
  #imprime as 3 primeiras
  if (i<4){
    
    hist(m,breaks=50, main= paste0("Histrograma ", i ))
  }
}

# Imprime a distribuição da média das amostras
hist(z)



# TESTES DE NORMALIDADE

set.seed(123)
x = rnorm(1000)

## Grafico QQ
qqnorm(x)
qqline(x)

## Teste de Shapiro
## Hipotese Nula: Os dados seguem uma distribuicao normal.
## ?? = 0.05
## Valor de p ??? ??: Os dados nao seguem uma distribuição normal (Rejeita a hipotese nula)
## Valor de p > ??: Não e possivel concluir que os dados não seguem uma distribuição normal (Nao deve rejeitar a hipotese nula)
shapiro.test(x)

## Histograma com linha de densidade
hist(x, main='')
par(new=TRUE)
plot(density(x), ylab="", xlab="", axes=F, lwd=2.5)

## Dados nao normalmente distribuidos
install.packages("semTools")
library(semTools)
m = mvrnonnorm(1000, c(1,2), matrix(c(10,2,2,5),2,2),
              skewness = c(5,2), kurtosis = c(3,3))
qqnorm(m)
qqline(m)
shapiro.test(m)
hist(m, main="")
par(new=TRUE)
plot(density(m), ylab="", xlab="", axes=F, lwd=2.5)



# MEDIAS A LONGO PRAZO

# Pequenas e grandes amostras
# Espera-se uma amostra de 3.5
# Amostra pequena
x = sample(1:6, 6, replace=T)
mean(x)
x = sample(1:6, 10000, replace=T)
mean(x)



# DISTRIBUICAO T DE STUDENT

# Salario de cientistas 75 por hora. Amostra = 9. Desvio Padrao = 10. 

# Qual a probabilidade de ser menor que 80?
# t=1.5 graus de liberdade
pt(1.5, 8)

# Qual a probabilidade de ser maior que 80?
1 - pt(1.5, 8)

# Somando as 2 caudas?
pt(1.5, 8) + pt(1.5, 8, lower.tail=F)



# DISTRIBUICAO BINOMIAL

# x = Eventos ; prob = probabilidades, size = Eventos

# Se jogar uma moeda 5 vezes, qual a probabilidade de dar cara 3 vezes?
dbinom(x=3,size=5,prob=0.5)

# Se eu passar 4 sinais de 4 tempos cada, qual a probabilidade de eu pegar 0,1,2,3 e 4 sinais verdes?
pbinom(q=4, size=4, prob=0.25)

# Se você fizer a prova de um concurso com 12 questões, "chutando" todas as questões, qual a probabilidade de acertar 7 questoes? (4 alternativas cada questao)
dbinom(x=7, size=12, prob=0.25)

# Se eu passar em um sinal de 4 tempos cada, qual a probabilidade de eu pegar 3 ou mais sinais verdes?
pbinom(q=2, size=4, prob=0.25, lower.tail=F)
dbinom(x=3, size=4, prob=0.25) + dbinom(x=4, size=4, prob=0.25)



# DISTRIBUICAO DE POISSON

# dpois = probabilidade pontual
# ppois = cumulativa
# lower.tail False = maior que, cauda 2 da distribuição

# O numero de acidentes em um dia é igual a 2, qual a probabilidade de ocorrerem 3 em um dia?
dpois(3, lambda=2)

# O numero de acidentes em um dia é igual a 2, qual a probabilidade de ocorrerem 3 ou menos em um dia?
ppois(3, lambda=2)

# O numero de acidentes em um dia é igual a 2, qual a probabilidade de ocorrerem menos do que 3 em um dia?
ppois(2, lambda=2)
dpois(0, lambda=2) + dpois(1, lambda=2) + dpois(2, lambda=2)

# O numero de acidentes em um dia é igual a 2, qual a probabilidade de ocorrerem mais do que 3 em um dia?
ppois(3, lambda=2, lower.tail=F)
1 - ppois(3, lambda=2)



# QUI-QUADRADO

# Criamos o conjunto de dados para teste

novela = matrix(c(19,6,43,32), nrow=2, byrow=T)
rownames(novela) = c("Masculino", "Feminino")
colnames(novela) = c("Assiste", "NaoAssiste")
novela

# Executar o Qui-Quadrado
# Se o valor de p for maior que 0.05 não há evidências de diferença significativa (hipotese nula)
chisq.test(novela)

# Alteramos a proporcao de homens que assiste e não assiste novelas
# Executamos o teste novamente , agora o valor de p é menor que 0,05

novela = matrix(c(22,3,43,32), nrow=2, byrow=T)
rownames(novela) = c("Masculino", "Feminino")
colnames(novela) = c("Assiste", "NaoAssiste")
novela

chisq.test(novela)



# ANOVA

# Carregar dados
tratamento = read.csv("Dados/anova.csv", sep=";")
tratamento

# Visualizamos a distribuicao dos remedios por hora
boxplot(tratamento$Horas ~ tratamento$Remedio)

# Executamos a analise de variancia
# Observar valor de p maior que 0,05 (Pr(>F))
# Hipotese nula de que nao ha diferenca significativa
an = aov(Horas ~ Remedio, data = tratamento)
summary(an)

# Anova de dois fatores
an = aov(Horas ~ Remedio * Sexo, data = tratamento)
summary(an)

# Se houver diverença o teste de Tuckey é executado
tukey = TukeyHSD(an)
tukey

# Graficos do teste
plot(tukey)

