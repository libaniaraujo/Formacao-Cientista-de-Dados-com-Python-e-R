
############################################################################################################
#                                                                                                          #
#                                MACHINE LEARNING - �rvores de Decis�o para Classifica��o                  #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages('rpart',dependencies=T)
library(rpart)

# Carrega dados de credito e separa em treino e teste
credito = read.csv("Credit.csv")
credito
amostra = sample(2,1000,replace=T, prob=c(0.7,0.3))
creditotreino = credito[amostra==1,]
creditoteste = credito[amostra==2,]

# Cria modelo, m�todo para classifica��o
arvore = rpart(class ~ ., data=creditotreino,  method="class") 
# O . significa que todos as demais vari�veis do banco de dados ser�o utilizadas como vari�veis explicativas
print(arvore)

# Impress�o da �rvore
plot(arvore)
text(arvore, use.n=TRUE, all=TRUE, cex=.8)

# Previsao
teste = predict(arvore, newdata=creditoteste)
head(teste)

# Adiciona a coluna teste a creditoteste
cred = cbind(creditoteste,teste)
cred

# Cria coluna com resultado categ�rico
cred['Result'] = ifelse(cred$bad>=0.5,"bad","good")
cred

# Matriz de Confus�o
confusao = table(cred$class,cred$Result)
confusao
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto



