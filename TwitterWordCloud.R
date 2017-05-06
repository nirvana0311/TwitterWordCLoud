searchEngineKeyWord="chelsea"
require(tm)
require(twitteR)
require(RCurl)
require(wordcloud)
Consumer_Key="OPPA5VhYKtsRugJBYyYQvIEWQ"
Consumer_Secret ="8KAJDzmLog4Tjfwl2bMGPdqftMAN9uHdAxv01frkEZXfjrrjbT"
Access_Token=	"129692093-51O6nZGHOAluZ77k12wnaFTRi5JfndPb2J5XxyxT"
Access_Token_Secret=	"0buLfcCCVtNcKlr3YClmdj4gT0cPWgz7o6k1G3JgaFYvn"
setup_twitter_oauth(consumer_key = Consumer_Key,consumer_secret = Consumer_Secret,access_token = Access_Token,access_secret = Access_Token_Secret)
chels_tweets=searchTwitter(searchEngineKeyWord,n = 500,lang = "en",resultType = 'recent')

chels_char=sapply(chels_tweets, function(x) x$getText())
chels_clean=Corpus(VectorSource(chels_char))
chels_clean=tm_map(chels_clean,removePunctuation)
chels_clean=tm_map(chels_clean,content_transformer(tolower))
chels_clean=tm_map(chels_clean,removeWords,stopwords("english"))
chels_clean=tm_map(chels_clean,removeNumbers)
chels_clean=tm_map(chels_clean,stripWhitespace)
wordcloud(chels_clean,scale = c(3,0.7),random.order = F,colors =brewer.pal(6, "Dark2") )
