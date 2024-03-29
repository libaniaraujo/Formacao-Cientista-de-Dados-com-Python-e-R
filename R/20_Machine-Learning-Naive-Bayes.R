
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

# Dados de Cr�dito de Banco Alem�o
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

# Dimens�es dos conjuntos
dim(creditotreino)
dim(creditoteste)

# Criamos o modelo
modelo <- naiveBayes(class ~., creditotreino)
modelo

# Previs�o
predicao <- predict(modelo, creditoteste)
predicao

# Matriz de Confus�o
confusao = table(creditoteste$class,predicao)
confusao
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaerro = (confusao[2] + confusao[3]) / sum(confusao)
taxaacerto
taxaerro
