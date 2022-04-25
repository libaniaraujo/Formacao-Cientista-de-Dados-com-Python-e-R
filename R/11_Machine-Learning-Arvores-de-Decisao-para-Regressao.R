
############################################################################################################
#                                                                                                          #
#                                          MACHINE LEARNING - Árvores de Decisão para Regressão            #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("rpart")
install.packages("forecast")
library(rpart)
library(forecast)

# Conjunto de Dados
iris

# Criamos o modelo prevendo Sepal.Length
modelo = rpart(Sepal.Length ~ Sepal.Width + Petal.Length +  Species ,data=iris)
modelo
summary(modelo)

# Visualização
plot(modelo)
text(modelo)

# Previsão
predicao = predict(modelo, iris)
head(predicao)

# Comparamos previsão com dados reais
comparacao = cbind(predicao,iris$Sepal.Length,predicao - iris$Sepal.Length )
head(comparacao)

# Verificamos métricas de erro de nosso modelo
accuracy(predicao,iris$Sepal.Length)
