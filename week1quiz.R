#week 1 quiz
#assignments week 1

#eerst downloaden
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "getdata.csv")
Idaho2006<-read.csv("getdata.csv")

library(dplyr)
#How many properties are worth $1,000,000 or more? 
count(Idaho2006, VAL == 24)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "NGAP.xlsx")
library(xlsx)
dat<- read.xlsx("data/NGAP.xlsx", sheetIndex = 1,colIndex = 7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 

#read xml data from here
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", "restaurants.xml")
library(XML)             
restaurants<-xmlTreeParse("restaurants.xml", useInternal=T)
restRoots <-xmlRoot(restaurants)
xmlName(restRoots)
names(restRoots)

#microdata
library(data.table)
DT <-fread("data/getdata_ss06p.csv")
