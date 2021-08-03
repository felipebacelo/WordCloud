<p align="center">
<a href= "https://img.shields.io/github/repo-size/felipebacelo/WordCloud?style=for-the-badge"><img src="https://img.shields.io/github/repo-size/felipebacelo/WordCloud?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/languages/count/felipebacelo/WordCloud?style=for-the-badge"><img src="https://img.shields.io/github/languages/count/felipebacelo/WordCloud?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/forks/felipebacelo/WordCloud?style=for-the-badge"><img src="https://img.shields.io/github/forks/felipebacelo/WordCloud?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/pr-raw/felipebacelo/WordCloud?style=for-the-badge"><img src="https://img.shields.io/bitbucket/pr-raw/felipebacelo/WordCloud?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/issues/felipebacelo/WordCloud?style=for-the-badge"><img src="https://img.shields.io/bitbucket/issues/felipebacelo/WordCloud?style=for-the-badge"/></a>
</p>

# WordCloud
 
Repositório com Exemplo de WordCloud em R.

Este simples projeto foi desenvolvido com o objetivo de praticar alguns conceitos da linguagem de programação R.

Para construção da nuvem de palavras foi utilizado como exemplo uma composição do grande mestre Cartola.

***

### Desenvolvimento

Desenvolvido em R através do RStudio.

***

### Exemplo

Carregando o arquivo:
```r
texto<-readLines("~/LetraCartola.txt")
```
Instalando os pacotes:
```r
install.packages(c("tm"))
install.packages(c("wordcloud"))
```
Carregando os pacotes:
```r
library(tm)
library(wordcloud)
```
Utilizando Corpus para traduzir o texto em linguagem natural:
```r
doc<-Corpus(VectorSource(texto))
```
Limpando os dados:
```r
doc<-tm_map(doc, content_transformer(tolower))
doc<-tm_map(doc, removeNumbers)
doc<-tm_map(doc, removePunctuation)
doc<-tm_map(doc, stripWhitespace)
doc<-tm_map(doc, removeWords, stopwords("pt"))
```
Criando uma matriz de frequência:
```r
matriz<-TermDocumentMatrix(doc)
m<-as.matrix(matriz)
```
![Image1](https://github.com/felipebacelo/WordCloud/blob/main/IMAGES/Image1.png)
Organizando a matriz em ordem decrescente:
```r
x<-sort(rowSums(m), decreasing = TRUE)
```
![Image2](https://github.com/felipebacelo/WordCloud/blob/main/IMAGES/Image2.png)
Transformando a matriz em DataFrame:
```r
df<-data.frame(word=names(x),freq=x)
```
![Image3](https://github.com/felipebacelo/WordCloud/blob/main/IMAGES/Image3.png)

Plotagem wordcloud com frequência mínima de resultados, número máximo de palavras e cores da Estação Primeira de Mangueira em homenagem ao grande mestre Cartola:
```r
wordcloud(words=df$word, freq=df$freq, min.freq = 2,max.words=30, colors = c("magenta", "darkgreen")) 
```
![Image4](https://github.com/felipebacelo/WordCloud/blob/main/IMAGES/Image4.png)

***

### Licenças

_MIT License Copyright © 2021 Felipe Bacelo Rodrigues_
