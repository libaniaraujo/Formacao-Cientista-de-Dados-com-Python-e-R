
################################################### INTRODUCAO AO R ###################################################

getwd() # Verificar a pasta atual
setwd() # Mudar a pasta

# PACOTES

# Carregar pacotes
install.packages("e1071")
library("e1071")

# Descarregar pacotes
detach("packae:e1071", unload=TRUE)

# Remover pacotes
remove.packages("e1071")



# TIPOS DE DADOS E OPERADORES

delta = 8
class(delta)

delta = 8L
class(delta)

logico = TRUE
logico = T

caractere = "texto"
caractere = 'texto'

# Operacoes matematicas
c = 2
d = 4
(c + d) * d
e = (c + d) * d
e

# Testes logicos
a = 1
b = 2
a < b
a == b

# Raiz quadrada
sqrt(2500)



# ESTRUTURAS DE DADOS

# Vetores

X = c(1,2,3,4,5,6)
X
X[1]
X[1] = 10
X

# Vetores de outros tipos

Y = c("a","b","c","d")
Y
Z = c(1L,2L,3L)
Z

# Matrizes

VADeaths
colnames(VADeaths)
rownames(VADeaths)
# Só coluna 1:
VADeaths[,1]
# Só linha 1:
VADeaths[1,]
# Linhas 1 até 3:
VADeaths[1:3,]

# Data Frame

longley
# Funciona como matriz
longley[,1:3]
# Acessar coluna com $
longley$Unemployed
# ou nome
longley['Unemployed']

# Listas

ability.cov
# Acessando elementos
ability.cov$cov
ability.cov[1]
# Verificando que são objetos diferentes
class(ability.cov$cov)
class(ability.cov$center)
# Acessando elemento dentro da lista
ability.cov$cov[,1:3]

# Fatores

state.region



# FUNÇÕES

getwd()
# Sem parenteses
sd
head(x=iris, n=2)
head(iris)
head(iris,2)
head(n=22)



#AJUDA
help(sd)
?sd



# PRINCIPAIS FUNCOES

# head e tail

esoph
# default 6 linhas
head(esoph)
tail(esoph)
# 10 linhas
head(esoph, n=10)
tail(esoph, n=10)

# Dimensoes

dim(esoph)

# Comprimento

length(islands)

# Nome de colunas

colnames(esoph)

# Nome de linhas

rownames(esoph)

# Resumo

summary(esoph)

# Escolher arquivo

x = file.choose()



# IMPORTANDO DADOS

# Texto
x = read.csv(file.choice(), header=TRUE, sep=",")
x
x = read.csv("Credit.csv", header=TRUE, sep=",")
x

# Excel
dados = read.xlsx("Credit.xlsx", sheetindex=1)
dados



# ESTRUTURAS DE PROGRAMAÇÃO

# If

a = 10
b = 20
if (a < b)
  {
  print("Verdadeiro")
  }
else
  {
    print("Falso") 
    }

# Ifelse

x = ifelse(a < 10,"A é maior","A não é maior")
x

# For

for (i in 1:10) {
  print(i)
}

# While

a = 1
while(a <= 10)
{
  print(a)
  a = a+1
}

# Função

parouimpar <- function(x) {
  
  return(ifelse(x%%2==0,"Par","impar"))
  
}

parouimpar(5)
parouimpar(12)

