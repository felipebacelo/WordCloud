# Exemplo de Wordcloud em R #

# Carregando o Arquivo:
texto<-readLines("~/LetraCartola.txt")

# Instalando os Pacotes:
install.packages(c("tm"))
install.packages(c("wordcloud"))

# Carregando os Pacotes:
library(tm)
library(wordcloud)

# Utilizando Corpus para Traduzir o Texto em Linguagem Natural:
doc<-Corpus(VectorSource(texto))


# Transformando em Minúsculas:
doc<-tm_map(doc, content_transformer(tolower))
# Removendo Números:
doc<-tm_map(doc, removeNumbers)
# Removendo Pontuações:
doc<-tm_map(doc, removePunctuation)
# Removendo Espaços em Branco:
doc<-tm_map(doc, stripWhitespace)
# Removendo Stopwords em PT:
doc<-tm_map(doc, removeWords, stopwords("pt"))


# Criando uma Matriz de Frequência:
matriz<-TermDocumentMatrix(doc)
m<-as.matrix(matriz)
m

# Organizando a Matriz em Ordem Decrescente:
x<-sort(rowSums(m), decreasing = TRUE)
x

# Transformando a Matriz em Data Frame:
df<-data.frame(word=names(x),freq=x)
df

# Wordcloud com Frequência Mínima de Resultados e Número Máximo de Palavras:
wordcloud(words=df$word, freq=df$freq, min.freq = 2,max.words=30, colors = c("magenta", "darkgreen")) 
