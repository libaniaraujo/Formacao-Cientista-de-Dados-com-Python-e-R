
################################################# REGRESSÃO LOGISTICA ################################################

getwd() # Verificar a pasta atual
setwd("C:/Users/Libania/Documents/0_Ciencia_de_Dados/Formação Cientista de Dados com R e Python/R/Dados") # Mudar a pasta

# Carregar dados
eleicao = read.csv("Eleicao.csv", sep=';', header=T)
eleicao

# Grafico e visualizacao
plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)

# Correlacao
cor(eleicao$DESPESAS, eleicao$SITUACAO)

# Modelo de Regressao Logistica
modelo = glm(SITUACAO ~ DESPESAS, family = "binomial", data = eleicao)
summary(modelo)

# Modelo comparado aos dados
# Executar com ctrl+shift+enter para aparecer os dois graficos de uma so vez
plot(eleicao$DESPESAS, eleicao$SITUACAO, col='red', pch=20)
points(eleicao$DESPESAS, modelo$fitted, pch=4)

# Testar o modelo com os proprios candidatos
prever = predict(modelo, newdata=eleicao, type="response")
prever = prever>=0.5
prever

# Avaliar performance
confusao = table(prever, eleicao$SITUACAO)
confusao
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto

# Novos candidatos
prevereleicao = read.csv("Novoscandidatos.csv", sep=";", header=T)
prevereleicao

# Previsao
prevereleicao$RESULT = predict(modelo, newdata=prevereleicao, type="response")
prevereleicao$RESULT
prevereleicao$RESULT >= 0.5
