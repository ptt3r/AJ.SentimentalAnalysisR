library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
SKohli <- read.csv(file.choose(), header = T)
tweets <- iconv(SKohli$text, to = "UTF-8", sub="byte")
s <- get_nrc_sentiment(tweets)
head(s)
tweets[1000]
get_nrc_sentiment('joy')
barplot(colSums(s),
        las=2,
        col=rainbow(20),
        ylab='count',
        main='Sentimental Scores for Kohli Tweets')
SKohli <- read.csv(file.choose(), header = T)
str(SKohli)

library(tm)
install.packages("slam")
library(tm)
install.packages("pacman")
pacman::p_load(tm)
corpus <- iconv(SKohli$text, to = "UTF-8", sub="byte")
corpus <-Corpus(VectorSource(corpus))
inspect(corpus[1:5])

#clean text
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:5])
corpus <- tm_map(corpus, removeNumbers)
cleanset <- tm_map(corpus, removeWords, stopwords('english'))
removeURL <- function(x) gsub('http[[:alnum:]]*','',x)
cleanset <- tm_map(cleanset, content_transformer(removeURL))
inspect(corpus[1:1000])
cleanset <- tm_map(cleanset, stripWhitespace)
tdm <- TermDocumentMatrix(cleanset)
tdm
tdm <- as.matrix(tdm)
tdm[1:100, 1:200]
w <- rowSums(tdm)
barplot(w,
        las = 2,
        col= rainbow(50))
s <- get_nrc_sentiment(tweets)
write.csv(s,"C:\\Users\\User\\Desktop\\SKohli.csv")
write.csv(tdm,"C:\\Users\\User\\Desktop\\SKohli1.csv")
