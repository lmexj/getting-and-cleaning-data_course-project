# Data info

## Human Activity Recognition Using Smartphones Dataset (Version 1.0) was obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of the features/measurements 

* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
* These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
* Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
* Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
* Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
* These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


# Tidy data pipeline

* Step 1. Read data from test and train folders and merge the training and the test sets to create one data set called "Merge"
* Step 2. Check "features.txt" file and extract only the measurements on the mean and standard deviation for each measurement from "Merge". 
* Step 3. Rename the activities  in descriptive activity names using "mutate" function according to variable names from "activity_labels.txt". 
* Step 4. Relabel the data set with descriptive variable names and combine all variables together. 
* Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject using ddply.


# Variables of the "Final_output" table  

## Subject: 30 volunteers can be identified by ID number from 1 to 30
## Activities performed by each subject:
* 1 WALKING
* 
2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS

* 4 SITTING
5 STANDING
* 
6 LAYING


## Measurements list

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

## Values and Units
* Only average of each measurement (indicated by "mean" in the heading from the raw data) was selected
* Unit of measurements is standard gravity "g"
