
############################################################################################################
#                                                                                                          #
#                                    MACHINE LEARNING - Kmeans                                             #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

install.packages("factoextra")
library(factoextra)

# Conjunto de dados iris
iris

# Geramos o cluster
cluster = kmeans(iris[1:4],centers=3)
cluster
table(iris$Species,cluster$cluster)

# Gráfico
plot(iris$Sepal.Length, iris$Sepal.Width,col=cluster$cluster, pch=20, main="iris")
plot(iris[,1:4],col=cluster$cluster, main="Iris")

# Gráfico especializado
g2 = fviz_cluster(cluster, data=iris[1:4], ellipse.type = "convex", ggtheme = theme_bw(),
                  main="Cluster ")
plot(g2)

# Adiciomamos o cluster aos dados originais
iris2 = iris
iris2['grupos'] = cluster$cluster
iris2
#write.csv(iris2,"iri2.csv")