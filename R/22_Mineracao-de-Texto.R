
############################################################################################################
#                                                                                                          #
#                                            MINERA��O DE TEXTO                                            #
#                                                                                                          #
############################################################################################################

getwd() # Verificar a pasta atual
#setwd("NOME DA PASTA") # Mudar a pasta

# INSTALAR PACOTES NECESS�RIOS
install.packages("tm")
install.packages("textreadr")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(tm)
library(textreadr)
library(wordcloud)
library(RColorBrewer)

# Criamos corpus

#fontes dispon�veis
getSources()
#formatos
getReaders()
#criar corpus   PCorpus(): fisico, VCorpus: vol�til em mem�ria
#pegamos dados da wikipedia
x = read_html("https://en.wikipedia.org/wiki/Artificial_intelligence" )
#geramos um corpus
corpus = VCorpus(VectorSource(x),readerControl = list(reader=readPlain,language = "eng"))

# Explorando Corpus

#resumo do corpus
inspect(corpus) 
#corpus de 1 a 100
inspect(corpus[1:100])  
#metadados do corpus 1
meta(corpus[[1]])  
#visualizar 1 corpus
inspect(corpus[[2]])  
#texto separado por linhas
as.character(corpus[[2]]) 
#s� uma linha
as.character(corpus[[200]])[1]

# Tratamentos diversos

#tm_map para executar transforma��es
stopwords("portuguese")
#remove
corpus = tm_map(corpus, removeWords, stopwords("english"))
#excesso de espa�os em branco
corpus = tm_map(corpus , stripWhitespace)
#pontua��o
corpus  = tm_map(corpus , removePunctuation)
#numeros
corpus  = tm_map(corpus , removeNumbers)

# Primeiro Wordcloud
wordcloud(corpus,max.words=50,random.order=T,colors=rainbow(8),rot.per=0.5,use.r.layout=T)

# Matriz de termos frequ�ntes

#matriz de palavras frequentes
#TermDocumentMatrix  termos na linha
#DocumentTermMatrix  documentos na linha
freq = TermDocumentMatrix(corpus)
freq
#tranformao em matrix do R
matriz = as.matrix(freq)
#ordeno de acordo com frequencia
matriz = sort(rowSums(matriz),decreasing=TRUE)
#data frame
matriz = data.frame(word=names(matriz), freq=matriz)
head(matriz, n=100)
#encontra termos mais frequentes
findFreqTerms(freq,500,Inf)
#remove infrequentes
removeSparseTerms(freq, 0.4)

# Nova Nuvem
wordcloud(matriz$word,matriz$freq,max.words=50,random.order=T,colors=rainbow(8),rot.per=0.5,use.r.layout=T)

