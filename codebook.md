# Coursera Getting and Cleaning Data Course Project Codebook


##Introduction

[taken from the features.txt documement]
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## Data Sets

The following files were downloaded as part of the course data files. These represent the raw data files.

- `x_train.txt`, `y_train.txt`, `x_test.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`
- `features.txt` contains the column names for the `x_` datasets. 
-  'activity.txt' contains the values for each of the activities.



The following are the tidy datasets:

- The x_ datasets were merged together to form the dataset merged_x
- The y_ datasets were merged together to form the dataset merged_y
- The subject_ datasets were merged together to form the dataset merged_subject
- All the merged dataset were merged together to form a single dataset called 'completed_data'. 
- The fields in the completed_data were transform to contain the mean for each activity and subject. The result is stored in a dataset called averages. 
- The averages dataset was written as text file called average_tidy_data.txt


##Identifiers


The following variables are used to identity the subject and activity

- Subject - an unique integer used to identity a subject
- Activity - identities the activity with the following values
  - Walking (Value 1)
  - Walking Upstairs (Value 2)
  - Walking Downstairs (Value 3)
  - Sitting (Value 4)
  - Standing (Value 5)
  - Laying  (Value 6)

##Measurements

Each variable is the mean of a measurement for a subject and activity. Each measurement is a floating point number.

- tBodyAcc_Mean_X
- tBodyAcc_Mean_Y
- tBodyAcc_Mean_Z
- tBodyAcc_Std_X
- tBodyAcc_Std_Y
- tBodyAcc_Std_Z
- tGravityAcc_Mean_X
- tGravityAcc_Mean_Y
- tGravityAcc_Mean_Z
- tGravityAcc_Std_X
- tGravityAcc_Std_Y
- tGravityAcc_Std_Z
- tBodyAccJerk_Mean_X
- tBodyAccJerk_Mean_Y
- tBodyAccJerk_Mean_Z
- tBodyAccJerk_Std_X
- tBodyAccJerk_Std_Y
- tBodyAccJerk_Std_Z
- tBodyGyro_Mean_X
- tBodyGyro_Mean_Y
- tBodyGyro_Mean_Z
- tBodyGyro_Std_X
- tBodyGyro_Std_Y
- tBodyGyro_Std_Z
- tBodyGyroJerk_Mean_X
- tBodyGyroJerk_Mean_Y
- tBodyGyroJerk_Mean_Z
- tBodyGyroJerk_Std_X
- tBodyGyroJerk_Std_Y
- tBodyGyroJerk_Std_Z
- tBodyAccMag_Mean_
- tBodyAccMag_Std_
- tGravityAccMag_Mean_
- tGravityAccMag_Std_
- tBodyAccJerkMag_Mean_
- tBodyAccJerkMag_Std_
- tBodyGyroMag_Mean_
- tBodyGyroMag_Std_
- tBodyGyroJerkMag_Mean_
- tBodyGyroJerkMag_Std_
- fBodyAcc_Mean_X
- fBodyAcc_Mean_Y
- fBodyAcc_Mean_Z
- fBodyAcc_Std_X
- fBodyAcc_Std_Y
- fBodyAcc_Std_Z
- fBodyAcc_Mean_FreqX
- fBodyAcc_Mean_FreqY
- fBodyAcc_Mean_FreqZ
- fBodyAccJerk_Mean_X
- fBodyAccJerk_Mean_Y
- fBodyAccJerk_Mean_Z
- fBodyAccJerk_Std_X
- fBodyAccJerk_Std_Y
- fBodyAccJerk_Std_Z
- fBodyAccJerk_Mean_FreqX
- fBodyAccJerk_Mean_FreqY
- fBodyAccJerk_Mean_FreqZ
- fBodyGyro_Mean_X
- fBodyGyro_Mean_Y
- fBodyGyro_Mean_Z
- fBodyGyro_Std_X
- fBodyGyro_Std_Y
- fBodyGyro_Std_Z
- fBodyGyro_Mean_FreqX
- fBodyGyro_Mean_FreqY
- fBodyGyro_Mean_FreqZ
- fBodyAccMag_Mean_
- fBodyAccMag_Std_
- fBodyBodyAccJerkMag_Mean_
- fBodyBodyAccJerkMag_Std_
-  fBodyBodyGyroMag_Mean_
- fBodyBodyGyroMag_Std_
- fBodyBodyGyroJerkMag_Mean_
- fBodyBodyGyroJerkMag_Std_
- fBodyBodyGyroJerkMag_Mean_Freq
- angle(tBodyAccMean,gravity)
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)
- angle(Y,gravityMean)
- angle(Z,gravityMean)