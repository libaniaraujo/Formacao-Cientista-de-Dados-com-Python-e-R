
############################################################################################################
#                                                                                                          #
#                                      MACHINE LEARNING - Ensamble Learning                                #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages('randomForest')
library(randomForest)
credito = read.csv('credit.csv')

#transforma classe em fator
credito$class = as.factor(credito$class)
head(credito)

# Separa dados de treino e teste
amostra = sample(2,1000,replace=T, prob=c(0.7,0.3))
creditotreino = credito[amostra==1,]
creditoteste = credito[amostra==2,]

# Gera o modelo
floresta = randomForest(class ~ .,data=creditotreino, ntree=100,importance=T)
floresta
plot(floresta)

# Previsão
previsao = predict(floresta,creditoteste)
previsao
confusao = table(previsao,creditoteste$class)
confusao

# Avaliação de Performance
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto


