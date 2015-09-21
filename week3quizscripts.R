#week3 quiz

link<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(link, destfile="pums.csv")
pums<-read.csv("pums.csv")
#Create a logical vector that identifies the households on greater 
#than 10 acres who sold more than $10,000 worth of agriculture products. 
#Assign that logical vector to the variable agricultureLogical
agricultureLogical <- c(ACR=3, AGS =6)
#https://class.coursera.org/getdata-032/forum/thread?thread_id=157
#myLogicalVector <- X == "apple" 
#which(myLogicalVector)

library(dplyr)
head(filter(pums, ACR ==3, AGS ==6),3)

library(jpeg)
fotolink<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"        
download.file(fotolink, destfile = "jeff.jpg", mode = "wb")
jeff<-readJPEG(source="jeff.jpg", native=T)        
quantile(jeff, probs = c(.3, .8))
