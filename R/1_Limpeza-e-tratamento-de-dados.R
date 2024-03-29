
######################################## LIMPEZA E TRATAMENTO DE DADOS ################################################

getwd() # Verificar a pasta atual
setwd("C:/Users/Libania/Documents/0_Ciencia_de_Dados/Forma��o Cientista de Dados com R e Python/R/Dados") # Mudar a pasta

# EXPLORANDO OS DADOS

# Importa dados, string vazio com NA, string como fatores
dados = read.csv("Churn.csv", sep=";", na.strings="", stringsAsFactors=T)
head(dados)
summary(dados)

# Colunas

## Dar nomes corretos as colunas
colnames(dados) = c("Id", "Score", "Estado", "Genero", "Idade", "Patrimonio", "Saldo", "Produtos", "TemCartCredito",
                    "Ativo", "Salario", "Saiu")
head(dados)

# Explorar dados, colunas categoricas

## Estados
counts = table(dados$Estado)
barplot(counts, main="Estados", xlab="Estados")

## G�nero
counts = table(dados$G�nero)
barplot(counts, main="Genero", xlab="Genero")

# Explorar, colunas numericas

## Score
summary(dados$Score)
boxplot(dados$Score)
hist(dados$Score)

## Idade
summary(dados$Idade)
boxplot(dados$Idade)
hist(dados$Idade)

## Saldo
summary(dados$Saldo)
boxplot(dados$Saldo)
hist(dados$Saldo)

## Salario
summary(dados$Salario)
boxplot(dados$Salario)
hist(dados$Salario, outline=F)

# TRATAMENTO E LIMPEZA DOS DADOS

# Valores Faltantes NAs

dados[!complete.cases(dados),]

# Tratar Salarios

summary(dados$Salario)
## Ver mediana
median(dados$Salario, na.rm=T)
## Atribuir mediana a NAs
dados[is.na(dados$Salerio),]$Salario = median(dados$Sal�rio, na.rm=T)
## Buscar NAs em sal�rio para checar
dados[!complete.cases(dados$Salario),]

# Padronizar o Genero

unique(dados$Genero)
summary(dados$Genero)
## Transformar F e Fem em Feminino
## Transformar "", M em Masculino (moda)
dados[is.na(dados$Genero) | dados$Genero =="M" ,]$Genero="Masculino"
dados[dados$Genero == "F" | dados$Genero == "Fem", ]$Genero="Feminino"
## Ver resultado
summary(dados$Genero)
## Remover levels n�o utilizados
dados$Genero = factor(dados$Genero)
## Visualizar novamente
summary(dados$Genero)

# Tratar Idade

summary(dados$Idade)
## Fora do dom�nio, numerico - ver idades anormais
dados[dados$Idade<0 | dados$Idade>110 ,]$Idade
## Verificar se h� idades NAs
dados[is.na(dados$Idade),]
## Preencher as idades fora do dominio com mediana
median(dados$Idade)
## Substituicao
dados[dados$Idade<0 | dados$Idade>110 ,]$Idade = median(dados$Idade)
## Buscamos novamente idades anormais
dados[dados$Idade<0 | dados$Idade>110 ,]
summary(dados$Idade)

# Dados Duplicados

## Buscar duplicados pelo Id
x = dados[duplicated(dados$Id),]
x
## Verificamos que o Id 81 est� duplicado
## Vamos excluir pelo Id e n�o pelo indice
dados = dados[!dados$Id%in%c(x$Id),]
## Buscamos a linha que estava duplicada
dados[dados$Id == x$Id ,]
## Verificamos novamente duplicados
x = dados[duplicated(dados$Id),]
x

# Tratar Estado

## Estado fora do dom�nio - categorico
unique(dados$Estado)
summary(dados$Estado)
## Preencher com a moda - RS
dados[!dados$Estado %in% c("RS","SC","PR"),]$Estado="RS"
summary(dados$Estado)
## emovendo fatores n�o usados
dados$Estado = factor(dados$Estado)
##Visualizar novamente
summary(dados$Estado)

# Outliers

## Criando um parametro com desvio padrao
desv = sd(dados$Salario, na.rm=T)
desv
dados[dados$Salario >= 2 * desv ,]$Salario
# Outra forma, resultado semelhante, mas sem os NAs
boxplot(dados$Salario)
x = boxplot(dados$Salario)$out
x
# Atualizamos todos para mediana
median(dados$Salario)
dados[dados$Salario >= 2 * desv , ]$Salario = median(dados$Salario)
# Checamos se sairam os outliers
dados[dados$Salario >= 2 * desv , ]$Salario

