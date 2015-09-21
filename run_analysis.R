run_analysis<-function() {
       library(data.table)
#      1.  Merges the training and the test sets to create one data set.
#   load all parts of the testset
        testParticipant <- read.table("data/test/subject_test.txt")
        testX <- read.table("data/test/X_test.txt")
        testY <- read.table("data/test/y_test.txt")
#       load parts of the trainingset
        trainParticipant <- read.table("data/train/subject_train.txt")
        trainX <- read.table("data/train/X_train.txt")
        trainY <- read.table("data/train/y_train.txt")
#       load the features
        features <- read.table("data/features.txt")
        activityLabels <- read.table("data/activity_labels.txt")
        
        Participants <- rbind(testParticipant, trainParticipant)
        colnames(Participants) <- "Participants"
        # Merge the test and train labels, applying the textual labels
        label <- rbind(testY, trainY)
        label <- merge(label, activityLabels, by=1)[,2]
        
        data <- rbind(testX, trainX)
        colnames(data) <- features[, 2]
# Merge all three datasets
        data <- cbind(Participants, label, data)
        data <- data.table(data)        
        
#       2. Extracts only the measurements on the mean 
        #and standard deviation for each measurement. 
        #       3. Uses descriptive activity names to name the activities in the data set
        #happened in the first steps
        #       4. Appropriately labels the data set with descriptive variable names. 
        #        
        #       5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        rm(activityLabels,features,Participants, label,
           testParticipant,testX,testY,trainParticipant,
           trainX,trainY) #cleaning up the environment.
        library(dplyr)
        data %>%select(data, Participants, label, matches("mean|std"))%>% 
                group_by(Participants, label) %>%
                summarise(mean)%>% #mean of values. 
                select(
                   ParticipantNumber = Participants, 
                   Activity = label,
                   AveragetBodyAccMean=sum(`tBodyAcc-mean()-X`,`tBodyAcc-mean()-Y`,`tBodyAcc-mean()-Z`)/3,
                   AveragetBodyAccSTD = sum(`tBodyAcc-std()-X`,`tBodyAcc-std()-Y`,`tBodyAcc-std()-Z`)/3,
                   AveragetGravityAccMean = sum(`tGravityAcc-mean()-X`,`tGravityAcc-mean()-Y`,`tGravityAcc-mean()-Z`)/3,
                   AveragetGravityAccSTD = sum(`tGravityAcc-std()-X`,`tGravityAcc-std()-Y`,`tGravityAcc-std()-Z`)/3,
                   AveragetBodyAccJerkMean = sum(`tBodyAccJerk-mean()-X`,`tBodyAccJerk-mean()-Y`,`tBodyAccJerk-mean()-Z`)/3,
                   AveragetBodyAccJerkSTD = sum(`tBodyAccJerk-std()-X`,`tBodyAcc-std()-Y`, `tBodyAcc-std()-Z`)/3,
                   AveragetBodyGyroMean = sum(`tBodyGyro-mean()-X`,`tBodyGyro-mean()-Y`,`tBodyGyro-mean()-Z`)/3,
                   AveragetBodyGyroSTD = sum(`tBodyGyro-std()-X`,`tBodyGyro-std()-Y`,`tBodyGyro-std()-Z`)/3,
                   AveragetBodyGyroJerkMean = sum(`tBodyGyroJerk-mean()-X`,`tBodyGyroJerk-mean()-Y`,`tBodyGyroJerk-mean()-Z`)/3,
                   AveragetBodyGyroJerkSTD = sum(`tBodyGyroJerk-std()-X`,`tBodyGyroJerk-std()-Y`,`tBodyGyroJerk-std()-Z`)/3,
                   AveragetBodyGyroJerkMagMean =sum(`tBodyGyroJerk-mean()-X`,`tBodyGyroJerk-mean()-Y`,`tBodyGyroJerk-mean()-Z`)/3,
                   AveragetBodyGyroJerkMagSTD = sum(`tBodyGyroJerk-std()-X`,`tBodyGyroJerk-std()-Y`,`tBodyGyroJerk-std()-Z`)/3,
                   tBodyAccMagMean = `tBodyAccMag-mean()`,
                   tBodyAccMagSTD = `tBodyAccMag-std()`,
                   tBodyAccJerkMagMean =`tBodyAccJerkMag-mean()`,
                   tBodyAccJerkMagSTD =`tBodyAccJerkMag-std()`,
                   tBodyGyroJerkMagMean= `tBodyGyroJerkMag-mean()`,
                   tBodyGyroJerkMagSTD = `tBodyGyroJerkMag-std()`,
                   AveragefBodyAccMean =sum(`fBodyAcc-mean()-X`,`fBodyAcc-mean()-Y`,`fBodyAcc-mean()-Z`)/3,
                   AveragefBodyAccSTD = sum(`fBodyAcc-std()-X`,`fBodyAcc-std()-Y`,`fBodyAcc-std()-Z`)/3,
                   AveragefBodyAccMeanFreq = sum(`fBodyAcc-meanFreq()-X`, `fBodyAcc-meanFreq()-Y`,`fBodyAcc-meanFreq()-Z`)/3,
                   AveragefBodyAccJerkMean = sum(`fBodyAccJerk-mean()-X`,`fBodyAccJerk-mean()-Y`,`fBodyAccJerk-mean()-Z`)/3,
                   AveragefBodyAccJerkSTD = sum(`fBodyAccJerk-std()-X`,`fBodyAccJerk-std()-Y`,`fBodyAccJerk-std()-Z`)/3,
                   fBodyAccMagMean = `fBodyAccMag-mean()`,
                   fBodyAccMagSTD = `fBodyAccMag-std()`,
                   fBodyAccJerkMeanFreqMean = sum(`fBodyAccJerk-meanFreq()-X`, `fBodyAccJerk-meanFreq()-Y`,`fBodyAccJerk-meanFreq()-Z`)/3,
                   fBodyBodyAccJerkMagMEAN =`fBodyBodyAccJerkMag-mean()`,
                   fBodyBodyAccJerkMagSTD = `fBodyBodyAccJerkMag-std()`,
                   AveragefBodyGyroMean = sum(`fBodyGyro-mean()-X`,`fBodyGyro-mean()-Y`,`fBodyGyro-mean()-Z`)/3,
                   AveragefBodyGyroSTD = sum(`fBodyGyro-std()-X`,`fBodyGyro-std()-Y`,`fBodyGyro-std()-Z`)/3,
                   AveragefBodyGyroMEANFreq = sum(`fBodyGyro-meanFreq()-X`,`fBodyGyro-meanFreq()-Y`, `fBodyGyro-meanFreq()-Z`)/3,                   
                   fBodyAccMagMeanFreq = `fBodyAccMag-meanFreq()`,                        
                   BodyBodyAccJerkMagMEANFreq = `fBodyBodyAccJerkMag-meanFreq()`,                    
                   fBodyBodyGyroMagSTD = `fBodyBodyGyroMag-std()` , 
                   fBodyBodyGyroMagMEANFreq = `fBodyBodyGyroMag-meanFreq()` ,         
                   fBodyBodyGyroJerkMagMEAN = `fBodyBodyGyroJerkMag-mean()`,
                   fBodyBodyGyroJerkMagSTD = `fBodyBodyGyroJerkMag-std()`,
                   fBodyBodyGyroJerkMagMEANFreq = `fBodyBodyGyroJerkMag-meanFreq()`,      
                   angletBodyAccMeanGravity =`angle(tBodyAccMean,gravity)`         ,
                   angletBodyAccJerkMeanGravityMean=`angle(tBodyAccJerkMean),gravityMean)`,
                   angletBodyGyroMEANGravityMean =`angle(tBodyGyroMean,gravityMean)`,
                   angletBodyGyroJerkMeanGravityMean =`angle(tBodyGyroJerkMean,gravityMean)`,
                   AverageangleGravityMean =sum(`angle(X,gravityMean)`,`angle(Y,gravityMean)` ,`angle(Z,gravityMean)`)/3) %>%
                
        
        
        }
