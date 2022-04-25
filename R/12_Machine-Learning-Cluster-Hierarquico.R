
############################################################################################################
#                                                                                                          #
#                                MACHINE LEARNING - Cluster Hier�rquico                                    #                                    #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# Instalar pacotes
install.packages("gridExtra", dependencies=T)
library(factoextra)

# Cria o cluster
hc = hcut(iris[,-5], k = 3, hc_method = "complete", stand=T)
hc

# Dendograma
plot(hc)

# Dendograma
g1 =   fviz_dend(hc, show_labels = FALSE, rect = TRUE, ggtheme = theme_bw(), main="Cluster Hier�rquico")
plot(g1)

# Cluster
g2 = fviz_cluster(hc, ellipse.type = "norm", ggtheme = theme_bw(),
                  main="Cluster Hier�rquico")
plot(g2)

# Compara��o
#Executar com ctrl + shift + enter
plot(g1)
plot(g2)

