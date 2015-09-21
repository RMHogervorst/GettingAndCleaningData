#quiz week 2 getdata#
library(httr)
ch<-c(10,20,30,100)
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[ch])
#https://stackoverflow.com/questions/14383710/read-fixed-width-text-file

data<-read.fwf(
        file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
        widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
        skip = 4
)
sum(data[4])

