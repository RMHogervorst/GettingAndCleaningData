# GettingAndCleaningData
This is a repo for the Coursera Course Getting and Cleaning Data. 

##run_analysis.R
This repo has the script run_analysis.R. This script requires data.table and dplyr.
If you have the Samsungdata in your main directory (but still in the folders train/ en test/), 
*if you have the files loose from the folders, follow this link*, 
this script will load the different .txt files and combines them to one dataframe called data. 

After merging of the files the old files will be removed and in 3 steps linked with piping (`%>%`).
Out off the 561 variables only participants, label and variables that have mean or std in the name are selected.
Then the dataset is grouped on participant and activity. 
And finally a tidy dataset is created with means of the 80+ variables per subject and activity.

##renaming of the variables / codebook.
I renamed all the variables because they were a pain in the back frankly.

The first character is time (t) or frequency (f) just as in original data.
The last character of the variablename is the X,Y, or Z direction except when there is no such thing.
Of course the output values are averaged per subject and activity.
Names are kept as close to original but without minus signs.
###Recoded list.  (substitute X for X, Y, and Z)
- Participantnummer     recoded into Participants
- label                 recoded into activity
- tBodyAcc-mean()-X  			recoded into tAvgBodyAccelerationX
- tBodyAcc-std()-X 			recoded into tAvgBodyAccelerationSDX
- tGravityAcc-mean()-X 		recoded into tGravityAccX
- tGravityAcc-std()-X			recoded into tGravityAccSDX
- tBodyAccJerk-mean()-X		recoded into tBodyAccJerkX
- tBodyAccJerk-std()-X		recoded into tBodyAccJerkSDX
- tBodyGyro-mean()-X			recoded into tBodyGyroX
- tBodyGyro-std()-X			recoded into tBodyGyroSTDX
- tBodyGyroJerk-mean()-X		recoded into tBodyGyroJerkX
- tBodyGyroJerk-std()-X		recoded into tBodyGyroJerkSDX
- tBodyAccMag-mean()			recoded into tBodyAccMag
- tBodyAccMag-std()			recoded into tBodyAccMagSD
- fBodyAcc-mean()-X			recoded into fBodyAccX
- fBodyAcc-std()-X			recoded into fBodyAccSDX
- fBodyAcc-meanFreq()-X		recoded into fBodyAccMeanFreqX
- fBodyAccJerk-mean()-X		recoded into fBodyAccJerkMeanX
- fBodyAccJerk-std()-X		recoded into fBodyAccJerkSDX
- fBodyAccJerk-meanFreq()-X 	recoded into fBodyAccJerkmMeanFreqX
- fBodyGyro-mean()-X			recoded into fBodyGyroX
- fBodyGyro-std()-X			recoded into fBodyGyroSDx
- fBodyGyro-meanFreq()-X		recoded into fBodyGyroFreqX
- fBodyAccMag-mean()			recoded into fBodyAccMag
- fBodyAccMag-std()			recoded into fBodyAccMagSD
- fBodyAccMag-meanFreq()		recoded into fBodyAccMagFreq
- fBodyBodyAccJerkMag-mean()  recoded into fBodyBodyAccJerkMag
- fBodyBodyAccJerkMag-std()	recoded into fBodyBodyAccJerkMagSD
- fBodyBodyAccJerkMag-meanFreq() recoded into fBodyBodyAccJerkMagFreq
- fBodyBodyGyroMag-mean()		recoded into fBodyBodyGyroMag
- fBodyBodyGyroMag-std()		recoded into fBodyBodyGyroMagSD
- fBodyBodyGyroMag-meanFreq() recoded into fBodyBodyGyroMagFreq
- fBodyBodyGyroJerkMag-mean() recoded into fBodyBodyGyroJerkMag
- fBodyBodyGyroJerkMag-std() 	recoded into fBodyBodyGyroJerkMagSD
- fBodyBodyGyroJerkMag-meanFreq() recoded into fBodyBodyGyroJerkMagFreq
- angle(tBodyAccMean,gravity)	recoded into angle_tBodyAccMeanGravity
- angle(tBodyAccJerkMean),gravityMean) recoded into angle_tBodyAccJerkMeanGravityMean
- angle(tBodyGyroMean,gravityMean) recoded into angle_tBodyGyroMeanGravityMean
- angle(tBodyGyroJerkMean,gravityMean) recoded into angle_tBodyGyroJerkMeanGravityMean
- angle(X,gravityMean) 		recoded into angle_GravityMeanX


###system at moment of creation.
Rstudio Version 0.99.483
R version 3.2.2 (2015-08-14)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 8 x64 (build 9200)

locale:
[1] LC_COLLATE=Dutch_Netherlands.1252  LC_CTYPE=Dutch_Netherlands.1252   
[3] LC_MONETARY=Dutch_Netherlands.1252 LC_NUMERIC=C                      
[5] LC_TIME=Dutch_Netherlands.1252    
