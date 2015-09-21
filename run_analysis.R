run_analysis<-function() {
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
        library(data.table)
        data <- data.table(data)        #for reasons that I cannot find out, the next steps only work if I use a data.table frame
        #       5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        rm(activityLabels,features,Participants, label,
           testParticipant,testX,testY,trainParticipant,
           trainX,trainY) #cleaning up the environment.
        library(dplyr)
        data<-data %>%select(Participants, label, matches("mean|std"))%>% 
                group_by(Participants, label) %>%
                summarise(tAvgBodyAccelerationX = mean(`tBodyAcc-mean()-X`),tAvgBodyAccelerationY =mean(`tBodyAcc-mean()-Y`),tAvgBodyAccelerationZ =mean(`tBodyAcc-mean()-Z`),
                          tAvgBodyAccelerationSDX =mean(`tBodyAcc-std()-X`),tAvgBodyAccelerationSDY =mean(`tBodyAcc-std()-Y`),tAvgBodyAccelerationSDZ =mean(`tBodyAcc-std()-Z`),
                          tGravityAccX = mean(`tGravityAcc-mean()-X`),tGravityAccY = mean(`tGravityAcc-mean()-Y`),tGravityAccZ = mean(`tGravityAcc-mean()-Z`), 
                          tGravityAccSDX = mean(`tGravityAcc-std()-X`),tGravityAccSDY = mean(`tGravityAcc-std()-Y`),tGravityAccSDZ = mean(`tGravityAcc-std()-Z`),
                          tBodyAccJerkX = mean(`tBodyAccJerk-mean()-X`),tBodyAccJerkY = mean(`tBodyAccJerk-mean()-Y`),tBodyAccJerkZ = mean(`tBodyAccJerk-mean()-Z`),
                          tBodyAccJerkSDX = mean(`tBodyAccJerk-std()-X`),tBodyAccJerkSDY = mean(`tBodyAccJerk-std()-Y`),tBodyAccJerkSDZ = mean(`tBodyAccJerk-std()-Z`),
                          tBodyGyroX = mean(`tBodyGyro-mean()-X`), tBodyGyroY = mean(`tBodyGyro-mean()-Y`),tBodyGyroZ = mean(`tBodyGyro-mean()-Z`),
                          tBodyGyroSTDX = mean(`tBodyGyro-std()-X`), tBodyGyroSTDY = mean(`tBodyGyro-std()-Y`),tBodyGyroSTDZ = mean(`tBodyGyro-std()-Z`),
                          tBodyGyroJerkX = mean(`tBodyGyroJerk-mean()-X`),tBodyGyroJerkY = mean(`tBodyGyroJerk-mean()-Y`),tBodyGyroJerkZ = mean(`tBodyGyroJerk-mean()-Z`),
                          tBodyGyroJerkSDX = mean(`tBodyGyroJerk-std()-X`),tBodyGyroJerkSDY = mean(`tBodyGyroJerk-std()-Y`),tBodyGyroJerkSDZ = mean(`tBodyGyroJerk-std()-Z`),
                          tBodyAccMag = mean(`tBodyAccMag-mean()`),
                          tBodyAccMagSD = mean(`tBodyAccMag-std()`),
                          fBodyAccX = mean(`fBodyAcc-mean()-X`),fBodyAcc = mean(`fBodyAcc-mean()-Y`),fBodyAccZ = mean(`fBodyAcc-mean()-Z`),
                          fBodyAccSDX = mean(`fBodyAcc-std()-X`),fBodyAccSDY = mean(`fBodyAcc-std()-Y`),fBodyAccSDZ = mean(`fBodyAcc-std()-Z`),
                          fBodyAccMeanFreqX = mean(`fBodyAcc-meanFreq()-X`),fBodyAccMeanFreqY = mean(`fBodyAcc-meanFreq()-Y`),fBodyAccMeanFreqZ = mean(`fBodyAcc-meanFreq()-Z`),
                          fBodyAccJerkMeanX = mean(`fBodyAccJerk-mean()-X`),fBodyAccJerkMeanY = mean(`fBodyAccJerk-mean()-Y`),fBodyAccJerkMeanZ = mean(`fBodyAccJerk-mean()-Z`),
                          fBodyAccJerkSDX = mean(`fBodyAccJerk-std()-X`),fBodyAccJerkSDY = mean(`fBodyAccJerk-std()-Y`),fBodyAccJerkSDZ = mean(`fBodyAccJerk-std()-Z`),
                          fBodyAccJerkFreqX = mean(`fBodyAccJerk-meanFreq()-X`),fBodyAccJerkFreqY = mean(`fBodyAccJerk-meanFreq()-Y`),fBodyAccJerkFreqZ = mean(`fBodyAccJerk-meanFreq()-Z`),
                          fBodyGyroMeanX = mean(`fBodyGyro-mean()-X`),fBodyGyroMeanY = mean(`fBodyGyro-mean()-Y`),fBodyGyroMeanZ = mean(`fBodyGyro-mean()-Z`),
                          fBodyGyroSDX = mean(`fBodyGyro-std()-X`),fBodyGyroSDY = mean(`fBodyGyro-std()-Y`),fBodyGyroSDZ = mean(`fBodyGyro-std()-Z`),
                          fBodyGyroFreqX = mean(`fBodyGyro-meanFreq()-X`),fBodyGyroFreqY = mean(`fBodyGyro-meanFreq()-Y`),fBodyGyroFreqZ = mean(`fBodyGyro-meanFreq()-Z`),
                          fBodyAccMag = mean(`fBodyAccMag-mean()`),
                          fBodyAccMagSD = mean(`fBodyAccMag-std()`),
                          fBodyAccMagFreq = mean (`fBodyAccMag-meanFreq()`),
                          fBodyBodyAccJerkMag = mean(`fBodyBodyAccJerkMag-mean()`),
                          fBodyBodyAccJerkMagSD = mean(`fBodyBodyAccJerkMag-std()`),
                          fBodyBodyAccJerkMagFreq = mean(`fBodyBodyAccJerkMag-meanFreq()`),
                          fBodyBodyGyroMag = mean(`fBodyBodyGyroMag-mean()`),
                          fBodyBodyGyroMagSD = mean(`fBodyBodyGyroMag-std()`),
                          fBodyBodyGyroMagFreq = mean(`fBodyBodyGyroMag-meanFreq()`),
                          BodyBodyGyroJerkMag = mean(`fBodyBodyGyroJerkMag-mean()`),
                          fBodyBodyGyroJerkMagSD = mean(`fBodyBodyGyroJerkMag-std()`),
                          fBodyBodyGyroJerkMagFreq = mean(`fBodyBodyGyroJerkMag-meanFreq()`),
                          angle_tBodyAccMeanGravity = mean(`angle(tBodyAccMean,gravity)`),
                          angle_tBodyAccJerkMeanGravityMean = mean(`angle(tBodyAccJerkMean),gravityMean)`),
                          angle_tBodyGyroMeanGravityMean = mean(`angle(tBodyGyroMean,gravityMean)`),
                          angle_tBodyGyroJerkMeanGravityMean = mean(`angle(tBodyGyroJerkMean,gravityMean)`),
                          angle_GravityMeanX = mean(`angle(X,gravityMean)`), angle_GravityMeanY = mean(`angle(Y,gravityMean)`),angle_GravityMeanZ = mean(`angle(Z,gravityMean)`)
                          )#closing bracket of summarise function 
                
        }
