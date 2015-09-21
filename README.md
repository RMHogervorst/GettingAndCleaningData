# GettingAndCleaningData
This is a repo for the Coursera Course Getting and Cleaning Data. 
The script run_analysis.R works on the dataset from the following publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##run_analysis.R
This repo has the script run_analysis.R. This script requires data.table and dplyr.
If you have the Samsungdata in your main directory (but still in the folders train/ en test/), 
*if you have the files loose from the folders, follow this link*, 
this script will load the different .txt files and combines them to one dataframe called data. 

After merging of the files the old files will be removed and in 3 steps linked with piping (`%>%`).
Out off the 561 variables only participants, label and variables that have mean or std in the name are selected.
Then the dataset is grouped on participant and activity. 
And finally a tidy dataset is created with means of the 80+ variables per subject and activity.

##Original README from the authors
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

##renaming of the variables
I renamed all the variables because R can't handle files with minus signs. 
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
