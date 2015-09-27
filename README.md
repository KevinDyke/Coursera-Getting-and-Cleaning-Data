# Coursera-Getting-and-Cleaning-Data
Repo for the project in the Coursera Getting and Cleaning Data course

#Introduction

This document describes the steps taken for the Coursera Getting and Cleaning Data Course Project. The raw datasets are taken from a Samsung Galaxy S smartphone. A series of subjects were asked to carry out different activities such as walking. From this data a series of training and test datasets were gathered for a machine learning project.

The aim of the project was to take the raw datasets, see the codebook [Codebook.md] and to apply a series of steps to produce a single tidy dataset.

The original datasets can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The data is described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The data was transformed using five steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script to complete steps 1 to 5 is called run_analysis.R

## Step 1 Merges the training and the test sets to create one data set

The raw data files were downloaded and examined. From the examination three types of data sets were found:

1. datasets starting with x_. These contain the sensor data. The datasets x\_train and x\_test were merged to form merged\_x.
2. datasets starting with y\_. These identity the type of activity carried out by each row in the x\_ dataset. The datasets y\_train and y\_test were merged to form merged\_y.
3. datasets starting with subject\_. These identity the subject who carried out by each row in the x\_ datasets. The datasets subject\_train and subject\_test were merged to form merged\_subject.

The actual merging of all the datasets in a single dataset was transferred to step 5 to allow easier transformation of the datasets.

## Step 2 Extracts only the measurements on the mean and standard deviation for each measurement

The original x\_ datasets contain over 500 columns. The course project is only concerned with the mean and standard deviation values. 

To do this the second column of the features.txt which highlights the variable names was loaded into a vector. The grep command was used to filter out names which did not contain 'mean' or 'std' into a second vector. This second vector was used to filter out the unwanted columns in the merged\_x dataset. Finally the second vector was used to rename the columns names in merged\_x dataset.

## Step 3 Uses descriptive activity names to name the activities in the data set

The second column (activity names) from activity.txt was loaded into a table. This was forced to be a character type to ensure the table only contains string data. This table was used to replace the first row (activity number) in the merged\_y dataset with the activity name. Afterwards the first column name in merged\_y was changed to 'activity'.

## Step 4 Appropriately labels the data set with descriptive variable names

The global substitute command (gsub) was used to carry out the following transforms in merged\_x:

- any column name containing '-mean' was changed to '_Mean'
- any column name containing '-std' was changed to '_Std'
- The backets and dash part of each column name was removed
- Any column name containing 'BodyBody' was changed to a single instance of 'Body'
- The first column name was changed to 'subject' 

## Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The three datasets (merged\_x, merged\_y and merged\_subject) were merged together. This single dataset was named completed_data. 

As the indexing columns (activity and subject) were now the last two columns of the dataset, they were moved to the front. 

The ddply command from the plyr package was used to calculate the averages of each of the columns in each row. This excludes the activity and subject columns. This calculation was stored in a dataset called 'averages'.

Finally this last dataset was written in the form of a table as 'average_tidy_data.txt'. The data was stored without row names. 
      