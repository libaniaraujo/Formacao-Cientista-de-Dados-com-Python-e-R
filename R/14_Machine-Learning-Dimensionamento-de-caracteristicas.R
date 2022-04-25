
############################################################################################################
#                                                                                                          #
#                             MACHINE LEARNING - Dimensionamento de Caracter�sticas                        #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

iris

# Padroniza��o
iris_padr =  scale(iris[,1:4])
iris_padr

# Fun��o para Normaliza��o
normaliza = function(x){
  return((x-min(x))/(max(x)-min(x)))
}

# Aplica normaliza��o
iris_norm = normaliza(iris[,1:4])
iris_norm

# Compara os dois modelos
#Executar com ctrl + shift + Enter
boxplot(iris[,1:4],main="Dados Originais")
boxplot(iris_padr, main="Padronizados")
boxplot(iris_norm, main="Normalizados")