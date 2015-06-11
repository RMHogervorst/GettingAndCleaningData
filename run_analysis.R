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
        
        
#       2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        
#       3. Uses descriptive activity names to name the activities in the data set
#       4. Appropriately labels the data set with descriptive variable names. 
#        
#       5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
}
