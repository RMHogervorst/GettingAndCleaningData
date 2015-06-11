downloadProjectFile<- function (){
        #nog een stap toevoegen waardoor die dit niet doet als het al gedaan is.
        if(!file.exists("data")) {
                dir.create("data")
        }
        if(!file.exists("data/motion.zip")) {
                #       download files
                link<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
                download.file(link, destfile="data/motion.zip") #download zip
                file_ls<-(unzip("data/motion.zip",list=T)) # maakt lijst van inhoud zip.
                
        }
        
        
}
