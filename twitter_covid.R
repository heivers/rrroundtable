#load the necessary packages

library(rtweet)
library(tm)
library(SnowballC)

#Get tweets (environment variable contains the API token created by create_token())
covid_tweets = search_tweets('#covid', n=10000, include_rts = TRUE, 
                             token=environment, lang="en")

#extract text from tweets
tweets = covid_tweets$text

#create a Corpus
corpus = VCorpus(VectorSource(tweets))

#manipulate text
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
#stem the document (shall we do this?)
corpus = tm_map(corpus, stemDocument)

#create a Document Term Matrix
frequencies = DocumentTermMatrix(corpus)

frequencies

#next steps...

