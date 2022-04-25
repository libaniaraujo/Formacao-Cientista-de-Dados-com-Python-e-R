
############################################################################################################
#                                                                                                          #
#                                       MACHINE LEARNING - Naive Bayes                                     #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("e1071")
library(e1071)

# Dados de Crédito de Banco Alemão
credito = read.csv("Credit.csv")
head(credito)
dim(credito)

# Transformamos a classe em fator
credito$class = as.factor(credito$class)

# Separamos dados de treino e teste
amostra = sample(2,1000,replace=T, prob=c(0.7,0.3))
amostra
creditotreino = credito[amostra==1,]
creditoteste = credito[amostra==2,]

# Dimensões dos conjuntos
dim(creditotreino)
dim(creditoteste)

# Criamos o modelo
modelo <- naiveBayes(class ~., creditotreino)
modelo

# Previsão
predicao <- predict(modelo, creditoteste)
predicao

# Matriz de Confusão
confusao = table(creditoteste$class,predicao)
confusao
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaerro = (confusao[2] + confusao[3]) / sum(confusao)
taxaacerto
taxaerro
