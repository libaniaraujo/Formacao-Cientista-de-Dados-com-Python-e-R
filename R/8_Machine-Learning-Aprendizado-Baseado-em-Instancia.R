
############################################################################################################
#                                                                                                          #
#                             MACHINE LEARNING - Aprendizado baseado em instância                          #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("class")
library(class)

# Iris
head(iris)
summary(iris)

# Dividimos em treino e classificação
amostra = sample(2,150,replace=T, prob=c(0.7,0.3))
iristreino = iris[amostra==1,]
iristeste = iris[amostra==2,]

# Visualizamos as dimensões
dim(iristreino)
dim(iristeste)

# Fazemos a classificação sem criar modelo
# Dados de treino (instâncias), dados de teste, classe real, número de vizinhos considerados
previsao = knn(iristreino[,1:4],iristeste[,1:4],iristreino[,5],k=3)
previsao

# Matriz de confusão
tabela = table(iristeste[,5],previsao)
tabela

# Avaliamos a performance
(tabela[1] + tabela[5] + tabela[9]) / sum(tabela) 

