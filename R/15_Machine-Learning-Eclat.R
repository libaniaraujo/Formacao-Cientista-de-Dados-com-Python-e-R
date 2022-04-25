
############################################################################################################
#                                                                                                          #
#                                     MACHINE LEARNING - Eclat                                             #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
#install.packages("arules")
#install.packages("arulesViz")
library(arules)
library("arulesViz")

# Transa��es
transacoes <-read.transactions("transacoes.txt",format="basket",sep=",")
image(transacoes)

# Gera as regras
regras = eclat(transacoes, parameter = list(minlen=2))
inspect(regras)

# Visualiza��o
plot(regras, method="graph", control=list(type="items"))