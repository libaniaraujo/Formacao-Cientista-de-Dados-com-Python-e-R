
################################################# REGRESSÃO LINEAR #####################################################

getwd() # Verificar a pasta atual
setwd("C:/Users/Libania/Documents/0_Ciencia_de_Dados/Formação Cientista de Dados com R e Python/R/Dados") # Mudar a pasta

install.packages("corrgram")
library(corrgram)

# REGRESSAO LINEAR

# Cars: mostra a velocidade e distância de parada. 
cars
dim(cars)

# correlacao entre distancia e velocidade de parada
cor(cars)
corrgram(cars, order=TRUE, lower.panel=panel.shade, upper.panel=panel.pie, text.panel=panel.txt, main="Carros")

# Geramos o modelo usando a funcao lm
# Queremos prever a velocidade que o carro estava baseado na distancia de parada
# Interceptacao e inclinacao o quanto a variavel dependente aumenta com a variavel independente

modelo = lm (speed ~ dist, data = cars)
modelo

# Visualizacao da relacao entre variaveis e linha de melhor ajuste

plot(speed ~ dist, data = cars, ylab = "Velocidade", xlab = "Distancia", main = "Carros")
abline(modelo)

# Podemos fazer uma previsao usando diretamente os coeficientes
# Qual a velocidade se levou 22 para parar?

# Manualmente
modelo$coefficents
modelo$coefficients[1] + modelo$coefficients[2] * 22

# Usando o predict
predict(modelo, data.frame(dist = 22))

# Analisando o melhor modelo

summary(modelo)
modelo$coefficients]
modelo$residuals
hist(modelo$residuals)
modelo$fitted.values
plot(modelo$fitted.values, cars$dist)



# REGRESSAO LINEAR MULTIPLA

mtcars
dim(mtcars)

# Correlacao
cor(mtcars[1:11])
corrgram(mtcars[1:11], order=TRUE, lower.panel=panel.shade, upper.panel=panel.pie, text.panel=panel.txt, main="Carros")

# Analisamos cilidradas versus consumo
plot(mtcars$mpg ~ mtcars$disp, ylab = "Consumo", xlab = "Cilindradas", main="Carros")

# Modelo usando cilindradas para prever o consumo
modelo = lm(mpg ~ disp, data = mtcars)
modelo

# Coeficiente de determinacao
# R2 ajustado
summary(modelo)$r.squared
summary(modelo)$adj.r.squared
# 71% da variavel dependente é explicada pela variavel independente

# Grafico com linha do modelo
plot(mtcars$mpg ~ mtcars$disp, ylab = "Consumo", xlab = "Cilindradas", main="Carros")
abline(modelo)

# Prevendo consumo com 200 cilindradas
predict(modelo, data.frame(disp=200))

# Adicionamos mais duas variaveis independentes, hp e cilindros
modelo = lm(mpg ~ disp + hp + cyl, data = mtcars)
modelo

# R2 ajustado
# Coeficiente de determinacao (71% da variavel dependente é explicada pela ariavel explanatoria
summary(modelo)$r.squared
summary(modelo)$adj.r.squared

# Prevendo consumo com 200 cilindradas, 100 hp e 4 cilindros
predict(modelo, data.frame(disp=200, hp=100, cyl=4))

