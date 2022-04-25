
############################################################################################################
#                                                                                                          #
#                                   MACHINE LEARNING - Fuzzi C-means                                       #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("factoextra")
#install.packages("e1071")
#install.packages("RColorBrewer")
library(factoextra)
library(e1071)
library(RColorBrewer)

# Gera o cluster fuzzy
cluster = cmeans(iris[,1:4], centers=3)
cluster$membership

# Visualizar membeship com heatmap
heatmap(cluster$membership, Colv = NA, Rowv = NA, col =  brewer.pal(n = 9, name = "YlOrRd"))

# Matriz de Confusão
table(iris$Species, cluster$cluster)

# Visualização com factoextra
g = fviz_cluster(list(data = iris[,1:4], cluster=cluster$cluster), ellipse.type = "norm", ggtheme = theme_bw(),
                 main="Cluster")
plot(g)
