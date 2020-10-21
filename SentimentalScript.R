library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
apple <- read.csv(file.choose(), header = T)
tweets <- iconv(apple$text, to = "UTF-8", sub="byte")
s <- get_nrc_sentiment(tweets)
barplot(colSums(s),
        las=2,
        col=rainbow(10),
        ylab='count',
        main='Shai Hope Sentimental Score before Afganistan Series')
head (s)

write.csv(s,"C:\\Users\\User\\Desktop\\Shai Hope.csv")
