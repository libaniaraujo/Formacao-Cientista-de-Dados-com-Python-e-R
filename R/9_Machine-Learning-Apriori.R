
############################################################################################################
#                                                                                                          #
#                                     MACHINE LEARNING - Apriori                                           #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)

# Importa as transações
transacoes = read.transactions("transacoes.txt",format="basket",sep=",")
transacoes 
inspect(transacoes)
image(transacoes)

# Minerar
regras = apriori(transacoes, parameter= list(supp=0.5, conf=0.5, minlen=2))
regras
summary(regras)
inspect(regras) 

# Visualização
plot(regras, method="graph", control=list(type="items"))
plot(regras, method="matrix", control=list(type="items"))
plot(regras, method="matrix3D")

# Salvar as regras em disco
write.csv(DATAFRAME(regras),"regras.csv")

